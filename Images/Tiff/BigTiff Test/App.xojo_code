#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  WriteTiff true,     "big.tif"
		  WriteTiff false, "normal.tif"
		  
		  
		  MainWindow.Canvas1.Backdrop = ReadTiff(   "big.tif")
		  MainWindow.Canvas2.Backdrop = ReadTiff("normal.tif")
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function ReadTiff(name as string) As Picture
		  dim f as FolderItem = SpecialFolder.Desktop.Child(name)
		  dim t as new TiffPictureMBS
		  
		  
		  if not t.Open(f, "r") then
		    Break
		    MsgBox "Failed to open file."
		    Return nil
		  end if
		  
		  
		  if t.ReadRGB then
		    
		    Return t.Pict
		    
		  else
		    Break // failed to read RGB
		  end if
		  
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteTiff(big as Boolean, name as string)
		  dim p as new Picture(100, 100, 32)
		  dim g as Graphics = p.Graphics
		  
		  g.ForeColor = &cFF0000
		  g.FillRect 50, 50, 50, 50
		  g.ForeColor = &c00FF00
		  g.FillRect 50,  0, 50, 50
		  g.ForeColor = &c0000FF
		  g.FillRect  0, 50, 50, 50
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child(name)
		  dim t as new TiffPictureMBS
		  
		  dim mode as string
		  if big then
		    mode = "w8"
		  else
		    mode = "w"
		  end if
		  
		  // b = big endian
		  // l = little endian
		  // B = Fill Order MSB to LSB
		  // L = Fill Order LSB to MSB
		  // H = Fill Order Host
		  // M = Mapped
		  // m = not mapped
		  // C = StripChop
		  // c = no StripChop
		  // h = Header only
		  // 8 = Big Mode
		  
		  if not t.Open(f, mode) then
		    Break
		    MsgBox "Failed to create file."
		    Return
		  end if
		  
		  
		  t.Pict = p
		  
		  call t.WriteRGB
		  
		  
		  
		  
		  
		  
		  
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
