#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Dim s,d As FolderItem
		  
		  // we copy all values tag by tag to a new file
		  
		  s=FindFile("CMYK8.tif")
		  d=SpecialFolder.Desktop.Child("CMYK8copy.tif")
		  CopyFile s,d
		  
		  s=FindFile("CMYK16.tif")
		  d=SpecialFolder.Desktop.Child("CMYK16copy.tif")
		  CopyFile s,d
		  
		  s=FindFile("Gray8.tif")
		  d=SpecialFolder.Desktop.Child("Gray8copy.tif")
		  CopyFile s,d
		  
		  s=FindFile("Gray16.tif")
		  d=SpecialFolder.Desktop.Child("Gray16copy.tif")
		  CopyFile s,d
		  
		  s=FindFile("Lab8.tif")
		  d=SpecialFolder.Desktop.Child("Lab8copy.tif")
		  CopyFile s,d
		  
		  s=FindFile("Lab16.tif")
		  d=SpecialFolder.Desktop.Child("Lab16copy.tif")
		  CopyFile s,d
		  
		  s=FindFile("RGB8.tif")
		  d=SpecialFolder.Desktop.Child("RGB8copy.tif")
		  CopyFile s,d
		  
		  s=FindFile("RGB16.tif")
		  d=SpecialFolder.Desktop.Child("RGB16copy.tif")
		  CopyFile s,d
		  
		  LogWindow.List.AddRow "Finished."
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CopyFile(s as folderitem, d as folderitem)
		  Dim st As MyTiff
		  dim dt as MyTiff
		  dim i,h as integer
		  dim m as MemoryBlock
		  
		  if not s.Exists then
		    LogWindow.List.Addrow "Source file not found: "+s.NativePath
		  else
		    st=new MyTiff
		    st.name="(Source) "
		    if not st.Open(s) then
		      LogWindow.List.Addrow "Open Tiff failed!"
		    else
		      
		      dt=new MyTiff
		      dt.name="(Dest) "
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
		        dt.Compression=st.Compression
		        dt.PlanarConfig=st.PlanarConfig
		        dt.Photometric=st.Photometric
		        
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
		        
		        dt.Scanlines(0,st.Height)=st.Scanlines(0,st.Height)
		        if dt.waserror then
		          LogWindow.List.Addrow "Error on Copy!"
		        end if
		        
		        'h=st.Height-1
		        '
		        'for i=0 to h
		        'm=st.Scanline(i)
		        'if m<>nil then
		        'dt.Scanline(i)=m
		        '
		        'if dt.waserror then
		        'LogWindow.List.Addrow "Error on Copy!"
		        'exit
		        'end if
		        '
		        'else
		        'LogWindow.List.AddRow "Read error on line "+str(i+1)
		        'end if
		        'next
		        
		        st.Close
		        dt.Close
		        
		      end if
		    end if
		  end if
		  
		  
		  Exception
		    MsgBox "exception?"
		    quit
		    
		End Sub
	#tag EndMethod

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


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
