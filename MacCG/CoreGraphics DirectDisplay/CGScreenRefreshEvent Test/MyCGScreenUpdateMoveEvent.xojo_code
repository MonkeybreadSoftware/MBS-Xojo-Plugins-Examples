#tag Class
Protected Class MyCGScreenUpdateMoveEvent
Inherits CGScreenUpdateMoveEventMBS
	#tag Event
		Sub ScreenMove(deltaX as Integer, deltaY as Integer, rectCount as Integer, rects() as CGRectMBS)
		  dim n as integer = 0
		  
		  list.InsertRow n, "ScreenMove "+str(deltaX)+"/"+str(deltaY)+" with "+str(rectCount)+" rectangles"
		  
		  for each r as CGRectMBS in rects
		    n = n + 1
		    list.InsertRow n, "   pos: "+str(r.Left)+"/"+str(r.top)+", width: "+str(r.Width)+", height: "+str(r.Height)
		  next
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		list As Listbox
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
