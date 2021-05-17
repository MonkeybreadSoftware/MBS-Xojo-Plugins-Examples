#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  // Write a RGBA PNG file
		  dim current as Picture = LogoMBS(500) // needs Main Plugin
		  
		  // create a mask
		  dim g as Graphics = current.Mask.Graphics
		  g.ForeColor = &cFFFFFF
		  g.FillRect 0,0,500,500
		  g.ForeColor = &c000000
		  g.FillOval 0,0,500,500
		  
		  // show in window
		  window1.Backdrop = current
		  
		  // and write to file
		  dim f as FolderItem = SpecialFolder.Desktop.Child("test with alpha.png")
		  
		  dim p as new PNGWriterMBS
		  
		  if p.OpenWriteDestination(f) then // open file
		    if p.SetGrayPicture(current, current.mask) then // set picture to write
		      if p.SetHeader(false, -1) then // setup file header
		        if p.SetGamma(0) then // and default gamma
		          if p.WriteInfo then // write file header
		            if p.WriteRows then // write pixels
		              if p.WriteEnd then // and write file end
		                p = nil // cleanup
		                f.Launch
		              end if
		            end if
		          end if
		        end if
		      end if
		    end if
		  end if
		  
		  f = SpecialFolder.Desktop.Child("test without alpha.png")
		  
		  p = new PNGWriterMBS
		  
		  if p.OpenWriteDestination(f) then // open file
		    if p.SetGrayPicture(current) then // set picture to write
		      if p.SetHeader(false, -1) then // setup file header
		        if p.SetGamma(0) then // and default gamma
		          if p.WriteInfo then // write file header
		            if p.WriteRows then // write pixels
		              if p.WriteEnd then // and write file end
		                p = nil // cleanup
		                f.Launch
		              end if
		            end if
		          end if
		        end if
		      end if
		    end if
		  end if
		  
		  
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
