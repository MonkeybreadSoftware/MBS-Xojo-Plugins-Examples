#tag Class
Protected Class UploadCURL
Inherits CURLSMBS
	#tag Event
		Function Progress(dltotal as Int64, dlnow as Int64, ultotal as Int64, ulnow as Int64, percent as double) As boolean
		  dim s as string
		  
		  if ultotal=0 then
		    s="Uploading..."
		  else
		    
		    dim d as Double = ulnow/ultotal
		    dim p as integer = 500*d
		    if Window1.ProgressBar1.Value<>p then
		      Window1.ProgressBar1.Value=p
		      Window1.ProgressBar1.Refresh
		      s="Uploading "+Format(d,"-0%")+" "+Format(ulnow/1024.0,"0")+" of "+format(ultotal/1024.0,"0")+" kB"
		      
		      if s<>Window1.status.text then
		        Window1.status.text=s
		        Window1.status.Refresh
		        
		        window1.listbox1.addrow s
		        window1.listbox1.Refresh
		      end if
		      
		    end if
		    
		  end if
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Function Read(count as integer) As string
		  Return stream.Read(count)
		End Function
	#tag EndEvent

	#tag Event
		Function RestartRead() As boolean
		  stream.position=0
		  Return false // no error
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		stream As binaryStream
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
