#tag Module
Protected Module UtilModule
	#tag Method, Flags = &h0
		Sub AddRow(extends p as PopupMenu, text as string, tag as Variant)
		  p.AddRow text
		  p.RowTag(p.ListCount-1) = tag
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ProportinalScaled(extends pic as Picture, Width as integer, Height as Integer) As Picture
		  // Calculate scale factor
		  
		  dim faktor as Double = min( Height / Pic.Height, Width / Pic.Width)
		  
		  // Calculate new size
		  dim w as integer = Pic.Width * faktor
		  dim h as integer = Pic.Height * faktor
		  
		  // create new picture
		  dim NewPic as new Picture(w,h,32)
		  
		  // draw picture in the new size
		  NewPic.Graphics.DrawPicture Pic, 0, 0, w, h, 0, 0, Pic.Width, Pic.Height
		  
		  // return result
		  Return NewPic
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
