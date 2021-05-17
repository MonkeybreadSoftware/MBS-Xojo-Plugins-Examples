#tag Class
Protected Class SearchTask
Inherits Thread
	#tag Event
		Sub Run()
		  DoTheSearch(searchMode, outputList, searchVolume)
		  mainWindow.SearchFinished()
		  exception exc as RuntimeException
		    mainWindow.SearchFinished()
		    msgBox "Oops. An Exception occured in the SearchTask."
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DoTheSearch(what as Integer, theList as ListBox, theVol as FolderItem)
		  // this demo lists all files of type "INIT" or invisibles on the boot volume,
		  // depending on the passed value in the "what" parameter
		  
		  Dim err as Integer
		  Dim f, vol as FolderItem
		  Dim ok, foundOne as Boolean
		  dim cat as CatSearchMBS
		  
		  theList.DeleteAllRows
		  
		  vol = theVol
		  if vol = nil then
		    beep
		    MsgBox "Vol does no longer exists - you need to re-select a vol from the popup."
		    return
		  end
		  
		  cat=new CatSearchMBS
		  // first, open a CatSearch record
		  
		  cat.ResponseTimeout=1000
		  if not cat.Search(vol, true) then
		    Msgbox "Oops - Cat.Search() failed"
		    raise new CatSearchExc
		  end
		  
		  if what = 1 then
		    // we want to search for files with file type "INIT"
		    
		    cat.fileType="INIT"
		  elseif what = 2 then
		    // we want to search for invisible files
		    Cat.FileFlags=&H4000
		    cat.fileflagsmask=&H4000
		  else
		    // we want to search for files and folders containing the partial name "Appl"
		    Cat.Name="Apple"
		    cat.partialName=true
		  end
		  
		  foundOne = false
		  
		  // the search loop
		  do
		    if UserCancelled or stopped then
		      return
		    end
		    err = Cat.SearchNext // search next occurance of that type of files
		    
		    if err = 0 then
		      // found a file
		      f = Cat.result // get the found file (as a FolderItem)
		      if f <> nil then
		         // add the file to the ListBox control
		        theList.AddRow f.NativePath
		        
		        foundOne = true
		      else
		        // this shouldn't happen
		        msgbox "Oops - Cat.GetItem = nil?"
		        raise new CatSearchExc
		      end
		    end
		  loop until err < 0
		  
		  if err = -50 then
		    msgBox "This volume does not support the CatSearch function"
		  elseif err = -39 then
		    // err -39 means end of found items (or none found)
		    if not foundOne then
		      msgBox "No files found"
		    end
		  else
		    msgBox "Oops - CatSearchNext error: " + str(err)
		    raise new CatSearchExc
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  stopped = true
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		outputList As ListBox
	#tag EndProperty

	#tag Property, Flags = &h0
		searchMode As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		searchVolume As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected stopped As Boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="DebugIdentifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadState"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ThreadStates"
			EditorType="Enum"
			#tag EnumValues
				"0 - Running"
				"1 - Waiting"
				"2 - Paused"
				"3 - Sleeping"
				"4 - NotRunning"
			#tag EndEnumValues
		#tag EndViewProperty
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
			InitialValue=""
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="searchMode"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
