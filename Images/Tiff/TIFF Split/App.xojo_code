#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim f as FolderItem = GetOpenFolderItem(FileTypes1.ImageXTiff)
		  
		  if f <> nil then
		    
		    Split f
		    
		  end if
		  
		  AutoQuit = true
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Split(f as FolderItem)
		  
		  
		  
		  if not f.Exists then
		    LogWindow.List.Addrow "Source file not found: "+f.NativePath
		  else
		    dim st as new MyTiff
		    st.name="(Source) "
		    if not st.Open(f) then
		      LogWindow.List.Addrow "Open Tiff failed!"
		    else
		      dim n as integer = 1
		      do
		        
		        
		        dim d as FolderItem = SpecialFolder.Desktop.Child( "image"+str(n)+".tif")
		        dim dt as new MyTiff
		        dt.name="(Dest "+str(n)+") "
		        if not dt.Create(d) then
		          LogWindow.List.Addrow "Failed to create the destination file "+d.NativePath
		        else
		          
		          // first
		          dt.Width=st.Width
		          dt.Height=st.Height
		          'dt.tileWidth=st.TileWidth
		          'dt.TileHeight=st.TileHeight
		          dt.BitsPerSample=st.BitsPerSample
		          dt.SamplesPerPixel=st.SamplesPerPixel
		          dt.Photometric=st.Photometric
		          dt.PlanarConfig=st.PlanarConfig
		          
		          dim compression as integer = st.Compression
		          if compression = st.kCompressionPackBits then // Had trouble with that
		            compression = st.kCompressionNone
		          end if
		          dt.Compression = compression
		          
		          // LogWindow.List.AddRow str(st.PlanarConfig)
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
		          
		          
		          dim h as integer =st.Height-1
		          dim m as MemoryBlock
		          
		          for row as integer =0 to h
		            m = st.Scanline(row)
		            if m <> nil then
		              dt.Scanline(row) = m
		              
		              if dt.waserror then
		                LogWindow.List.Addrow "Error on Copy!"
		                exit
		              end if
		              
		            else
		              LogWindow.List.AddRow "Read error on line "+str(row+1)
		            end if
		          next
		          
		          
		          dt.Close
		        end if
		        
		        n = n + 1
		      loop until not st.NextImage
		      
		      st.Close
		    end if
		  end if
		  
		  
		  Exception
		    MsgBox "exception?"
		    quit
		    
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
