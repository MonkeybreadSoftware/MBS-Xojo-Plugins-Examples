#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim logo as Picture = LogoMBS(500)
		  
		  'logo = logo.GrayScaleMBS(1)
		  
		  WriteTiff logo, 0,  0 // defaults
		  WriteTiff logo, 8,  TiffPictureMBS.kPhotometricMinIsWhite
		  WriteTiff logo, 16, TiffPictureMBS.kPhotometricMinIsWhite
		  WriteTiff logo, 8,  TiffPictureMBS.kPhotometricMinIsBlack
		  WriteTiff logo, 16, TiffPictureMBS.kPhotometricMinIsBlack
		  
		  
		  AutoQuit = true
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub WriteTiff(pic as Picture, Bits as integer, Photometric as integer)
		  dim f as FolderItem
		  dim t as TiffPictureMBS
		  
		  dim bitsString as string
		  Select case bits
		  case 8
		    bitsString = "8 Bit"
		  case 16
		    bitsString = "16 Bit"
		  case 0
		    bitsString = "default"
		  else
		    break
		  end Select
		  
		  dim PhotometricString as string
		  Select case Photometric
		  case TiffPictureMBS.kPhotometricMinIsBlack
		    PhotometricString = "MinIsBlack"
		  case TiffPictureMBS.kPhotometricMinIsWhite
		    PhotometricString = "MinIsWhite"
		  case 0
		    PhotometricString = "default"
		  else
		    break
		  end Select
		  
		  dim name as string = "test "+bitsString+" "+PhotometricString+".tiff"
		  
		  System.DebugLog name
		  
		  f = SpecialFolder.Desktop.Child(name)
		  
		  if f<>Nil then
		    t=new TiffPictureMBS
		    
		    if t.Create(f) then
		      t.Pict=pic
		      
		      if Photometric<>0 then
		        t.Photometric = Photometric
		      end if
		      
		      if bits<>0 then
		        t.BitsPerSample = bits
		      end if
		      
		      if t.WriteGray then
		        // ok
		      else
		        break
		        MsgBox "Failed to write tiff file "+f.Name
		      end if
		      
		      t.Close
		    end if
		  end if
		End Sub
	#tag EndMethod


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&L\xC3\xB6schen", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&L\xC3\xB6schen"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&L\xC3\xB6schen"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"Beenden", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Beenden"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
