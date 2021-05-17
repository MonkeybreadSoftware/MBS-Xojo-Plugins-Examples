#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // run test for all possible values
		  
		  // remove every nth line
		  
		  test 1 // every line, so stays
		  test 2
		  test 3
		  test 4
		  test 5
		  test 6
		  test 7
		  test 8
		  
		  
		  self.AutoQuit = true
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub test(n as integer)
		  dim t as new TiffPictureMBS
		  dim f as FolderItem = SpecialFolder.Desktop.Child("input.tif")
		  
		  if t.Open(f) then
		    dim IsTiled as Boolean = t.IsTiled
		    dim RowsPerStrip as integer = t.RowsPerStrip
		    
		    // get memory block with n rows reduced to 1
		    dim m4 as MemoryBlock = t.ScanlinesScaled(0, t.Height, 0, n)
		    dim RowCount as integer = m4.size / t.BytesPerRow
		    
		    dim d as FolderItem = SpecialFolder.Desktop.Child("test"+str(n)+".tif")
		    
		    dim dt as TiffPictureMBS
		    dim i,h as integer
		    dim st as TiffPictureMBS = t
		    
		    dt=new TiffPictureMBS
		    if not dt.Create(d) then
		      break
		    else
		      // first
		      dt.Width=st.Width
		      dt.Height=RowCount
		      dt.BitsPerSample=st.BitsPerSample
		      dt.SamplesPerPixel=st.SamplesPerPixel
		      dt.Compression=st.Compression
		      dt.PlanarConfig=st.PlanarConfig
		      dt.Photometric=st.Photometric
		      
		      dt.RowsPerStrip=st.RowsPerStrip
		      dt.FillOrder=st.FillOrder
		      
		      // later
		      dt.Copyright=st.Copyright
		      dt.DateTime=st.DateTime
		      dt.DocumentName=st.DocumentName
		      dt.ExtraSamples=st.ExtraSamples
		      dt.HorizontalPosition=st.HorizontalPosition
		      dt.HorizontalResolution=st.HorizontalResolution
		      dt.HostComputer=st.HostComputer
		      dt.ImageDescription=st.ImageDescription
		      dt.Make=st.Make
		      dt.Model=st.Model
		      dt.Orientation=st.Orientation
		      dt.PageName=st.PageName
		      dt.ResolutionUnit=st.ResolutionUnit
		      dt.Software=st.Software
		      dt.VerticalPosition=st.VerticalPosition
		      dt.VerticalResolution=st.VerticalResolution
		      
		      dt.Scanlines(0,RowCount)=m4
		      
		      dt.Close
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
