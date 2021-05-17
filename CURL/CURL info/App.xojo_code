#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // CURL libraries available on MBS Website in download area
		  // or comment out on Mac/Linux to load system libraries
		  
		  #if TargetWin32 then
		    
		    dim f as FolderItem 
		    
		    #if Target64Bit then
		      f = GetFolderItem("libcurl64.dll")
		    #else
		      f = GetFolderItem("libcurl32.dll")
		    #endif
		    
		    if f.Exists then
		      
		      if CURLMBS.LoadLibrary(f) then
		        MsgBox "Library loaded."
		      else
		        MsgBox CURLMBS.LoadErrorString
		      end if
		      
		    else
		      Break // missing?
		      MsgBox "missing file?"+EndOfLine+EndOfLine+f.Name
		    end if
		    
		    
		    
		  #elseif TargetMacOS then
		    
		    dim f as FolderItem = GetFolderItem("libcurl.dylib")
		    if f.Exists then
		      
		      if CURLMBS.LoadLibrary(f) then
		        MsgBox "Library loaded."
		      else
		        MsgBox CURLMBS.LoadErrorString
		      end if
		      
		    else
		      Break // missing?
		      MsgBox "missing file?"+EndOfLine+EndOfLine+f.Name
		    end if
		    
		  #else
		    break // todo
		  #endif
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
