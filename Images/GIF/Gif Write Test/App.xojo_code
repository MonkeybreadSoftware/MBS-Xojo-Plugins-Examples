#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim g as GIFMBS
		  dim b as GifBlockMBS
		  dim p as GifPictureMBS
		  dim pal as GifPaletteMBS
		  dim f as FolderItem
		  dim c as GifScreenMBS
		  dim i as integer
		  dim m as MemoryBlock
		  
		  pal=new GifPaletteMBS
		  pal.Count=256
		  for i=0 to 255
		    pal.Red(i)=rnd*256
		    pal.green(i)=rnd*256
		    pal.blue(i)=rnd*256
		  next
		  
		  // random pixels
		  m=NewMemoryBlock(100*100)
		  for i=0 to 9999
		    m.Byte(i)=rnd*256
		  next
		  
		  p=new GifPictureMBS
		  p.Data=m
		  p.Width=100
		  p.Height=100
		  p.Palette=pal
		  p.Top=0
		  p.Left=0
		  p.Interlace=true
		  p.PaletteDepth=8
		  
		  b=new GifBlockMBS
		  b.Intro=&h2C // picture block
		  b.Picture=p
		  
		  c=new GifScreenMBS
		  c.Height=100
		  c.Width=100
		  c.Palette=pal
		  c.PaletteDepth=8
		  c.ColorResolution = 8
		  c.HasPalette = true
		  
		  g=new GIFMBS
		  g.Add b
		  g.Screen=c
		  
		  f = SpecialFolder.Desktop.Child("Gif Write Test.gif")
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
