#tag Class
Protected Class MyCLGeocodeCompletionHandlerMBS
Inherits CLGeocodeCompletionHandlerMBS
	#tag Event
		Sub Completed(geocoder as CLGeocoderMBS, placemarks() as CLPlacemarkMBS, error as NSErrorMBS, tag as variant)
		  dim l as listbox = window1.List
		  
		  l.DeleteAllRows
		  
		  if error<>nil then
		    l.AddRow "Error", error.LocalizedDescription
		  end if
		  
		  l.AddRow "Count of placemarks", str(UBound(placemarks)+1)
		  
		  for each p as CLPlacemarkMBS in placemarks
		    l.AddRow "name", p.name
		    l.AddRow "locality", p.locality
		    l.AddRow "subLocality", p.subLocality
		    l.AddRow "thoroughfare", p.thoroughfare
		    l.AddRow "subThoroughfare", p.subThoroughfare
		    l.AddRow "administrativeArea", p.administrativeArea
		    l.AddRow "subAdministrativeArea", p.subAdministrativeArea
		    l.AddRow "postalCode", p.postalCode
		    l.AddRow "country", p.country
		    
		    dim ad as Dictionary = p.addressDictionary
		    for each key as Variant in ad.keys
		      dim value as Variant = ad.Value(key)
		      if value.IsArray then
		        // convert array of variants with strings to string array for join
		        dim v() as Variant = value
		        dim s() as string
		        for each k as Variant in v
		          s.Append k.StringValue
		        next
		        value = Join(s, ", ")
		      end if
		      
		      l.AddRow "Address "+key, value
		    next
		    
		    l.AddRow "areasOfInterest", join(p.areasOfInterest, ", ")
		    
		    l.AddRow "ocean", p.ocean
		    l.AddRow "inlandWater", p.inlandWater
		    l.AddRow "ISOcountryCode", p.ISOcountryCode
		    
		    dim r as CLRegionMBS = p.region
		    if r<>nil then
		      l.AddRow "region latitude", str(r.latitude)
		      l.AddRow "region longitude", str(r.longitude)
		      l.AddRow "region radius", str(r.radius)
		    end if
		    
		    dim cl as CLLocationMBS = p.location
		    l.AddRow "Location Latitude", str(cl.Latitude)
		    l.AddRow "Location Longitude", str(cl.Longitude)
		    
		  next
		  
		  Finally
		    // clearnup
		    selfRef = nil
		    
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		selfRef As MyCLGeocodeCompletionHandlerMBS
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
