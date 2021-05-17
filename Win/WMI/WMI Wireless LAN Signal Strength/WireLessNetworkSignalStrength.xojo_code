#tag Class
Protected Class WireLessNetworkSignalStrength
	#tag Method, Flags = &h0
		Function Bars() As integer
		  if valid=false then
		    Return 0
		  elseif value=0 then
		    Return 0
		  elseIf value > -57 Then
		    Return 5
		  ElseIf value > -68 Then
		    Return 4
		  ElseIf value > -72 Then
		    Return 3
		  ElseIf value > -80 Then
		    Return 2
		  ElseIf value > -90 Then
		    Return 1
		  Else
		    Return 0 ' unknown
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  
		  if TargetWin32 then
		    w=new WindowsWMIMBS
		    
		    if w.ConnectServer("root\wmi") then
		      ' connected
		    else
		      w=nil
		    end if
		  end if
		  
		  
		  update
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub update()
		  name=""
		  value=0
		  
		  if w<>Nil then
		    if w.query("WQL","SELECT * FROM MSNdis_80211_ReceivedSignalStrength where active=true") then
		      
		      if w.NextItem then
		        
		        name=w.GetPropertyString("InstanceName")
		        value=w.GetPropertyInteger("Ndis80211ReceivedSignalStrength")
		        valid=true 
		      end if
		    end if
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Name As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Valid As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Value As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private w As windowsWMIMBS
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
			InitialValue="2147483648"
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
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Value"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Valid"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
