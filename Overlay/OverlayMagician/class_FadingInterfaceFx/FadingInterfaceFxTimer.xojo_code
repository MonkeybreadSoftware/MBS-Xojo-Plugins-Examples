#tag Class
Protected Class FadingInterfaceFxTimer
Inherits Timer
	#tag Event
		Sub Action()
		  if count>0.0 then
		    win.Alpha=count
		    win.Update
		    count=count-stp
		  else
		    Mode=0
		    Win.Hide
		    win = nil
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub StartFx(speed As integer=5)
		  // Speed goes from 1 to 10
		  if speed<1 then
		    speed=1
		  elseif speed>10 then
		    speed=10
		  end if
		  Period=100/speed
		  Count=1.0
		  stp=0.05
		  Mode=2
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected count As Double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected stp As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		Win As FadingInterfaceFx
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="RunMode"
			Visible=true
			Group="Behavior"
			InitialValue="2"
			Type="RunModes"
			EditorType="Enum"
			#tag EnumValues
				"0 - Off"
				"1 - Single"
				"2 - Multiple"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
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
		#tag ViewProperty
			Name="Period"
			Visible=true
			Group="Behavior"
			InitialValue="1000"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
