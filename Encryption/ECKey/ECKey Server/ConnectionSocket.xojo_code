#tag Class
Protected Class ConnectionSocket
Inherits TCPSocket
	#tag Event
		Sub Connected()
		  Log "ConnectionSocket Connected to "+Me.RemoteAddress
		  
		  Dim EC_Curve_ID As Integer = 415 // NID_X9_62_prime256v1
		  
		  // on Server
		  dhs = New ECDHEMBS(EC_Curve_ID)
		  PublicKey = dhs.PublicKey
		  
		  // send public key to other side
		  Me.Write PublicKey
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DataAvailable()
		  Dim data As String = Me.ReadAll
		  
		  If bf = Nil Then
		    
		    // setup encryption
		    
		    // on Server
		    Dim secret As String = dhs.DeriveSecretKey(data)
		    
		    bf = New BlowfishMBS
		    bf.SetKey secret
		    
		    EncryptionInitialized = True
		    
		  Else
		    
		    // got data, so decrypt it
		    data = bf.DecryptCFB64(data, tempd)
		    
		    Process data
		    
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error(err As RuntimeException)
		  Log "ConnectionSocket error: "+Str(me.LastErrorCode)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub log(s as string)
		  list.AddRow s
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Process(data as string)
		  // do something useful here for data you got.
		  
		  
		  Log "Received: "+data
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(data as string)
		  // if we have encryption, apply it
		  If bf <> Nil Then
		    data = bf.EncryptCFB64(data, tempe)
		  End If
		  
		  
		  // Calling the overridden superclass method.
		  Super.Write data
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		bf As BlowfishMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		dhs As ECDHEMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		EncryptionInitialized As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		list As listbox
	#tag EndProperty

	#tag Property, Flags = &h0
		PublicKey As string
	#tag EndProperty

	#tag Property, Flags = &h0
		tempd As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h0
		tempe As MemoryBlock
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
			Name="Address"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Port"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EncryptionInitialized"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PublicKey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
