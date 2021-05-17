#tag Class
Protected Class MyAVFoundationMBS
Inherits AVFoundationMBS
	#tag Event
		Sub AssetLoadValuesAsynchronouslyForKeysFinished(MetadataItem as AVMetadataItemMBS, keys() as string, tag as variant)
		  dim w as MovieOverlay = tag
		  
		  w.setUpPlayback keys
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function AddWindow(w as MovieOverlay) As integer
		  MovieOverlays.Append w
		  
		  Return UBound(MovieOverlays)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveWindow(w as MovieOverlay)
		  dim n as integer = MovieOverlays.IndexOf(w)
		  if n>=0 then
		    MovieOverlays(n) = nil
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		MovieOverlays() As MovieOverlay
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
