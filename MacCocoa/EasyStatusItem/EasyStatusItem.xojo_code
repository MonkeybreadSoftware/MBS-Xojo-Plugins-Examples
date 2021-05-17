#tag Class
Protected Class EasyStatusItem
Inherits NSStatusItemMBS
	#tag Method, Flags = &h1000
		Sub Constructor(image As Picture,menu As NSMenuMBS=nil,hasMask as boolean=true)
		  dim p as picture=new picture(image.Width,MenuBarHeightMBS,32)
		  dim cgd As CGDisplayMBS=CGDisplayMBS.MainDisplay
		  dim scale As Double=1
		  
		  if Image.Height>MenuBarHeightMBS then scale=MenuBarHeightMBS/image.Height
		  
		  call me.CreateMenu(image.Width*scale)
		  
		  
		  backdrop=new picture(image.Width*scale,MenuBarHeightMBS,32)
		  p.Mask.Graphics.ClearRect(0,0,p.Width,p.Height)
		  me.Image=new NSImageMBS(p,p.mask) ///give the menu a blank image so we can capture a shot of the menubar for a backdrop
		  backdrop=cgd.CreateImageForRect(new CGRectMBS(me.left,me.Top,me.Width,me.Height-1)).Picture(CGColorSpaceMBS.CreateWithName(CGColorSpaceMBS.kCGColorSpaceGenericRGB))
		  
		  me.HighlightMode=true
		  
		  if not hasMask then
		    Image.Mask=image
		    image.Graphics.FillRect(0,0,Image.Width,Image.Height)
		  end if
		  
		  p=image.ScaleMBS(image.Width*scale,Image.Height*scale,true)
		  p.mask=image.mask.ScaleMBS(image.Width*scale,Image.Height*scale,true)
		  
		  SetImage p
		  
		  if menu<>nil then me.Menu=menu
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetImage(value As picture)
		  dim p As Picture=new picture(value.Width,value.Height,32)
		  dim p2 As Picture=new picture(value.Width,value.Height,32)
		  dim nsi As NSImageMBS=new NSImageMBS
		  dim ok As Boolean
		  
		  mmyImage = value
		  
		  //make an inverted alternateImage with original mask
		  p=value.InvertMBS
		  p.mask=value.mask
		  ok=nsi.initWithPicture(p,p.mask)
		  me.alternateImage=nsi
		  
		  //make the new image with menubar background
		  p2=BackDrop.CopyPictureWithoutMaskMBS
		  p2.mask=value.Mask.InvertMBS
		  p=value.CopyPictureWithMaskMBS
		  p.graphics.drawpicture(p2,0,0)
		  p.mask=value.Mask.ChangeBrightnessAbsoluteMBS(-20) // so it's all clickable
		  
		  ok=nsi.initWithPicture(p,p.mask)
		  me.Image=nsi
		End Sub
	#tag EndMethod


	#tag Note, Name = Information
		EasyStatusMenu is a subclass to quickly create a statusmenu.
		It creates a capture of the menubar where the menu will reside
		and uses that to draw an almost transaperent but clickable background.
		
		Use the normal method for updating the NSMenuMBS property or just pass a reference to the construcor.
		
		Pass a black and white image with a mask for best results, you can also pass false in the constructor
		to use the black areas of the image as a mask.
		
		An alternateImage(clicked state) will be created for you, but you can also set your own after the constructor.
		
		If the image is taller than MenuBarHeightMBS it will be scaled down to fit.
		
		call it like this...
		
		myStatusItem=new EasyStatusItem(image,NSMenuMBS,hasMask)
		
		...and store the result in a persistant variable.
		
		This example was created by Jim McKay of piDog Software and is free to use and modify.
		http://www.pidog.com
	#tag EndNote


	#tag Property, Flags = &h21
		Private BackDrop As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mmyImage As Picture
	#tag EndProperty


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
			InitialValue=""
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
