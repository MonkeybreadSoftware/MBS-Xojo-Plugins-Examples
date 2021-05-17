#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub OpenDocument(item As FolderItem)
		  if item<>Nil then
		    
		    dic = new Dictionary
		    LibCount = 0
		    
		    ProcessLibraries Item
		    processApps item
		    
		    MsgBox str(dic.Count)+" files renamed and "+str(LibCount)+" files modified."
		  end if
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function Untitled() As Boolean Handles Untitled.Action
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h1
		Protected Sub processApps(item as FolderItem)
		  dim files() as FolderItem
		  dim c as integer = item.Count
		  
		  for i as integer = 1 to c
		    
		    dim f as FolderItem = item.TrueItem(i)
		    
		    if f = nil then
		      // ignore
		    elseif f.Directory then
		      
		      if f.Name = "XojoFramework.framework" then
		        // ignore
		      else
		        processApps f
		      end if
		      
		    elseif f.Visible then
		      
		      files.Append f
		      
		    end if
		    
		  next
		  
		  
		  for each f as FolderItem in files
		    ProcessFile f
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ProcessFile(f as FolderItem)
		  if f.Length = 0 then Return // empty file
		  
		  dim b as BinaryStream = BinaryStream.Open(f, false)
		  dim changed as Boolean = false
		  dim oldData as string = b.Read(b.Length)
		  b.Close
		  
		  if lenb(oldData) = 0 then 
		    Break
		    Return
		  end if
		  
		  dim NewData as string = oldData
		  dim c as integer = dic.Count-1
		  for i as integer = 0 to c
		    dim key as Variant = dic.Key(i)
		    dim oldName as string = key
		    dim newName as string = dic.Value(key)
		    
		    dim p as integer = instrb(NewData, oldName)
		    while p > 0 
		      changed = true
		      NewData = leftb(NewData, p-1) + newName + midb(NewData, p+lenb(oldName))
		      p = instrb(NewData, oldName)
		    wend
		    
		  next
		  
		  if lenb(NewData) <> lenb(oldData) then
		    Break
		  end if
		  
		  if changed then
		    LibCount = LibCount + 1
		    b = BinaryStream.open(f, true)
		    b.Write NewData
		    b.Close
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ProcessLib(f as FolderItem)
		  if Right(f.name, 3) = ".so" then
		    processLib f, ".so"
		    Return
		  end if
		  
		  if Right(f.name,4) = ".dll" then
		    
		    if left(f.name,4) <> "MSVC" then // MSVC*.dll don't like to be renamed
		      processLib f, ".dll"
		    end if
		  end if
		  
		  if Right(f.name, 6) = ".dylib" then
		    processLib f, ".dylib"
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ProcessLib(f as FolderItem, extension as string)
		  dim NewName as string 
		  
		  dim OldName as string = f.name
		  if dic.HasKey(OldName) then
		    NewName = dic.Value(OldName)
		    f.name = NewName
		    Return
		  end if
		  
		  NewName = extension
		  while lenb(NewName) < lenb(OldName)
		    dim r as integer = Rnd*26 + 65
		    NewName = Encodings.ASCII.Chr(r) + NewName
		  wend
		  
		  f.Name = NewName
		  
		  dic.Value(OldName) = NewName
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ProcessLibraries(item as FolderItem)
		  dim c as integer = item.Count
		  dim files() as FolderItem
		  
		  for i as integer = 1 to c
		    
		    dim f as FolderItem = item.TrueItem(i)
		    
		    if f = nil then
		      // ignore
		    elseif f.Directory then
		      
		      ProcessLibraries f
		      
		    elseif f.Visible then
		      
		      files.append f
		      
		    end if
		    
		  next
		  
		  
		  for each f as FolderItem in files
		    ProcessLib f
		  next
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected dic As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LibCount As Integer
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&L\xC3\xB6schen", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&L\xC3\xB6schen"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&L\xC3\xB6schen"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"Beenden", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Beenden"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
