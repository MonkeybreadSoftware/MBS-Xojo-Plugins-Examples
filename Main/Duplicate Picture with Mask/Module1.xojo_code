#tag Module
Protected Module Module1
	#tag Method, Flags = &h0
		Function Duplicate(extends p as Picture) As Picture
		  #if RBVersion >= 2011.04 then
		    if p.HasAlphaChannel then
		      
		      // create nw picture and copy content:
		      dim q as new Picture(p.Width, p.Height)
		      q.Graphics.DrawPicture p,0,0
		      
		      Return q
		      
		    end if
		  #endif
		  
		  // create new picture
		  dim q as new Picture(p.Width, p.Height, 32)
		  
		  // get mask
		  dim oldMask as Picture = p.mask(false)
		  if oldMask = nil then
		    // no mask, so simple copy
		    q.Graphics.DrawPicture p,0,0
		    Return q
		  end if
		  
		  // remove mask
		  p.mask = nil
		  
		  // copy picture and mask
		  q.Graphics.DrawPicture p, 0, 0
		  q.mask.Graphics.DrawPicture oldMask,0,0
		  
		  // restore mask
		  p.mask = oldmask
		  
		  Return q
		  
		  
		  
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
