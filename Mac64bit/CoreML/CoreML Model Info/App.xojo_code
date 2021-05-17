#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub NewDocument()
		  dim f as FolderItem = SelectFolder
		  'GetOpenFolderItem(FileTypeGroup1.Model)
		  
		  if f <> nil then
		    OpenDocument f
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  #If Target64Bit And TargetMacOS Then
		    
		    // ok
		    
		    if not MLModelMBS.available then
		      MsgBox "Please run on macOS High Sierra or newer."
		      quit
		      
		    end if
		    
		  #else
		    MsgBox "Please run in 64-bit Mac app"
		    quit
		    
		  #endif
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub OpenDocument(item As FolderItem)
		  
		  if item.Name.Right(8) = ".mlmodel" then
		    
		    dim e as NSErrorMBS
		    item = MLModelMBS.compileModelFile(item, e)
		    
		    if e <> nil then
		      MsgBox "Failed to compile model."+EndOfLine+EndOfLine+e.LocalizedDescription
		      Return
		    end if
		    
		  end if
		  
		  
		  
		  // load model, to be specific: a mlmodelc folder
		  dim e as NSErrorMBS
		  dim m as MLModelMBS = MLModelMBS.modelWithContentsOfFile(item, e)
		  
		  if m = nil then
		    MsgBox "Failed to load model."+EndOfLine+EndOfLine+e.LocalizedDescription
		    return
		  end if
		  
		  // show what we know
		  dim w as new MainWindow
		  dim list as listbox = w.List
		  dim d as MLModelDescriptionMBS = m.modelDescription
		  
		  list.AddRow "filename", item.DisplayName
		  
		  list.AddRow "predictedFeatureName", d.predictedFeatureName
		  list.AddRow "predictedProbabilitiesName", d.predictedProbabilitiesName
		  
		  list.AddFolder "inputDescriptionsByName", d.inputDescriptionsByName
		  list.AddFolder "metadata", d.metadata
		  list.AddFolder "outputDescriptionsByName", d.outputDescriptionsByName
		  
		  list.AddFolder "metadata", d.metadata
		  
		  // requires MacOS 10.15
		  
		  If MLUpdateTaskMBS.available Then
		    list.AddRow "isUpdatable", Str(d.isUpdatable)
		    list.AddFolder "parameterDescriptionsByKey", d.parameterDescriptionsByKey
		    list.AddFolder "trainingInputDescriptionsByName", d.trainingInputDescriptionsByName
		  Else
		    // older MacOS
		    list.AddRow "isUpdatable", Str(False)
		  End If
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
