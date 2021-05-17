#tag Class
Protected Class ProgressBarKSW
Inherits CocoaControlMBS
	#tag Event
		Function GetView() As NSViewMBS
		  me.Update()
		  System.DebugLog("geTvIEW")
		  Return ActualControl
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub Update()
		  If ActualControl = Nil Then ActualControl = New NSProgressIndicatorMBS(0,0,me.Width,me.Height)
		  ActualControl.StopAnimation()
		  ActualControl.alphaValue = ActualOpacity
		  ActualControl.doubleValue = ActualValue
		  ActualControl.maxValue = ActualMaxValue
		  ActualControl.minValue = ActualMinValue
		  ActualControl.isIndeterminate = ActualIsIndeterminate
		  ActualControl.isBezeled = ActualIsbezeled
		  ActualControl.controlTint = ActualTint
		  If me.ActualControlSize = NSProgressIndicatorMBS.NSSmallControlSize Then
		    ActualControl.controlSize = NSProgressIndicatorMBS.NSSmallControlSize
		    me.Height = 12
		  Else
		    ActualControl.controlSize = NSProgressIndicatorMBS.NSRegularControlSize
		    me.Height = 20
		  End If
		  ActualControl.sizeToFit()
		  If me.ActualAnimateIndeterminate Then
		    ActualControl.StartAnimation()
		  Else
		    ActualControl.stopAnimation
		  End If
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ValueChanged(newValue As Double)
	#tag EndHook


	#tag Property, Flags = &h21
		Private ActualAnimateIndeterminate As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ActualControl As NSProgressIndicatorMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ActualControlSize As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ActualIsbezeled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ActualIsIndeterminate As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ActualMaxValue As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ActualMinValue As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ActualOpacity As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ActualTint As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ActualValue As Double
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return ActualAnimateIndeterminate
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ActualAnimateIndeterminate = value
			  me.Update()
			End Set
		#tag EndSetter
		AnimateIndeterminate As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return ActualControlSize
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ActualControlSize = value
			  me.Update()
			End Set
		#tag EndSetter
		ControlSize As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return ActualIsbezeled
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ActualIsbezeled = value
			  me.Update()
			End Set
		#tag EndSetter
		IsBezeled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return ActualIsIndeterminate
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ActualIsIndeterminate = value
			  me.Update()
			End Set
		#tag EndSetter
		IsIndeterminate As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return ActualMaxValue
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ActualMaxValue = value
			  me.Update()
			End Set
		#tag EndSetter
		MaxValue As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return ActualMinValue
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ActualMinValue = value
			  me.Update()
			End Set
		#tag EndSetter
		MinValue As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return ActualOpacity
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ActualOpacity = value
			  me.Update()
			End Set
		#tag EndSetter
		Opacity As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return ActualTint
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ActualTint = value
			  me.Update()
			End Set
		#tag EndSetter
		Tint As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return ActualValue
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ActualValue = value
			  me.Update()
			  RaiseEvent ValueChanged(value)
			End Set
		#tag EndSetter
		Value As Double
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType="Integer"
			#tag EnumValues
				"20 - Regular"
				"12 - Small"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ControlSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Regular"
				"1 - Small"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsBezeled"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsIndeterminate"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AnimateIndeterminate"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Value"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaxValue"
			Visible=true
			Group="Behavior"
			InitialValue="100"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinValue"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tint"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Blue"
				"6 - Graphite"
				"7 - Clear"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Opacity"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
