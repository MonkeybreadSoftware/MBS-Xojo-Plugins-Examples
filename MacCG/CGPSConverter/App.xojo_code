#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim psconverter as MyCGPSConverter
		  dim f as FolderItem
		  dim dp as CGDataProviderMBS
		  dim dc as MyCGDataConsumer
		  dim output as TextOutputStream
		  
		  f=FindFIle("test.ps")
		  
		  if not f.Exists then
		    MsgBox "Please change the name of the source .ps file in the source code!"
		  else
		    // Read PS File
		    // Create data provider
		    dp=CGDataProviderMBS.CreateWithFile(f)
		    if dp<>Nil then
		      
		      dc=new MyCGDataConsumer
		      
		      psconverter=new MyCGPSConverter(nil)
		      
		      if psconverter.Convert(dp,dc,nil) then
		        
		        f=SpecialFolder.desktop.Child("test.pdf")
		        output=f.CreateTextFile
		        
		        if output<>nil then
		          output.Write dc.buf
		          
		          output.Close
		          
		          f.MacCreator="prvw"
		          f.MacType="PDF "
		          
		          f.Launch
		        end if
		      end if
		      
		    end if
		  end if
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
