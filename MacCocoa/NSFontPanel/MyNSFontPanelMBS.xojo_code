#tag Class
Protected Class MyNSFontPanelMBS
Inherits NSFontPanelMBS
	#tag Event
		Sub changeAttributes()
		  dim oldAttr as Dictionary = window1.dic
		  dim newAttr as Dictionary = convertAttributes(oldAttr)
		  
		  window1.dic = newAttr
		  
		  for each k as Variant in newAttr.Keys
		    dim v as Variant = newAttr.Value(k)
		    
		    if v isa NSColorMBS then
		      dim n as NSColorMBS = v
		      window1.Liste.AddRow k.StringValue+" -> "+n.description
		    else
		      window1.Liste.AddRow k.StringValue+" -> "+v.StringValue
		    end if
		  next
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub changeFont()
		  dim oldFont as NSFontMBS = window1.font
		  dim newFont as NSFontMBS = convertFont(oldFont)
		  
		  window1.font = newFont
		  window1.Liste.AddRow newFont.displayName
		  window1.Liste.AddRow newFont.description
		  
		  
		End Sub
	#tag EndEvent


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
