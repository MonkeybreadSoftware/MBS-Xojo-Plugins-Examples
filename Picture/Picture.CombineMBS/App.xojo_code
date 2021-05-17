#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  withPlugin
		  withoutPlugin
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Combine(pDestImage As Picture, pImage As Picture, pMask As Picture, pDestX As Integer, pDestY As Integer, pSourceX As Integer, pSourceY As Integer, pWidth As Integer, pHeight As Integer, pUseColours As Boolean, pForeColour As Integer = -65536,  pMaskColour As Integer = -65536) As Boolean
		  Dim tileColour As Integer
		  Dim tempImage As Picture
		  
		  If pMask <> Nil Then
		    tileColour = RGB2Int(RGB(0, 0, 0))
		  End If
		  
		  If pForeColour >=0 Then
		    tileColour = pForeColour
		  End If
		  
		  If pMaskColour >=0 Then
		    tileColour = pMaskColour
		  End If
		  
		  If (pMask = Nil) And (pForeColour <0) And (pMaskColour <0) Then
		    pDestImage.graphics.DrawPicture(pImage, pDestX, pDestY, pWidth, pHeight, pSourceX, pSourceY, pWidth, pHeight)
		  Else
		    tempImage = New Picture(pWidth, pHeight, 32)
		    If pMask <> Nil Then
		      tempImage.graphics.DrawPicture(pImage, 0, 0, pWidth, pHeight, pSourceX, pSourceY, pWidth, pHeight)
		      tempImage.mask.graphics.DrawPicture(pMask, 0, 0, pWidth, pHeight, pSourceX, pSourceY, pWidth, pHeight)
		    Elseif pMaskColour <0 Then
		      tempImage.graphics.ForeColor = Int2RGB(tileColour)
		      tempImage.graphics.FillRect(0, 0, pWidth, pHeight)
		      tempImage.mask.graphics.DrawPicture(pImage, 0, 0, pWidth, pHeight, pSourceX, pSourceY, pWidth, pHeight)
		    Else
		      If pUseColours = True Then
		        tempImage.mask.graphics.ForeColor = Int2RGB(tileColour)
		      Else
		        tempImage.mask.graphics.ForeColor = RGB(0, 0, 0)
		      End If
		      tempImage.mask.graphics.FillRect(0, 0, pWidth, pHeight)
		      tempImage.graphics.DrawPicture(pImage, 0, 0, pWidth, pHeight, pSourceX, pSourceY, pWidth, pHeight)
		    End If
		    
		    pDestImage.graphics.DrawPicture(tempImage, pDestX, pDestY, pWidth, pHeight, 0, 0, pWidth, pHeight)
		  End If
		  
		  Return true
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Int2RGB(pIntColour As Integer) As Color
		  Dim theRGB As Color
		  Dim r,g,b As Integer
		  
		  r = pIntColour \ 65536
		  pIntColour = pIntColour - (r * 65536)
		  g = pIntColour \ 256
		  pIntColour = pIntColour - (g * 256)
		  b = pIntColour
		  
		  theRGB = RGB(r,g,b)
		  
		  return theRGB
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrepareDestImage() As Picture
		  dim p as Picture
		  
		  p = new Picture(500,500,32)
		  
		  'p.Graphics.ForeColor=&cFF7777
		  'p.Graphics.FillRect 0,0,500,500
		  
		  'p.Graphics.ForeColor=&c000077
		  'p.Graphics.FillRect 0,0,500,500
		  
		  Return p
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RGB2Int(pRGBColor As Color) As Integer
		  Dim theIntColour As Integer
		  
		  theIntColour = pRGBColor.red * 65536
		  theIntColour = theIntColour + pRGBColor.green * 256
		  theIntColour = theIntColour + pRGBColor.blue
		  
		  return theIntColour
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub withoutPlugin()
		  dim DestImage As Picture
		  dim Image As Picture
		  dim Mask As Picture
		  dim logo As Picture
		  dim DestX As Integer=0
		  dim DestY As Integer=0
		  dim SourceX As Integer=0
		  dim SourceY As Integer=0
		  dim Width As Integer=500
		  dim Height As Integer=500
		  dim w as window1
		  
		  logo=LogoMBS(500)
		  image = new Picture(logo.width, logo.height,32) // works for 24 and 32 bit
		  image.Graphics.DrawPicture logo,0,0
		  Mask=nil
		  
		  DestImage=PrepareDestImage
		  
		  if Combine(DestImage, image,Mask,DestX,DestY,SourceX,SourceY,Width,Height,false) then
		    w=new window1
		    w.left=1000
		    w.top=50
		    w.Title="RB: no mask, no colors"
		    w.backdrop=DestImage
		    w.show
		  end if
		  
		  
		  DestImage=PrepareDestImage
		  if Combine(DestImage, image,Mask,DestX,DestY,SourceX,SourceY,Width,Height,false,&h777777) then
		    w=new window1
		    w.Left=1500
		    w.top=50
		    w.Title="RB: with forecolor"
		    w.backdrop=DestImage
		    w.show
		  end if
		  
		  mask = new Picture(500,500,32)
		  mask.Graphics.ForeColor=&cFFFFFF
		  mask.Graphics.Fillrect 0,0,500,500
		  mask.Graphics.ForeColor=&c000000
		  mask.Graphics.FillOval 0,0,500,500
		  
		  DestImage=PrepareDestImage
		  if Combine(DestImage, image,Mask,DestX,DestY,SourceX,SourceY,Width,Height,false) then
		    w=new window1
		    w.left=1000
		    w.top=550
		    w.Title="RB: with mask"
		    w.backdrop=DestImage
		    w.show
		  end if
		  
		  mask=nil
		  
		  DestImage=PrepareDestImage
		  if Combine(DestImage, image,Mask,DestX,DestY,SourceX,SourceY,Width,Height,true,&h777777,&h777777) then
		    w=new window1
		    w.Left=1500
		    w.Title="RB: with two colors"
		    w.top=550
		    w.backdrop=DestImage
		    w.show
		  end if
		  
		  System.DebugLog "finished"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub withPlugin()
		  dim DestImage As Picture
		  dim Image As Picture
		  dim Mask As Picture
		  dim logo As Picture
		  dim DestX As Integer=0
		  dim DestY As Integer=0
		  dim SourceX As Integer=0
		  dim SourceY As Integer=0
		  dim Width As Integer=500
		  dim Height As Integer=500
		  dim w as window1
		  
		  logo=LogoMBS(500)
		  image = new Picture(logo.width, logo.height,32) // works for 24 and 32 bit
		  image.Graphics.DrawPicture logo,0,0
		  Mask=nil
		  
		  DestImage=PrepareDestImage
		  if DestImage.CombineMBS(image,Mask,DestX,DestY,SourceX,SourceY,Width,Height,false,-1,-1) then
		    w=new window1
		    w.left=0
		    w.top=50
		    w.Title="Plugin: no mask, no colors"
		    w.backdrop=DestImage
		    w.show
		  end if
		  
		  
		  DestImage=PrepareDestImage
		  if DestImage.CombineMBS(image,Mask,DestX,DestY,SourceX,SourceY,Width,Height,false,&c777777) then
		    w=new window1
		    w.Left=500
		    w.top=50
		    w.Title="Plugin: with forecolor"
		    w.backdrop=DestImage
		    w.show
		  end if
		  
		  mask = new Picture(500,500,32)
		  mask.Graphics.ForeColor=&cFFFFFF
		  mask.Graphics.Fillrect 0,0,500,500
		  mask.Graphics.ForeColor=&c000000
		  mask.Graphics.FillOval 0,0,500,500
		  
		  DestImage=PrepareDestImage
		  if DestImage.CombineMBS(image,Mask,DestX,DestY,SourceX,SourceY,Width,Height,false,-1,-1) then
		    w=new window1
		    w.left=0
		    w.top=550
		    w.Title="Plugin: with mask"
		    w.backdrop=DestImage
		    w.show
		  end if
		  
		  mask=nil
		  
		  DestImage=PrepareDestImage
		  if DestImage.CombineMBS(image,Mask,DestX,DestY,SourceX,SourceY,Width,Height,true,&c777777,&c777777) then
		    w=new window1
		    w.Left=500
		    w.Title="Plugin: with two colors"
		    w.top=550
		    w.backdrop=DestImage
		    w.show
		  end if
		  
		  System.DebugLog "finished"
		  
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
