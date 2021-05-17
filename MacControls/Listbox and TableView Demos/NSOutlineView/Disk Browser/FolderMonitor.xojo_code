#tag Class
Protected Class FolderMonitor
	#tag Method, Flags = &h0
		Sub Constructor(path as String, callee as FolderChangedProc)
		  if path.Left(1) <> "/" then
		    raise new InvalidParentException ' Paths may not be relative
		  end if
		  
		  if path.Right(1) <> "/" then
		    // Paths need to end in a "/" for matching in handleFSEvent()
		    path = path + "/"
		  end if
		  
		  // Determine if this path requires us to watch a new FSEvents root path
		  dim needsNewRoot as Boolean, commonPath as String
		  if gWatcher = nil or gCurrentFSEventsPath = "" then
		    needsNewRoot = true
		    commonPath = path
		    if DefaultLatencyInSeconds <= 0 then DefaultLatencyInSeconds = 1 ' default: 1 second
		  else
		    commonPath = determineCommonPath (path, gCurrentFSEventsPath)
		    if commonPath.Len < gCurrentFSEventsPath.Len then
		      // This means that the new path is a parent of the currently used FSEvents path
		      needsNewRoot = true
		    end if
		  end if
		  
		  if needsNewRoot then
		    // By monitoring the root dir, we learn about changes even on other volumes, including network volumes
		    dim since as UInt64
		    if gWatcher = nil then
		      // Let's start watching now
		      since = FSEventsMBS.kFSEventStreamEventIdSinceNow
		    else
		      // Let's start watching from the currently last reported event
		      gWatcher.Stop
		      since = gWatcher.GetLatestEventId
		      gWatcher = nil
		    end if
		    gCurrentFSEventsPath = commonPath
		    gWatcher = new FSEventsMBS (gCurrentFSEventsPath, since, DefaultLatencyInSeconds, 0)
		    AddHandler gWatcher.Callback, AddressOf handleFSEvent
		    if not gWatcher.Start then
		      break ' huh?
		      raise new UnsupportedOperationException
		    end if
		  end if
		  
		  if gClientPaths = nil then
		    gClientPaths = new Dictionary
		  end
		  
		  dim v as Variant = gClientPaths.Lookup (path, nil)
		  if v is nil then
		    gClientPaths.Value (path) = callee
		  else
		    // we already watch this path - the value may be a single entry or type FolderChangedProc or an array of them
		    if v isA FolderChangedProc then
		      // turn the Dictionary's value into an array
		      if v = callee then
		        break // we've already registered this one
		        return ' we do not want to set mPath and mCallee so that the Destructor won't release this duplicate
		      end
		      dim callees() as FolderChangedProc
		      callees.Append v
		      callees.Append callee
		      gClientPaths.Value (path) = callees
		    else
		      // it's already an array - add to it
		      dim callees() as FolderChangedProc = v
		      if callees.IndexOf (callee) >= 0 then
		        break // we've already registered this one
		        return ' we do not want to set mPath and mCallee so that the Destructor won't release this duplicate
		      end if
		      callees.Append callee
		    end if
		  end if
		  
		  mPath = path
		  mCallee = callee
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  if mCallee = nil then
		    // this was a duplicate
		    return
		  end if
		  
		  dim v as Variant = gClientPaths.Lookup (mPath, nil)
		  if v is nil then
		    break ' huh?
		  elseif v isA FolderChangedProc then
		    if v <> mCallee then
		      break ' huh?
		    else
		      gClientPaths.Remove (mPath)
		    end if
		  else
		    // it's an array - remove our callee from it
		    dim callees() as FolderChangedProc = v
		    dim idx as Integer = callees.IndexOf (mCallee)
		    if idx < 0 then
		      break ' huh?
		    else
		      callees.Remove idx
		      if callees.Ubound < 0 then
		        gClientPaths.Remove (mPath)
		      end if
		    end if
		  end if
		  
		  if gClientPaths.Count = 0 then
		    // No more clients -> dispose of the FSEvents watcher
		    gWatcher = nil
		    gClientPaths = nil
		    gCurrentFSEventsPath = ""
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function determineCommonPath(path1 as String, path2 as String) As String
		  dim dirs1() as String = path1.Split("/")
		  dim dirs2() as String = path2.Split("/")
		  dim n as Integer = Min (dirs1.Ubound-1, dirs2.Ubound-1)
		  dim i as Integer
		  for i = 1 to n
		    if dirs1(i) <> dirs2(i) then
		      exit
		    end if
		  next
		  redim dirs1(i)
		  dirs1(i) = ""
		  dim res as String = Join (dirs1, "/")
		  return res
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub FolderChangedProc(path as String)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Shared Sub handleFSEvent(sender as FSEventsMBS, index as Integer, count as Integer, path as string, flags as Integer, eventID as UInt64)
		  #if DebugBuild and Logging
		    System.DebugLog "handleFSEvent: "+path
		  #endif
		  
		  if gClientPaths <> nil then
		    dim v as Variant = gClientPaths.Lookup (path, nil)
		    if v = nil then
		      ' we're not monitoring this path
		    else
		      #if DebugBuild and Logging
		        System.DebugLog " -> notifiying"
		      #endif
		      if v isA FolderChangedProc then
		        dim callee as FolderChangedProc = v
		        callee.Invoke (path)
		      else
		        // it's an array - call all callees in it
		        dim callees() as FolderChangedProc = v
		        for each callee as FolderChangedProc in callees
		          callee.Invoke (path)
		        next
		      end if
		    end if
		  end if
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		This class was written on 8 Mar 2017 by Thomas Tempelmann, tempelmann@gmail.com.
		You may use this code freely without restrictions.
		
		It provides an easy way to monitor changes to particular folders. It uses the MBS plugin's
		FSEventsMBS class. While the FSEventsMBS is meant to monitor not only just one folder
		but also all its contained folders, this class makes it possible to instead just pick single
		folders (by their paths, which you can obtain with FolderItem.UnixpathMBS) and get a
		callback when one of them changes.
		
		This class takes care of all the management requires for this, such as having multiple
		watchers interested in the same path, and disposing of the FSEventsMBS watcher once
		there's no monitoring requested any more.
		
		To use it, write something like
		
		   dim monitor as new FolderMonitor (file.UnixpathMBS, AddressOf handleFolderChange)
		
		and then store 'monitor' in a property for as long as you want the given folder monitored.
		
		You also have to implement a method like this:
		
		  sub handleFolderChange (path as String)
		
		It will be called once the given folder has changed, with up to about a second delay, usually.
		
		See FolderMonitorTestWin for a demo.
		
	#tag EndNote


	#tag Property, Flags = &h0
		Shared DefaultLatencyInSeconds As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Key: path as String, Value: callee as FolderChangedProc or an array of them.
			
		#tag EndNote
		Private Shared gClientPaths As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared gCurrentFSEventsPath As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared gWatcher As FSEventsMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCallee As FolderChangedProc
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPath As String
	#tag EndProperty


	#tag Constant, Name = Logging, Type = Boolean, Dynamic = False, Default = \"true", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
