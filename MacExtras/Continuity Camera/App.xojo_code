#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  ContinuityCameraMBS.SetDelegate AddressOf gotData
		  ContinuityCameraMBS.InstallForWindow
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub gotData(Data as MemoryBlock, Type as string)
		  Select Case type
		    
		  Case "PDF"
		    WriteFile("import.pdf", data)
		    
		    Dim doc As New PDFDocumentMBS(data)
		    
		    // first page
		    Dim page As PDFPageMBS = doc.pageAtIndex(0)
		    Dim n As NSImageMBS = page.Render
		    Dim p As Picture = n.CopyPictureWithAlpha
		    
		    MainWindow.setPicture p
		    
		  Case "Tiff"
		    WriteFile("import.tif", data)
		    
		    Dim p As Picture = Picture.FromData(data)
		    MainWindow.setPicture p
		    
		  Case "JPEG"
		    WriteFile("import.jpg", data)
		    
		    Dim p As Picture = Picture.FromData(data)
		    MainWindow.setPicture p
		    
		  Case "PNG"
		    
		    WriteFile("import.png", data)
		    
		    Dim p As Picture = Picture.FromData(data)
		    MainWindow.setPicture p
		    
		  Else
		    MsgBox "new type: "+type
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteFile(name as string, data as string)
		  Dim f As FolderItem = SpecialFolder.Desktop.Child(name)
		  Dim b As BinaryStream = BinaryStream.Create(f, True)
		  b.Write data
		  b.Close
		  
		End Sub
	#tag EndMethod


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
