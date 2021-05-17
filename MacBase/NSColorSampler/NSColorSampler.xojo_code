#tag Class
Protected Class NSColorSampler
Inherits NSColorSamplerMBS
	#tag Event
		Sub Completed(selectedColor as NSColorMBS)
		  
		  If selectedColor = Nil Then
		    output.Backdrop = Nil
		  Else
		    
		    Dim p As New Picture(output.Width, output.Height)
		    
		    p.Graphics.ForeColor = selectedColor.colorValue
		    p.Graphics.FillRect 0, 0, p.Width, p.Height
		    
		    output.Backdrop = p
		    
		  End If
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		output As canvas
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
