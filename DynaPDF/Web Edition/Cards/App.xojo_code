#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Sub Open()
		  // Please provide your own Cards folder with files:
		  
		  // thumb*.jpg for little thumbnails of pictures
		  // pic*.jpg for actual pictures
		  // back*.jpg for backgrounds as thumbnail pictures
		  // back*.pdf for actual backgrounds as PDF
		  // back*small.pdf for actual backgrounds as PDF with lower resolution
		  
		  
		  dim f as FolderItem = FindFile("Cards")
		  while not f.Exists
		    
		    if f.parent.parent = nil then
		      print "Failed to find Cards folder"
		      break
		      quit
		    end if
		    
		    f = f.parent.parent.Child("Cards")
		    
		  wend
		  
		  
		  Thumbnails.Append new WebPicture(Picture.Open(f.Child("thumb1.jpg")), Picture.FormatJPEG)
		  Thumbnails.Append new WebPicture(Picture.Open(f.Child("thumb2.jpg")), Picture.FormatJPEG)
		  Thumbnails.Append new WebPicture(Picture.Open(f.Child("thumb3.jpg")), Picture.FormatJPEG)
		  Thumbnails.Append new WebPicture(Picture.Open(f.Child("thumb4.jpg")), Picture.FormatJPEG)
		  
		  pictureFiles.Append f.Child("pic1.jpg")
		  pictureFiles.Append f.Child("pic2.jpg")
		  pictureFiles.Append f.Child("pic3.jpg")
		  pictureFiles.Append f.Child("pic4.jpg")
		  
		  BackPictures.Append new WebPicture(Picture.Open(f.Child("back1.jpg")), Picture.FormatJPEG)
		  BackPictures.Append new WebPicture(Picture.Open(f.Child("back2.jpg")), Picture.FormatJPEG)
		  BackPictures.Append new WebPicture(Picture.Open(f.Child("back3.jpg")), Picture.FormatJPEG)
		  BackPictures.Append new WebPicture(Picture.Open(f.Child("back4.jpg")), Picture.FormatJPEG)
		  
		  backs.Append f.Child("back1.pdf")
		  backs.Append f.Child("back2.pdf")
		  backs.Append f.Child("back3.pdf")
		  backs.Append f.Child("back4.pdf")
		  
		  backsmall.Append f.Child("back1small.pdf")
		  backsmall.Append f.Child("back2small.pdf")
		  backsmall.Append f.Child("back3small.pdf")
		  backsmall.Append f.Child("back4small.pdf")
		  
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


	#tag Property, Flags = &h0
		BackPictures(-1) As WebPicture
	#tag EndProperty

	#tag Property, Flags = &h0
		Backs(-1) As folderitem
	#tag EndProperty

	#tag Property, Flags = &h0
		backsmall(-1) As folderitem
	#tag EndProperty

	#tag Property, Flags = &h0
		pictureFiles(-1) As folderitem
	#tag EndProperty

	#tag Property, Flags = &h0
		Thumbnails(-1) As WebPicture
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
