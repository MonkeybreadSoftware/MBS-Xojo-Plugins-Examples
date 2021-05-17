#tag Class
Protected Class MKDirections
Inherits MKDirectionsMBS
	#tag Event
		Sub calculateDirectionsCompleted(response as MKDirectionsResponseMBS, error as NSErrorMBS, tag as Variant)
		  list.DeleteAllRows
		  
		  if error <> nil then
		    MsgBox error.LocalizedDescription
		  end if
		  
		  
		  if response <> nil then
		    dim routes() as MKRouteMBS = response.routes
		    
		    for each route as MKRouteMBS in routes
		      dim a as string = join(route.advisoryNotices, ", ")
		      if a.len > 0 then
		        a = " ("+a+")"
		      end if
		      list.AddFolder route.name+" with "+str(route.expectedTravelTime/60)+" minutes"+a
		      list.RowTag(list.LastIndex) = route
		    next
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		list As listbox
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
