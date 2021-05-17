#tag Module
Protected Module Module1
	#tag Method, Flags = &h0
		Function OpenAsCoreImage(extends f as folderitem) As picture
		  // Open using CoreImage
		  
		  'dim width as integer
		  'dim height as integer
		  dim c as CIImageMBS
		  'dim g as CGPictureContextMBS
		  'dim r as CGRectMBS
		  'dim cg as CIContextMBS
		  
		  // load image from file
		  
		  c=NewCIImagewithFileMBS(f)
		  
		  if c<>nil then
		    return c.RenderPicture
		    
		    'r=c.Extent
		    'width=r.MaxX
		    'height=r.MaxY
		    '
		    'g=new CGPictureContextMBS(width,height)
		    'if g.Handle<>0 then // valid?
		    'cg=NewCIContextMBS(g)
		    '
		    'if cg<>Nil then
		    'cg.DrawImageRect c,CGMakeRectMBS(0,0,width,height),r
		    'cg=nil
		    'end if
		    '
		    'Return g.CopyPicture
		    'end if
		    
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
