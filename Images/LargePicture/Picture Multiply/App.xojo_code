#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // load a picture
		  dim f as FolderItem = GetFolderItem("test.png")
		  dim p as Picture = Picture.Open(f)
		  
		  if not p.HasAlphaChannel then
		    MsgBox "test.png has no alpha channel?"
		    return
		  end if
		  
		  // show original
		  dim p0 as Picture = PictureWithAlphaToPictureWithMask(p)
		  dim w0 as new window1
		  w0.Title = "Original"
		  w0.Backdrop = p0
		  
		  
		  
		  // convert from alpha to mask
		  dim p1 as Picture = PictureWithAlphaToPictureWithMask(p)
		  dim w1 as new window1
		  w1.Title = "PictureWithMask"
		  w1.Backdrop = p1
		  
		  
		  // show mask
		  dim w2 as new window1
		  w2.Title = "Mask"
		  w2.Backdrop = p1.CopyMask
		  
		  
		  // show picture part without mask
		  dim w3 as new window1
		  w3.Title = "Picture without mask"
		  dim pm as Picture = p1.mask
		  p1.mask = nil
		  dim p2 as new Picture(p1.Width, p1.Height, 32)
		  p2.Graphics.DrawPicture p1, 0, 0
		  w3.Backdrop = p2
		  p1.mask = pm
		  
		  
		  // convert back
		  dim p3 as Picture = PictureWithMaskToPictureWithAlpha(p1)
		  dim w4 as new window1
		  w4.Title = "alpha"
		  w4.Backdrop = p3
		  
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function PictureWithAlphaToPictureWithMask(pic as Picture) As Picture
		  // converts picture with alpha to picture with mask
		  
		  #if RBVersion >= 2016 then
		    dim w as integer = pic.Width
		    dim h as integer = pic.Height
		    
		    if pic.Type <> Picture.Types.MutableBitmap then
		      // make a copy, so we get a bitmap picture
		      dim t as new Picture(w, h)
		      t.Graphics.DrawPicture pic, 0, 0, w, h, 0, 0, w, h
		      pic = t
		    end if
		  #endif
		  
		  if pic.HasAlphaChannel = false then
		    // no alpha channel, so return
		    return pic
		  end if
		  
		  dim pi as new PictureMBS(pic, true)
		  
		  // unmultiply the image
		  pi.Unmultiply
		  pi.AlphaChannel.Invert
		  
		  return pi.CopyPictureWithMask
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PictureWithMaskToPictureWithAlpha(pic as Picture) As Picture
		  // converts picture with mask to picture with alpha
		  
		  dim w as integer = pic.Width
		  dim h as integer = pic.Height
		  
		  #if RBVersion >= 2016 then
		    if pic.Type <> Picture.Types.MutableBitmap then
		      // make a copy, so we get a bitmap picture
		      dim t as new Picture(w, h)
		      t.Graphics.DrawPicture pic, 0, 0, w, h, 0, 0, w, h
		      pic = t
		    end if
		  #endif
		  
		  if pic.HasAlphaChannel then
		    // has alpha channel, so return
		    return pic
		  end if
		  
		  
		  
		  #if true then
		    // via Xojo
		    dim t as new Picture(w, h)
		    t.Graphics.DrawPicture pic, 0, 0, w, h, 0, 0, w, h
		    return t
		  #endif
		  
		  
		  #if false then
		    // with CopyPictureWithAlpha
		    
		    dim pi as new PictureMBS(pic, false)
		    dim pm as new PictureMBS(pic.Mask, false)
		    
		    
		    dim pp as new PictureMBS(w, h, PictureMBS.ImageFormatRGBA)
		    
		    call pp.CopyPixels(pi, 0, 0, w, h, 0, 0)
		    call pp.AlphaChannel.CopyPixels(pm, 0, 0, w, h, 0, 0)
		    
		    pp.AlphaChannel.Invert
		    
		    // multiply the image
		    pp.Multiply
		    
		    return pp.CopyPictureWithAlpha
		    
		  #endif
		  
		  #if false then
		    // with Xojo picture as buffer
		    
		    dim pi as new PictureMBS(pic, false)
		    dim pm as new PictureMBS(pic.Mask, false)
		    
		    dim xx as new Picture(w, h)
		    dim pp as new PictureMBS(xx, true)
		    
		    call pp.CopyPixels(pi, 0, 0, w, h, 0, 0)
		    call pp.AlphaChannel.CopyPixels(pm, 0, 0, w, h, 0, 0)
		    
		    pp.AlphaChannel.Invert
		    
		    // multiply the image
		    pp.Multiply
		    
		    return xx
		  #endif
		  
		End Function
	#tag EndMethod


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
