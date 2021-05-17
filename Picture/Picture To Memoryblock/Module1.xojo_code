#tag Module
Protected Module Module1
	#tag Method, Flags = &h0
		Sub AddFail(extends l as listbox, s as string)
		  // add line with red color
		  
		  l.AddRow s
		  l.RowTag(l.LastIndex)=&cFF7777
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetMBfromPicture(pic As Picture, mask As Picture, type As String = "RGB32") As MemoryBlock
		  
		  // Converts a picture into a MemoryBlock.
		  // Will set w and h to the picture's width & height respectively.
		  //image must be in power of 2! be sure to trap for this (by cropping texture when importing)
		  
		  #pragma DisableBackgroundTasks
		  
		  dim x, y, offset,height,width as integer
		  Dim xx, yy As Integer
		  Dim rgb as RGBSurface
		  Dim rgbMask As RGBSurface
		  dim c as color
		  Dim texData As MemoryBlock
		  Dim p, pmask As Picture
		  
		  p = new Picture(pic.Width,pic.Height,32)
		  p.Graphics.DrawPicture pic,0,0
		  
		  height = pic.graphics.height
		  width = pic.graphics.width
		  
		  // Use if you want pass ByRef h & w as Integer
		  'h = height
		  'w = width
		  
		  // Set texData MemoryBlock to hold the exact size
		  // of a pixel' color.
		  Select Case type
		  Case "RGB16", "ARGB16", "RGB16_565"
		    texData = New MemoryBlock(height*width * 2)
		    texData.LittleEndian = False
		  Case "ARGB32", "RGB32", "RGB24"
		    texData = New MemoryBlock(height*width * 4)
		    texData.LittleEndian = True
		  Case "MASK8"
		    texData = New MemoryBlock(height*width) // 8-bit picture mask
		    texData.LittleEndian = False
		  End Select
		  
		  
		  rgb = p.RGBSurface
		  if mask <> nil then
		    pmask = new Picture(p.Width, p.Height, 32)
		    pmask.Graphics.DrawPicture mask,0,0
		    rgbMask = pmask.RGBsurface
		  end if
		  
		  xx = width - 1
		  yy = height - 1
		  for y = 0 to yy
		    for x = 0 to xx
		      Select Case type // Parse RGB data
		      Case "RGB32", "RGB24"
		        c = rgb.Pixel(x,y)
		        texData.ColorValue(offset,24) = c
		        texData.UInt8Value(offset+3) = 255
		        offset = offset + 4
		        
		      Case "ARGB32"
		        c = rgb.Pixel(x,y)
		        texData.ColorValue(offset,24) = c
		        c = rgbMask.Pixel(x,y) // mask
		        texData.UInt8Value(offset+3) = c.red
		        offset = offset + 4
		        
		      Case "RGB16"
		        c = rgb.Pixel(x,y)
		        texData.ColorValue(offset,16) = c
		        offset = offset + 2
		        
		      Case "ARGB16"
		        c = rgb.Pixel(x,y)
		        texData.ColorValue(offset,16) = c
		        offset = offset + 2
		        
		      Case "RGB16_565"
		        c = rgb.Pixel(x,y)
		        texData.ColorValue(offset,16) = c
		        offset = offset + 2
		        
		      Case "MASK8"// Parse mask data
		        c = rgbMask.Pixel(x,y)
		        texData.Byte(offset) = c.red
		        offset = offset + 1
		      End Select
		      
		    next
		  next
		  
		  Return texData
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetMBfromPicture(pic As Picture, type As String = "RGB32") As MemoryBlock
		  // Converts a picture into a MemoryBlock.
		  // Will set w and h to the picture's width & height respectively.
		  //image must be in power of 2! be sure to trap for this (by cropping texture when importing)
		  
		  #pragma DisableBackgroundTasks
		  
		  dim x, y, offset,height,width as integer
		  Dim xx, yy As Integer
		  dim rgb as RGBSurface
		  dim maskS As RGBSurface
		  dim c as color
		  Dim texData As MemoryBlock
		  Dim p As Picture
		  
		  p = new Picture(pic.Width,pic.Height,32)
		  p.Graphics.DrawPicture pic,0,0
		  
		  height = p.graphics.height
		  width = p.graphics.width
		  
		  // Use if you want pass ByRef h & w as Integer
		  'h = height
		  'w = width
		  
		  // Set texData MemoryBlock to hold the exact size
		  // of a pixel' color.
		  Dim clr As MemoryBlock= New MemoryBlock(4)
		  Select Case type
		  Case "RGB16", "ARGB16", "RGB16_565"
		    texData = New MemoryBlock(height*width * 2)
		    texData.LittleEndian = False
		  Case "ARGB32", "RGB32", "RGB24"
		    texData = New MemoryBlock(height*width * 4)
		    texData.LittleEndian = True
		  Case "MASK8"
		    texData = New MemoryBlock(height*width) // 8-bit picture mask
		    texData.LittleEndian = False
		  End Select
		  
		  rgb = p.RGBSurface
		  maskS = p.Mask.RGBSurface 'if p.Mask <> nil then
		  
		  xx = width - 1
		  yy = height - 1
		  for y = 0 to yy
		    for x = 0 to xx
		      Select Case type // Parse RGB data
		      Case "RGB32", "RGB24"
		        c = rgb.Pixel(x,y)
		        texData.ColorValue(offset,24) = c
		        texData.UInt8Value(offset+3) = 255
		        offset = offset + 4
		        
		      Case "ARGB32"
		        c = rgb.Pixel(x,y)
		        texData.ColorValue(offset,24) = c
		        c = maskS.Pixel(x,y) // mask
		        texData.UInt8Value(offset+3) = c.red
		        offset = offset + 4
		        
		      Case "RGB16"
		        c = rgb.Pixel(x,y)
		        texData.ColorValue(offset,16) = c
		        offset = offset + 2
		        
		      Case "ARGB16"
		        c = rgb.Pixel(x,y)
		        texData.ColorValue(offset,16) = c
		        offset = offset + 2
		        
		      Case "RGB16_565"
		        c = rgb.Pixel(x,y)
		        texData.ColorValue(offset,16) = c
		        offset = offset + 2
		        
		      Case "MASK8"// Parse mask data
		        c = maskS.Pixel(x,y)
		        texData.Byte(offset) = c.red
		        offset = offset + 1
		      End Select
		      
		    next
		  next
		  
		  
		  
		  Return texData
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
