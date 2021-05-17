#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  // Write a RGBA PNG file
		  dim current as Picture = LogoMBS(500) // needs Main Plugin
		  
		  // show in window
		  window1.Backdrop = current
		  
		  prefix = "MBS "
		  test current
		  
		  prefix = "test "
		  dim f as FolderItem = SpecialFolder.Desktop.Child("test.png")
		  if f.Exists then
		    current = Picture.Open(f)
		    
		    test current
		    
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub test(current as Picture)
		  
		  write current, false, -1, "default"
		  write current, true,  -1, "default"
		  
		  
		  const PNG_NO_FILTERS    = 0
		  const PNG_FILTER_NONE    = 8
		  const PNG_FILTER_SUB    = 16
		  const PNG_FILTER_UP    = 32
		  const PNG_FILTER_AVG    = 64
		  const PNG_FILTER_PAETH    = 128
		  const PNG_FILTER_ALL    = 248
		  
		  
		  write current, false, 0, "no filter"
		  write current, true,  0, "no filter"
		  
		  write current, false, PNG_FILTER_ALL, "all filter"
		  write current, true,  PNG_FILTER_ALL, "all filter"
		  
		  write current, false, PNG_FILTER_AVG, "avg filter"
		  write current, true,  PNG_FILTER_AVG, "avg filter"
		  
		  write current, false, PNG_FILTER_PAETH, "paeth filter"
		  write current, true,  PNG_FILTER_PAETH, "paeth filter"
		  
		  write current, false, PNG_FILTER_SUB, "sub filter"
		  write current, true,  PNG_FILTER_SUB, "sub filter"
		  
		  write current, false, PNG_FILTER_UP, "up filter"
		  write current, true,  PNG_FILTER_UP, "up filter"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(current as picture, interlace as Boolean, filter as integer, fname as string)
		  dim name as string = prefix + fname
		  if interlace then
		    name = name + " interlaced"
		  end if
		  name = name + ".png"
		  dim p as new PNGWriterMBS
		  dim f as FolderItem = SpecialFolder.Desktop.Child(name)
		  if p.OpenWriteDestination(f) then // open file
		    if p.SetRGBPicture(current) then // set picture to write
		      if p.SetHeader(interlace, filter) then // setup file header
		        if p.SetGamma(0) then // and default gamma
		          if p.WriteInfo then // write file header
		            if p.WriteRows then // write pixels
		              if p.WriteEnd then // and write file end
		                // ok
		              end if
		            end if
		          end if
		        end if
		      end if
		    end if
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		prefix As string
	#tag EndProperty


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
		#tag ViewProperty
			Name="prefix"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
