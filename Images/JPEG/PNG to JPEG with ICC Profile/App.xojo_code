#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim fi as FolderItem = SpecialFolder.Desktop.Child("Import.png")
		  
		  if not fi.exists then
		    Break
		    MsgBox "Please put Import.png on desktop."
		    quit
		  end if
		  
		  TestCrossPlatform
		  
		  #if TargetMachO then
		    TestMacWay
		  #endif
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub TestCrossPlatform()
		  // read with PNG
		  dim fi as FolderItem = SpecialFolder.Desktop.Child("Import.png")
		  
		  dim pn as new PNGReaderMBS
		  
		  
		  dim name as string
		  dim compression as integer
		  dim ProfileData as string
		  
		  
		  if pn.OpenFile(fi) then
		    if pn.ApplyOptions then
		      if pn.ReadPicture then
		        
		        // read the ICC profile
		        if pn.ReadICCProfile(name, compression, ProfileData) then
		          
		          // write JPEG
		          
		          dim je as new JPEGExporterMBS
		          dim fe as FolderItem
		          fe=SpecialFolder.Desktop.child("Export.jpg")
		          je.File=fe
		          je.Quality=60
		          
		          // 200 dpi
		          je.VerticalResolution = 200
		          je.HorizontalResolution = 200
		          je.ResolutionUnit = 1
		          
		          // the Picture
		          je.Picture = pn.Pict
		          
		          // here include the ICC profile
		          je.ProfileData = ProfileData
		          
		          // and write
		          je.Export
		          
		        end if
		      end if
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestMacWay()
		  // read file using Xojo framework which uses Apple frameworks
		  
		  dim fi as FolderItem = SpecialFolder.Desktop.Child("Import.png")
		  dim pi as Picture = Picture.Open(fi)
		  
		  // now write via plugin
		  dim je as new JPEGExporterMBS
		  dim fe as FolderItem
		  fe=SpecialFolder.Desktop.child("ExportMac.jpg")
		  je.File=fe
		  je.Quality=60
		  
		  // 200 dpi
		  je.VerticalResolution = 200
		  je.HorizontalResolution = 200
		  je.ResolutionUnit = 1
		  
		  // the picture
		  je.Picture=pi
		  
		  // here we get the colorspace and include it in JPEG
		  dim c as CGColorSpaceMBS = pi.CGColorSpaceMBS
		  
		  je.ProfileData = c.ICCProfile
		  
		  // and write
		  je.Export
		  
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
