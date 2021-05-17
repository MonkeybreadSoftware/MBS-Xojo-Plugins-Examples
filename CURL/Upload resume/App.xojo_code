#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // create dummy file to upload
		  
		  file = SpecialFolder.Desktop.Child("upload test.jpg")
		  
		  if not file.Exists then
		    
		    dim p as Picture = LogoMBS(5000)
		    dim j as string = p.GetData(p.FormatJPEG, p.QualityMax)
		    
		    dim b as BinaryStream = BinaryStream.Create(file, true)
		    b.Write j
		    b.Close
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		file As FolderItem
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
