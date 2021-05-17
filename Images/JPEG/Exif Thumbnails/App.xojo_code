#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // walk over folder and look for thumbnails
		  Dim folder As FolderItem = SpecialFolder.Pictures // .Child("Bilder")
		  
		  Dim c As Integer = folder.Count
		  For i As Integer = 1 To c
		    
		    Dim f As FolderItem = folder.TrueItem(i)
		    
		    If f.Directory Then
		      // ignore folder
		    Elseif f.name.Right(4) = ".jpg" Then
		      System.DebugLog "Check "+f.name
		      Dim g As New JPEGImporterMBS
		      
		      g.File = f
		      g.ReadExifData = True
		      
		      // not load, but just read header & metadata
		      If g.ReadHeader Then
		        
		        // get thumbnail
		        Dim Thumbnail As String = g.ExifThumbnail
		        
		        // show it
		        If Thumbnail.LenB > 0 Then
		          
		          Dim w As New ImageWindow
		          w.Title = g.file.name
		          w.Backdrop = picture.FromData(Thumbnail)
		          
		          // if nil, use ScaleFactor and read scaled down version
		        Else
		          System.DebugLog "No thumbnail for: "+f.name
		        End If
		      End If
		    End If
		  Next
		  
		  If WindowCount = 0 Then
		    MsgBox "No image found with thumbnail."
		  End If
		  
		  AutoQuit = True
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
