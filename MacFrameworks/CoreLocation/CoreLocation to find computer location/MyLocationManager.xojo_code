#tag Class
Protected Class MyLocationManager
Inherits CLLocationManagerMBS
	#tag Event
		Sub didFailWithError(error as NSErrorMBS)
		  dim l as listbox = MainWindow.List
		  
		  l.DeleteAllRows
		  l.AddRow "Error:"
		  l.AddRow error.localizedDescription
		  l.AddRow error.localizedFailureReason
		  l.AddRow error.localizedRecoverySuggestion
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didUpdate(newLocation as CLLocationMBS, oldLocation as CLLocationMBS)
		  dim l as listbox = MainWindow.List
		  
		  l.DeleteAllRows
		  l.AddRow "new Location:"
		  
		  l.AddRow newLocation.description
		  l.AddRow "Latitude: "+str(newLocation.latitude)
		  l.AddRow "Longitude: "+str(newLocation.longitude)
		  l.AddRow "Altitude: "+str(newLocation.altitude)
		  l.AddRow "Course: "+str(newLocation.course)
		  l.AddRow "HorizontalAccuracy: "+str(newLocation.horizontalAccuracy)
		  l.AddRow "VerticalAccuracy: "+str(newLocation.verticalAccuracy)
		  l.AddRow "Speed: "+str(newLocation.speed)
		  l.AddRow "Timestamp: "+newLocation.timestamp.LongDate+" "+newLocation.timestamp.LongTime
		  
		  if oldLocation<>nil then
		    l.AddRow ""
		    l.AddRow "old Location: "
		    l.AddRow oldLocation.description
		    l.AddRow "Latitude: "+str(oldLocation.latitude)
		    l.AddRow "Longitude: "+str(oldLocation.longitude)
		    l.AddRow "Altitude: "+str(oldLocation.altitude)
		    l.AddRow "Course: "+str(oldLocation.course)
		    l.AddRow "HorizontalAccuracy: "+str(oldLocation.horizontalAccuracy)
		    l.AddRow "VerticalAccuracy: "+str(oldLocation.verticalAccuracy)
		    l.AddRow "Speed: "+str(oldLocation.speed)
		    l.AddRow "Timestamp: "+oldLocation.timestamp.LongDate+" "+oldLocation.timestamp.LongTime
		    
		  end if
		  
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
