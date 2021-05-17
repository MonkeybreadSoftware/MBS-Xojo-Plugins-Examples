#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  MakeImages
		  MainWindow.Show
		  
		  Convert8bit
		  
		  Write
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub Convert8bit()
		  dim i,c as integer
		  
		  c=UBound(images)
		  for i=0 to c
		    Convert8bit images(i)
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Convert8bit(pic as picture)
		  dim p as new PaletteCalculatorMBS
		  
		  call p.CreatePicturePalette(pic)
		  
		  dim pal as new GifPaletteMBS
		  pal.Count=256
		  for i as integer=0 to 255
		    dim co as color=p.col(i)
		    pal.Red(i)=co.red
		    pal.green(i)=co.green
		    pal.blue(i)=co.blue
		  next
		  
		  Palettes.Append pal
		  data.Append p.TransformBetterDithering(pic)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MakeImages()
		  dim i as integer
		  dim logo as Picture=LogoMBS(300)
		  
		  
		  for i=30 downto 0
		    dim p as Picture = New Picture(300,300,32)
		    
		    dim x,y,w,h as integer
		    
		    w=300-i*10
		    h=300-i*10 // from bottom
		    
		    x=(300-w)/2
		    y=(300-h)/2+i*2
		    
		    p.Graphics.ForeColor=&cFFFFFF
		    p.Graphics.FillRect 0,0,p.Width,p.Height
		    p.Graphics.DrawPicture logo,x,y,w,h,0,0,logo.Width,logo.Height
		    
		    images.Append p
		    
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Write()
		  dim i,c as integer
		  dim g as new GIFMBS
		  dim f as FolderItem
		  
		  // create the memory block for a looping gif
		  dim m as new MemoryBlock(3)
		  m.LittleEndian = true
		  m.Int8Value(0) = 1 // block ID must be 1
		  m.Int16Value(1) = 0 // number of times to loop, 0 = endless
		  
		  dim d1 as new GifDataMBS
		  d1.DataString = "NETSCAPE2.0" // Netscape made the extensions for repeat
		  
		  dim d2 as new GifDataMBS
		  d2.dataMemory = m
		  
		  dim e as new GifExtensionMBS
		  e.Add d1
		  e.Add d2
		  e.Marker=&hFF
		  
		  dim b as new GifBlockMBS
		  b.Intro=&h21 // picture block
		  b.Extension=e
		  
		  g.add b
		  
		  
		  // now add frames
		  c=UBound(images)
		  for i=0 to c
		    Write g,i
		  next
		  
		  // global size and palette
		  dim s as new GifScreenMBS
		  s.Height=300
		  s.Width=300
		  s.Palette=Palettes(0)
		  s.PaletteDepth=8
		  s.HasPalette = true
		  g.Screen=s
		  
		  f=SpecialFolder.Desktop.Child("Gif Write Animated.gif")
		  if f.SaveAsGIFMBS(g) then
		    f.Launch
		  else
		    MsgBox "fail"
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Write(g as gifmbs, i as integer)
		  dim d as new GifDataMBS
		  dim m as MemoryBlock
		  
		  // extension to control graphic
		  m=New MemoryBlock(4)
		  m.LittleEndian=true
		  m.Byte(0)=0 // flags, needs to be set to correct value for using transparent color!
		  m.UShort(1)=10 // delay in 100th seconds
		  m.Byte(3)=0 // transparent color index
		  
		  d.DataMemory=m
		  
		  dim e as new GifExtensionMBS
		  e.Marker=&hF9
		  e.add d
		  
		  dim p as new GifPictureMBS
		  p.Data=data(i)
		  p.Width=300
		  p.Height=300
		  p.Palette=Palettes(i)
		  p.Top=0
		  p.Left=0
		  p.Interlace=true
		  p.HasPalette = true
		  p.PaletteDepth=8
		  
		  dim b as new GifBlockMBS
		  b.Intro=&h21 // picture block
		  b.Extension=e
		  
		  g.add b
		  
		  b = new GifBlockMBS
		  b.Intro=&h2C // picture block
		  b.Picture=p
		  g.Add b
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected data(-1) As memoryBlock
	#tag EndProperty

	#tag Property, Flags = &h0
		images(-1) As picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected palettes(-1) As gifpaletteMBS
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
