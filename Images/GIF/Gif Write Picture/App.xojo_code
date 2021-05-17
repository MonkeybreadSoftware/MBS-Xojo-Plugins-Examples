#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // take some picture
		  dim pic as Picture = logoMBS(500)
		  
		  dim pc as new PaletteCalculatorMBS
		  
		  call pc.CreatePicturePalette(pic)
		  
		  // create palette
		  dim pal as new GifPaletteMBS
		  pal.Count=256
		  for i as integer=0 to 255
		    dim co as color=pc.col(i)
		    pal.Red(i)=co.red
		    pal.green(i)=co.green
		    pal.blue(i)=co.blue
		  next
		  
		  // create 8 bit picture for that palette
		  dim data as MemoryBlock = pc.TransformBetterDithering(pic)
		  
		  // assemble the GIF image
		  dim p as new GifPictureMBS
		  p.Data = data
		  p.Width = pic.Width
		  p.Height = pic.Height
		  p.Palette = pal
		  p.Top = 0
		  p.Left = 0
		  p.Interlace = true
		  p.PaletteDepth = 8
		  
		  Dim b as new GifBlockMBS
		  b.Intro=&h2C // picture block
		  b.Picture=p
		  
		  dim c as new GifScreenMBS
		  c.Height = pic.Height
		  c.Width = pic.Width
		  c.Palette=pal
		  c.PaletteDepth=8
		  c.HasPalette = true
		  c.ColorResolution = 8
		  c.BackgroundColor = 0
		  
		  dim g as new GIFMBS
		  g.Add b
		  g.Screen=c
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Gif Write Test.gif")
		  if f.SaveAsGIFMBS(g) then
		    MsgBox "ok"
		    f.Launch
		  else
		    MsgBox "fail"
		  end if
		  
		  Quit
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
