#tag Class
Protected Class MyCLGeocodeCompletionHandlerMBS
Inherits CLGeocodeCompletionHandlerMBS
	#tag Event
		Sub Completed(geocoder as CLGeocoderMBS, placemarks() as CLPlacemarkMBS, error as NSErrorMBS, tag as variant)
		  if l = nil then Return
		  
		  l.DeleteAllRows
		  
		  if error<>Nil then
		    l.AddRow "Error: "+error.localizedDescription
		  end if
		  
		  for each p as CLPlacemarkMBS in placemarks
		    l.AddRow "Placemark found:"
		    
		    Add "   name: ", p.name
		    Add "   locality: ", p.locality
		    Add "   subLocality: ", p.subLocality
		    Add "   thoroughfare: ", p.thoroughfare
		    Add "   subThoroughfare: ", p.subThoroughfare
		    for each a as string in p.areasOfInterest
		      Add "   areasOfInterest: ", a
		    next
		    Add "   inlandWater: ", p.inlandWater
		    Add "   ocean: ", p.ocean
		    
		    Add "   postalCode: ", p.postalCode
		    Add "   administrativeArea: ", p.administrativeArea
		    Add "   subAdministrativeArea: ", p.subAdministrativeArea
		    Add "   ISOcountryCode: ", p.ISOcountryCode
		    Add "   country: ", p.country
		    
		    dim cl as CLLocationMBS = p.location
		    if cl<>nil then
		      add "   latitude: ",cstr(cl.latitude)
		      add "   longitude: ",cstr(cl.longitude)
		    end if
		    
		  next
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Add(label as string, text as string)
		  if text<>"" then
		    l.AddRow label+text
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		l As Listbox
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
