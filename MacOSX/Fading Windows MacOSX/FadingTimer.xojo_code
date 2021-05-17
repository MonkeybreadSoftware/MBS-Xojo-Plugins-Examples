#tag Class
Protected Class FadingTimer
Inherits Timer
	#tag Event
		Sub Action()
		  dim n as integer
		  dim p as Double
		  
		  count=count+1
		  
		  if count=100 then
		    count=0
		  end if
		  
		  // fadein window1
		  if count>=30 and count<=40 then
		    n=count-30
		    
		    p=n/10
		    
		    Window1.TransparencyMBS=p
		  end if
		  
		  if count=30 then // move window1 to front
		    Window2.TransparencyMBS=1
		    Window1.Show
		  end if
		  
		  // fadein window2
		  if count>=80 and count<=90 then
		    n=count-80
		    
		    p=n/10
		    
		    Window2.TransparencyMBS=p
		  end if
		  
		  if count=80 then // move window2 to front
		    Window1.TransparencyMBS=1
		    Window2.Show
		  end if
		  
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h1
		Protected count As integer
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
