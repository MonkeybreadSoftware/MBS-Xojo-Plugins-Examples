#tag Module
Protected Module Module1
	#tag Method, Flags = &h0
		Function OpenAsNSimage(extends file as folderitem) As picture
		  // this one is resolution indepenend!
		  
		  dim width as integer
		  dim height as integer
		  
		  // load image from file
		  dim c as new NSImageMBS(file)
		  
		  // is that image valid?
		  if c.isValid then
		    Width = c.MaximumPixelWidth
		    height = c.MaximumPixelHeight
		    
		    // We want maximum size of pixels!
		    c.ScalesWhenResized = True
		    c.SetSize width,height
		    
		    // create a drawing buffer to draw inside
		    dim pic as new Picture(width, height, 32)
		    dim g as CGBitmapContextMBS = CGBitmapContextMBS.CreateWithPicture(pic)
		    
		    if g.Handle<>0 then // valid?
		      
		      // now draw the image inside.
		      // you could scale or even apply transparency...
		      if c.DrawIntoCGContextAtRect(g.Handle, 0, 0, c.width, c.height, 0,0,c.width,c.height,2,1.0) then
		        // make a RB Picture from it
		        Return pic
		      end if
		    end if
		  end if
		  
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
