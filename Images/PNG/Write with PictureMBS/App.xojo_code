#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  TestRGB
		  TestGray
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub TestGray()
		  
		  // Write a RGBA PNG file
		  dim current as Picture = LogoMBS(500) // needs Main Plugin
		  
		  dim cpic as new PictureMBS(current)
		  dim pic as new PictureMBS(current.Width, current.Height, PictureMBS.ImageFormatG)
		  
		  call pic.CopyPixels(cpic)
		  
		  // show in window
		  window1.Backdrop = current
		  
		  // and write to file
		  dim f as FolderItem = SpecialFolder.Desktop.Child("test gray.png")
		  
		  dim p as new PNGWriterMBS
		  
		  dim rows() as MemoryBlock
		  dim h as integer = pic.Height-1
		  for i as integer = 0 to h
		    rows.Append pic.RawRow(i)
		  next
		  
		  p.Type = p.TypeGray
		  p.Width = pic.Width
		  p.bpc = 1
		  p.Rowbytes = pic.Width // one byte per pixel
		  
		  if p.OpenWriteDestination(f) then // open file
		    if p.SetRows(rows) then // set picture to write
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
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestRGB()
		  
		  // Write a RGBA PNG file
		  dim current as Picture = LogoMBS(500) // needs Main Plugin
		  
		  dim pic as new PictureMBS(current.Width, current.Height, PictureMBS.ImageFormatRGB)
		  pic.DrawPictureRGB(current)
		  
		  // show in window
		  window1.Backdrop = current
		  
		  // and write to file
		  dim f as FolderItem = SpecialFolder.Desktop.Child("test rgb.png")
		  
		  dim p as new PNGWriterMBS
		  
		  dim rows() as MemoryBlock
		  dim h as integer = pic.Height-1
		  for i as integer = 0 to h
		    rows.Append pic.RawRow(i)
		  next
		  
		  p.Type = p.TypeRGB
		  p.Width = pic.Width
		  p.bpc = 3
		  p.Rowbytes = pic.Width * 3
		  
		  if p.OpenWriteDestination(f) then // open file
		    if p.SetRows(rows) then // set picture to write
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
