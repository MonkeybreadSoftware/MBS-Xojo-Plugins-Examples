#tag Class
Protected Class CURLSMulti
Inherits CURLSMultiMBS
	#tag Event
		Sub TransferFinished(curl as CURLSMBS, result as Integer, RemainingFinishedTransfers as Integer)
		  #Pragma DisableBackgroundTasks true
		  
		  // write log in case of error
		  
		  if result <> 0 then
		    dim f as FolderItem = SpecialFolder.Desktop.Child("curl.log")
		    dim t as TextOutputStream = TextOutputStream.Append(f)
		    
		    dim d as string = curl.DebugData
		    d = ReplaceLineEndings(d, EndOfLine)
		    t.WriteLine d
		  end if
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Sub Add(curl As CURLSMBS)
		  if m = nil then
		    // first
		    
		    m = new CURLSMulti
		    t = new CURLTimer(m)
		    
		  end if
		  
		  
		  if m.AddCURL(curl) then
		    // ok
		  else
		    Break
		  end if
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Shared m As CURLSMulti
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared t As CURLTImer
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
