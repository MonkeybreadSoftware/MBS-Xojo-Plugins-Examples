#tag Class
Protected Class MKLocalSearch
Inherits MKLocalSearchMBS
	#tag Event
		Sub SearchFinished(response as MKLocalSearchResponseMBS, error as NSErrorMBS, tag as Variant)
		  #Pragma unused tag
		  
		  If response <> Nil Then
		    
		    Dim mapItems() As MKMapItemMBS = response.mapItems
		    
		    ' ResultList.DeleteAllRows
		    
		    For Each mapItem As MKMapItemMBS In mapItems
		      
		      Dim location As CLLocationMBS = mapItem.placemark.location
		      ResultList.AddRow mapItem.Name, Str(location.Latitude)+"/"+Str(location.longitude)
		      ResultList.RowTag( ResultList.LastIndex ) = mapItem 
		      
		      
		      Dim p As MKPlacemarkMBS = mapItem.placemark
		      ResultList.AddRow "Placemark found:"
		      
		      ResultList.AddRow "   name: ", p.name
		      ResultList.AddRow "   locality: ", p.locality
		      ResultList.AddRow "   subLocality: ", p.subLocality
		      ResultList.AddRow "   thoroughfare: ", p.thoroughfare
		      ResultList.AddRow "   subThoroughfare: ", p.subThoroughfare
		      For Each a As String In p.areasOfInterest
		        ResultList.AddRow "   areasOfInterest: ", a
		      Next
		      ResultList.AddRow "   inlandWater: ", p.inlandWater
		      ResultList.AddRow "   ocean: ", p.ocean
		      
		      ResultList.AddRow "   postalCode: ", p.postalCode
		      ResultList.AddRow "   administrativeArea: ", p.administrativeArea
		      ResultList.AddRow "   subAdministrativeArea: ", p.subAdministrativeArea
		      ResultList.AddRow "   ISOcountryCode: ", p.ISOcountryCode
		      ResultList.AddRow "   country: ", p.country
		      
		      Dim cl As CLLocationMBS = p.location
		      If cl<>Nil Then
		        ResultList.AddRow "   latitude: ",CStr(cl.latitude)
		        ResultList.AddRow "   longitude: ",CStr(cl.longitude)
		      End If
		      
		    next
		    
		  End If
		  
		  If error <> Nil Then
		    MsgBox error.LocalizedDescription
		  End If
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		ResultList As listbox
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
