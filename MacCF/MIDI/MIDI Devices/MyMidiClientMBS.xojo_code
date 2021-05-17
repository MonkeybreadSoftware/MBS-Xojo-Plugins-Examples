#tag Class
Protected Class MyMidiClientMBS
Inherits MidiClientMBS
	#tag Event
		Sub ObjectAdded(parent as MidiObjectMBS, child as MidiObjectMBS)
		  w "Object added: "+child.DisplayName
		  
		  MainWindow.update
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub ObjectRemoved(parent as MidiObjectMBS, child as MidiObjectMBS)
		  w "Object removed."
		  MainWindow.update
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub PropertyChanged(target as MidiObjectMBS, theProperty as CFStringMBS)
		  w "Property changed."
		  MainWindow.loadproperties
		End Sub
	#tag EndEvent

	#tag Event
		Sub SerialPortOwnerChanged()
		  w "Serial port owner changed."
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub SetupChanged()
		  w "Setup changed."
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub ThruConnectionsChanged()
		  w "Thru connections changed."
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub w(s as string)
		  MainWindow.eList.InsertRow 0,s
		End Sub
	#tag EndMethod


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
