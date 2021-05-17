#tag Module
Protected Module ImageTransformations
	#tag Method, Flags = &h0
		Function Convolution(extends p as picture, hor() as double, ver() as double, channels as integer) As picture
		  dim p2, intermediate, result as picture
		  dim insurf,intermediatesurf, outsurf as rgbSurface
		  dim x,y,w,h,r2,g2,b2,i,ub,ub2 as integer
		  dim start, ende as integer
		  dim c as color
		  dim r,g,b as Double
		  
		  if p=nil then 
		    return nil
		  end if
		  
		  // verify if picture has an rgbsurface
		  insurf = p.rgbSurface
		  if insurf = nil then
		    p2 = New Picture(p.width,p.height,32)
		    if p2<>nil then
		      p2.graphics.drawpicture p,0,0
		      insurf = p2.rgbSurface
		    end
		  end
		  
		  intermediate = New Picture(p.width,p.height,32)
		  if intermediate<>nil then
		    intermediatesurf = intermediate.rgbSurface
		  end
		  
		  result = New Picture(p.width,p.height,32)
		  if result<>nil then
		    outsurf = result.rgbSurface
		  end
		  
		  if insurf = nil or intermediatesurf = nil or outsurf = nil then
		    return nil
		  end
		  
		  w = p.width-1
		  h = p.height-1
		  
		  // borders will not be treated. if somebody want to get until the border, he can provide a larger picture.
		  
		  ub = ubound(hor)
		  ub2 = ub\2
		  start = ub2
		  ende = w - ub2
		  
		  for x = start to ende
		    for y = 0 to h
		      if bitwiseand(channels,1) = 1 then
		        r = 0
		        for i = 0 to ub
		          r = r + insurf.pixel(x-ub2+i,y).red * hor(i)
		        next
		      else
		        r = insurf.pixel(x,y).red
		      end
		      if bitwiseand(channels,2) = 2 then
		        g = 0
		        for i = 0 to ub
		          g = g + insurf.pixel(x-ub2+i,y).green * hor(i)
		        next
		      else
		        g = insurf.pixel(x,y).green
		      end
		      if bitwiseand(channels,4) = 4 then
		        b = 0
		        for i = 0 to ub
		          b = b + insurf.pixel(x-ub2+i,y).blue * hor(i)
		        next
		      else
		        b = insurf.pixel(x,y).blue
		      end
		      intermediatesurf.pixel(x,y) = rgb(r,g,b)
		    next
		  next
		  
		  ub = ubound(ver)
		  ub2 = ub/2
		  start = ub2
		  ende = h - ub2
		  
		  for x = 0 to w
		    for y = start to ende
		      if bitwiseand(channels,1) = 1 then
		        r = 0
		        for i = 0 to ub
		          r = r + intermediatesurf.pixel(x,y-ub2+i).red * ver(i)
		        next
		      else
		        r = intermediatesurf.pixel(x,y).red
		      end
		      if bitwiseand(channels,2)= 2 then
		        g = 0
		        for i = 0 to ub
		          g = g + intermediatesurf.pixel(x,y-ub2+i).green * ver(i)
		        next
		      else
		        g = intermediatesurf.pixel(x,y).green
		      end
		      if bitwiseand(channels,4)= 4 then
		        b = 0
		        for i = 0 to ub
		          b = b + intermediatesurf.pixel(x,y-ub2+i).blue * ver(i)
		        next
		      else
		        b = intermediatesurf.pixel(x,y).blue
		      end
		      
		      outsurf.pixel(x,y) = rgb(r,g,b)
		    next
		  next
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LUT3d(extends p as picture, lut(,,,) as double, dither as boolean = false) As picture
		  dim p2, result as picture
		  dim insurf,outsurf as rgbSurface
		  dim x,y,r,g,b,w,h,r2,g2,b2 as integer
		  dim nx,ny,nz,nx1,ny1,nz1,i as integer
		  dim rrest, grest, brest as double
		  dim sxyz, fx,fy,fz as double  // sxyz neu double!
		  dim c as color
		  
		  
		  // expects a LUT(16,16,16,2), eg 17 values in each dimension, which makes even steps from 0..15.30..255
		  
		  if p=nil then return nil
		  
		  // verify if picture has an rgbsurface
		  insurf = p.rgbSurface
		  if insurf = nil then
		    p2 = New Picture(p.width,p.height,32)
		    if p2<>nil then
		      p2.graphics.drawpicture p,0,0
		      insurf = p2.rgbSurface
		    end
		  end
		  
		  result = New Picture(p.width,p.height,32)
		  if result<>nil then
		    outsurf = result.rgbSurface
		  end
		  
		  if insurf = nil or outsurf = nil then
		    return nil
		  end
		  
		  w = p.width-1
		  h = p.height-1
		  
		  for y = 0 to h
		    for x = 0 to w
		      c = insurf.Pixel(x,y)
		      r = c.red
		      g = c.green
		      b = c.blue
		      
		      nx = r \ 17
		      ny = g \ 17
		      nz = b \ 17
		      
		      nx1 = min(nx+1,15)  
		      ny1 = min(ny+1,15)  
		      nz1 = min(nz+1,15) 
		      
		      fx = (r mod 17) / 17.0
		      fy = (g mod 17) / 17.0
		      fz = (b mod 17) / 17.0
		      
		      
		      for i = 0 to 2
		        // tetraeder interpolation.
		        // would probably be faster if each channel coded  and not a for-loop
		        
		        if (fx > fy) then
		          if (fy > fz) then
		            Sxyz = (1.0-fx)* LUT( nx , ny , nz, i ) + (fx-fy)* LUT(nx1, ny , nz, i ) + (fy-fz)* LUT(nx1,ny1, nz, i ) + (fz)* LUT(nx1,ny1,nz1,i)
		          elseif (fx > fz) then
		            Sxyz = (1.0-fx)* LUT( nx , ny , nz, i ) + (fx-fz)* LUT(nx1, ny , nz, i ) + (fz-fy)* LUT(nx1, ny ,nz1, i) + (fy)* LUT(nx1,ny1,nz1,i)
		          else 
		            Sxyz = (1.0-fz)* LUT( nx , ny , nz, i) + (fz-fx)* LUT( nx , ny ,nz1, i) + (fx-fy)* LUT(nx1, ny ,nz1,i)+ (fy)* LUT(nx1,ny1,nz1,i)
		          end
		        else 
		          if (fz > fy) then
		            Sxyz = (1.0-fz)* LUT( nx , ny , nz,i ) + (fz-fy)* LUT( nx , ny ,nz1,i) + (fy-fx)* LUT( nx ,ny1,nz1,i) + (fx)* LUT(nx1,ny1,nz1,i)
		          elseif (fz > fx) then
		            Sxyz = (1.0-fy)* LUT( nx , ny , nz,i ) + (fy-fz)* LUT( nx ,ny1, nz ,i) + (fz-fx)* LUT( nx ,ny1,nz1,i) + (fx)* LUT(nx1,ny1,nz1,i)
		          else 
		            Sxyz = (1.0-fy)* LUT( nx , ny , nz,i ) + (fy-fx)* LUT( nx ,ny1, nz ,i) + (fx-fz)* LUT(nx1,ny1, nz ,i) + (fz)* LUT(nx1,ny1,nz1,i)
		          end
		        end
		        
		        select case i
		        case 0
		          if dither then r = r + rrest
		          r = Sxyz
		          rrest = Sxyz-r
		        case 1
		          if dither then g = g + grest
		          g = Sxyz
		          grest = Sxyz-g 
		        case 2
		          if dither then b = b + brest
		          b = Sxyz
		          brest = Sxyz-b
		        end
		        
		      next
		      
		      outsurf.pixel(x,y) = rgb(r,g,b)
		    next
		    
		  next
		  
		  
		  return result
		  
		  exception err as outofboundsException
		    
		    msgBox "matrix too small"
		    
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Matrix3d(extends p as picture, m(,) as double, dither as boolean = false) As picture
		  dim p2, result as picture
		  dim insurf,outsurf as rgbSurface
		  dim x,y,r,g,b,w,h,r2,g2,b2 as integer
		  dim rd,gd,bd as double 
		  dim rrest, grest, brest as double
		  dim c as color
		  
		  if p=nil then return nil
		  
		  // verify if picture has an rgbsurface
		  insurf = p.rgbSurface
		  if insurf = nil then
		    p2 = New Picture(p.width,p.height,32)
		    if p2<>nil then
		      p2.graphics.drawpicture p,0,0
		      insurf = p2.rgbSurface
		    end
		  end
		  
		  result = New Picture(p.width,p.height,32)
		  if result<>nil then
		    outsurf = result.rgbSurface
		  end
		  
		  if insurf = nil or outsurf = nil then
		    return nil
		  end
		  
		  w = p.width-1
		  h = p.height-1
		  
		  for x = 0 to w
		    for y = 0 to h
		      c = insurf.pixel(x,y)
		      r = c.red
		      g = c.green
		      b = c.blue
		      
		      rd = m(0,0)*r + m(1,0)*g + m(2,0)*b
		      gd = m(0,1)*r + m(1,1)*g + m(2,1)*b
		      bd = m(0,2)*r + m(1,2)*g + m(2,2)*b
		      
		      if dither then
		        rd = rd + rrest
		        r2 = rd
		        rrest = rd -r2
		        gd = gd + grest
		        g2 = gd
		        grest = gd -g2
		        bd = bd + brest
		        b2 = bd
		        brest = bd -b2
		      else
		        r2 = rd
		        g2 = gd
		        b2 = bd
		      end
		      
		      outsurf.pixel(x,y) = rgb(r2,g2,b2)
		    next
		  next
		  
		  return result
		  
		  exception err as outofboundsException
		    
		    msgBox "matrix too small"
		    
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Matrix3dwithConstants(extends p as picture, m(,) as double, dither as boolean = false) As picture
		  dim p2, result as picture
		  dim insurf,outsurf as rgbSurface
		  dim x,y,r,g,b,w,h,r2,g2,b2 as integer
		  dim rd,gd,bd,rrest,grest,brest as double
		  dim c as color
		  
		  if p=nil then return nil
		  
		  // verify if picture has an rgbsurface
		  insurf = p.rgbSurface
		  if insurf = nil then
		    p2 = New Picture(p.width,p.height,32)
		    if p2<>nil then
		      p2.graphics.drawpicture p,0,0
		      insurf = p2.rgbSurface
		    end
		  end
		  
		  result = New Picture(p.width,p.height,32)
		  if result<>nil then
		    outsurf = result.rgbSurface
		  end
		  
		  if insurf = nil or outsurf = nil then
		    return nil
		  end
		  
		  w = p.width-1
		  h = p.height-1
		  
		  for x = 0 to w
		    for y = 0 to h
		      c = insurf.pixel(x,y)
		      r = c.red + m(0,3)
		      g = c.green + m(1,3)
		      b = c.blue + m(2,3)
		      
		      rd = m(0,0)*r + m(1,0)*g + m(2,0)*b + m(3,0)
		      gd = m(0,1)*r + m(1,1)*g + m(2,1)*b + m(3,1)
		      bd = m(0,2)*r + m(1,2)*g + m(2,2)*b + m(3,2)
		      
		      if dither then
		        rd = rd + rrest
		        r2 = rd
		        rrest = rd -r2
		        gd = gd + grest
		        g2 = gd
		        grest = gd -g2
		        bd = bd + brest
		        b2 = bd
		        brest = bd -b2
		      else
		        r2 = rd
		        g2 = gd
		        b2 = bd
		      end
		      
		      outsurf.pixel(x,y) = rgb(r2,g2,b2)
		    next
		  next
		  
		  return result
		  
		  exception err as outofboundsException
		    
		    msgBox "matrix too small"
		    
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RunLengthDecode(extends m as memoryBlock) As memoryBlock
		  // must be dynamically resized. we start with 2 times the length
		  
		  dim i,j as integer
		  dim count as integer
		  dim test,b as integer
		  dim st as string
		  dim run as boolean
		  dim moffset, resultoffset as integer
		  dim result as memoryBlock
		  dim s as integer
		  
		  result = newmemoryBlock(m.size*2)
		  
		  
		  //Loop until you get the number of unpacked bytes you are expecting:
		  //  Read the next source byte into n.
		  //  If n is between 0 and 127 inclusive, copy the next n+1 bytes literally.
		  // Else if n is between -127 and -1 inclusive, copy the next byte -n+1 times.
		  //Else if n is -128, noop.
		  // Endloop
		  
		  //-127 signed char is 129 unsigned char
		  
		  s = m.size
		  
		  for i = 0 to s-1
		    test = m.byte(moffset)
		    moffset = moffset + 1
		    if test>=0 and test<=127 then
		      st = m.stringValue(moffset,test+1)
		      moffset = moffset + test + 1
		      
		      if result.size < resultoffset + test + 1 then
		        result.size = resultoffset + test + 1
		      end
		      result.stringValue(resultoffset,test+1) = st
		      resultoffset = resultoffset + test + 1
		      
		    elseif test = 128 then
		      // nop
		    else
		      test = test - 256 // make signed
		      b = m.byte(moffset)
		      moffset = moffset + 1
		      
		      if result.size < resultoffset - test + 1 then
		        result.size = resultoffset - test + 1
		      end
		      for j = 1 to -test + 1 
		        result.byte(resultoffset) = b
		        resultoffset = resultoffset + 1
		      next
		    end
		    i = moffset
		  next
		  result.size = resultoffset
		  return result
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RunLengthEncode(extends m as memoryBlock) As memoryBlock
		  // Decode:
		  //Loop until you get the number of unpacked bytes you are expecting:
		  //  Read the next source byte into n.
		  //  If n is between 0 and 127 inclusive, copy the next n+1 bytes literally.
		  // Else if n is between -127 and -1 inclusive, copy the next byte -n+1 times.
		  //Else if n is -128, noop.
		  // Endloop
		  
		  //-127 signed char is 129 unsigned char
		  
		  // worst case: result is 128/127 + 1 byte longer
		  
		  dim i as integer
		  dim count as integer
		  dim test,old,oldold as integer
		  dim st as string
		  dim run as boolean
		  dim moffset, resultoffset as integer
		  dim result as memoryBlock
		  dim s as integer
		  
		  result = newmemoryBlock(m.size*128/127+1)
		  
		  //test with declare
		  
		  
		  // this is a toolbox function in mac, but i never got it working.
		  'dim memIn,memOut  as memoryblock
		  '
		  'if s = 0 then
		  'return
		  'end
		  '
		  'memIn = newmemoryBlock(s)
		  'for i = 0 to s-1
		  'memin.byte(i) = m.readbyte
		  'next
		  'memOut = newmemoryBlock(s+(s+126)/127)
		  '
		  'Declare Sub PackBits Lib "InterfaceLib" (srcPtr as Ptr, dstPtr as Ptr, srcBytes as Integer)
		  '
		  'PackBits memIn,memOut,s
		  '
		  'for i = 0 to s+(s+126)/127-1
		  '
		  'next
		  '
		  'return
		  
		  test=-1
		  old = -1
		  oldold=-1
		  count = -1
		  run = false
		  st=""
		  s = m.size
		  for i = 0 to s-1
		    test = m.byte(moffset)
		    moffset = moffset + 1
		    if run then
		      if test = old then
		        count = count -1
		        if count = 129  then
		          result.byte(resultoffset) = count
		          resultoffset = resultoffset + 1
		          result.byte(resultoffset) = test
		          resultoffset = resultoffset + 1
		          run = false
		          test = -1
		          count = -1
		          st = ""
		        end if
		      else
		        result.byte(resultoffset) = count
		        resultoffset = resultoffset + 1
		        result.byte(resultoffset) = old
		        resultoffset = resultoffset + 1
		        run = false
		        count = 0
		        st =chrb(test)
		      end if
		    else
		      if test = old and test = oldold then
		        if count > 1 then
		          result.byte(resultoffset) = count-2
		          resultoffset = resultoffset + 1
		          result.stringvalue(resultoffset,lenb(st)) = st
		          resultoffset = resultoffset + lenb(st)
		          resultoffset = resultoffset - 2 // last 2 bytes are wrong
		        end if
		        run = true
		        count = 254
		        st =""
		      else
		        st = st + chrb(test)
		        count = count + 1
		        if count = 127 then
		          result.byte(resultoffset) = count
		          resultoffset = resultoffset + 1
		          result.stringvalue(resultoffset,lenb(st)) = st
		          resultoffset = resultoffset + lenb(st)
		          run = false
		          test = -1
		          count = -1
		          st = ""
		        end if
		      end if
		    end if
		    oldold = old
		    old = test
		    
		  next
		  if count >-1 then
		    if run then
		      result.byte(resultoffset) = count
		      resultoffset = resultoffset + 1
		      result.byte(resultoffset) = test
		      resultoffset = resultoffset + 1
		    else
		      result.byte(resultoffset) = count
		      resultoffset = resultoffset + 1
		      result.stringvalue(resultoffset,lenb(st)) = st
		      resultoffset = resultoffset + lenb(st)
		    end if
		  end if
		  result.size = resultoffset
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Unmultiply(extends p as picture) As picture
		  dim p2, maskpicture, result as picture
		  dim insurf,masksurf,outsurf as rgbSurface
		  dim x,y,r,g,b,m,w,h as integer
		  dim c as color
		  
		  if p=nil then return nil
		  
		  // verify if picture has an rgbsurface
		  insurf = p.rgbSurface
		  if insurf = nil then
		    p2 = New Picture(p.width,p.height,32)
		    if p2<>nil then
		      p2.graphics.drawpicture p,0,0
		      insurf = p2.rgbSurface
		    end
		  else
		    p2 = p
		  end
		  
		  maskpicture = p2.mask
		  masksurf = maskpicture.rgbsurface
		  
		  result = New Picture(p.width,p.height,32)
		  if result<>nil then
		    outsurf = result.rgbSurface
		  end
		  
		  if insurf = nil or masksurf = nil or  outsurf = nil then
		    return nil
		  end
		  
		  w = p.width-1
		  h = p.height-1
		  
		  for x = 0 to w
		    for y = 0 to h
		      c = insurf.pixel(x,y)
		      r = c.red
		      g = c.green
		      b = c.blue
		      m = 255-masksurf.pixel(x,y).green
		      
		      if m > 0 then
		        r = r * 255 / m
		        g = g * 255 / m
		        b = b * 255 / m
		      end
		      
		      outsurf.pixel(x,y) = rgb(r,g,b)
		    next
		  next
		  
		  result.mask.graphics.drawpicture maskpicture,0,0
		  
		  return result
		  
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About PictureConvolutionMBS
		
		Class PictureConvolutionMBS
		
		Filter a picture using a custom defined horizontal and vertical convolution.
		A conviolution is a filter window applied iteratively over the pixels.
		Convolution filtering is a basic image-processing function used for 
		applications like blurring, sharpening, edge detection and resampling.
		The filters are provides to the plugin as arrays of doubles. If the sum of the 
		values is not 1, then the resulting picture will be darker or brighter.
		The border pixels (filtersize/2) will not be processed but return white.
		If you need the filter until the border, then you need to provide a larger
		picture with either a black border or the last pixel repeated, whatever is
		more appropriate for you.
		
		Properties:
		- Hor() as double                :   filter set for horizontal filtering.
		- Ver() as double                :   filter set for vertical filtering
		- MaxX ??
		- MaxY ??
		- MinX ??
		- MinY ??
		- sourcePicture as Picture
		- destinationPicture as Picture
		
		Methods:
		- Run                            :    transform the sourcePicture into the destinationPicture
		- Close
		
		
	#tag EndNote

	#tag Note, Name = About PictureLut3dMBS
		
		Class PictureLut3dMBS
		
		Color correction of a picture using a three-dimensional lookup table.
		Lookup tables are used to speed up color corrections of an image. 
		A three-dimensional lookup table can modelise any correction and even 
		corrections based on experimental data, where no mathematical model is available.
		To be efficient, the lookup table cannot contain all values (17 million), 
		but only some values in a regular grid. The values are then interpolated.
		If you retain the corner values 0 and 255, there is a limited number of possible 
		grid sizes, all of which must be dividers of 255.
		We retain a table with 16*16*16 values which gives a good interpolation while keeping the size of the table small.
		
		Properties:
		- Table(15,15,15,2) as Double     :   look up table. The dimesions define red, green, blue and the channel.
		- MaxX ??
		- MaxY ??
		- MinX ??
		- MinY ??
		- sourcePicture as Picture
		- destinationPicture as Picture
		- dither as Boolean              :    dither rounding errors to avoid stepping artefacts
		
		Methods:
		- Run                            :    transform the sourcePicture into the destinationPicture
		- Close
		
		
	#tag EndNote

	#tag Note, Name = About PictureMatrix3DMBS
		
		Class PictureMatrix3dMBS
		
		Transformation of a picture in the RGB color space. 
		Each new color is defined as a linear combination of the old color. 
		This transformation can be used to make a picture gray or tinted or 
		to transform the picture into another color space like the video component space. 
		The matrix (0,0) - (2,2) define the multiplication factors.
		The vector (0,3) - (2,3) defines the constants added before the multiplication to the source channel.
		The vector (3,0) - (3,2) defines the constants added after the multiplication to the source channel.
		The value (3,3) is unused.
		Red, for example, is calculated using the following formula:
		red = Matrix(0,0)*(r+Matrix(0,3)) + Matrix(1,0)*(g+Matrix(1,3)) + Matrix(2,0)*(b+Matrix(2,3)) + Matrix(3,0)
		
		Properties:
		- Matrix(3,3) as Double          :    
		- MaxX ??
		- MaxY ??
		- MinX ??
		- MinY ??
		- sourcePicture as Picture
		- destinationPicture as Picture
		- dither as Boolean              :    dither rounding errors to avoid stepping artefacts
		
		Methods:
		- Run                            :    transform the sourcePicture into the destinationPicture
		- Close
		
		
		
		
	#tag EndNote


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
			InitialValue="2147483648"
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
