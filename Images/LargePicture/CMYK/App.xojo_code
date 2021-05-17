#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  RunTIFF
		  RunJPEG
		  
		  quit
		  
		End Sub
	#tag EndEvent


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

	#tag Method, Flags = &h0
		Sub RunJPEG()
		  // load cmyk
		  dim f as FolderItem = FindFile("MBSLogo_cmyk.jpg")
		  dim ji as new JPEGImporterMBS
		  
		  ji.file = F
		  ji.mode = ji.ModeCMYK
		  ji.ImportCMYK
		  
		  dim width as integer = ji.Width
		  dim height as integer = ji.Height
		  dim rowBytes as integer = ji.Width * 4
		  dim data as MemoryBlock = ji.PictureData
		  
		  
		  // Make PictureMBS and rotate it
		  dim pic as new PictureMBS(data, width, height, PictureMBS.ImageFormatCMYK, rowBytes)
		  
		  dim output as PictureMBS = pic.Rotate90
		  
		  
		  // save jpeg
		  dim je as new JPEGExporterMBS
		  
		  je.File = SpecialFolder.Desktop.Child("output.jpg")
		  je.ExportCMYK(output.Memory, output.Width, output.Height, output.RowSize)
		  
		  
		  // done
		  je.file.Launch
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RunTIFF()
		  // load cmyk
		  dim f as FolderItem = FindFile("MBSLogo_cmyk.tif")
		  dim ji as new TiffPictureMBS
		  
		  call ji.Open(f)
		  
		  dim width as integer = ji.Width
		  dim height as integer = ji.Height
		  dim rowBytes as integer = ji.BytesPerRow
		  
		  dim data as new MemoryBlock(rowBytes*height)
		  
		  for i as integer = 0 to height-1
		    dim m as MemoryBlock = data.AddressPtrMBS(i*rowBytes)
		    call ji.Scanline(m, i)
		  next
		  
		  
		  // Make PictureMBS and rotate it
		  dim pic as new PictureMBS(data, width, height, PictureMBS.ImageFormatCMYK, rowBytes)
		  
		  dim output as PictureMBS = pic.Rotate90
		  
		  
		  // save jpeg
		  dim t as new TiffPictureMBS
		  
		  dim o as FolderItem = SpecialFolder.Desktop.Child("output.tif")
		  
		  if t.Create(o, 0) then
		    
		    t.Height = output.Height
		    t.Width = output.Width
		    
		    t.RowsPerStrip = 1
		    t.PlanarConfig = t.kPlanarConfigContig
		    t.Photometric = t.kPhotometricSeparated
		    t.BitsPerSample = 8
		    t.SamplesPerPixel = 4
		    t.FillOrder = t.kFillOrderMSB2LSB
		    t.Orientation = t.kOrientationTopLeft
		    t.ResolutionUnit = t.kResUnitInch
		    t.VerticalResolution = 72.0
		    t.HorizontalResolution = 72.0
		    t.Compression = t.kCompressionNone
		    t.RowsPerStrip = 32
		    
		    // copy lines
		    for i as integer = 0 to output.Height - 1
		      t.Scanline(i) = output.RowInFormat(i, PictureMBS.ImageFormatCMYK)
		    next
		    t.close
		  end if
		  
		  // done
		  o.Launch
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
