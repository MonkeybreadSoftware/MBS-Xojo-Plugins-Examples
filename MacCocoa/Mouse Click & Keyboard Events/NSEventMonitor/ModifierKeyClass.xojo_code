#tag Class
Protected Class ModifierKeyClass
	#tag Method, Flags = &h0
		Sub Constructor(flags As Integer)
		  
		  // set Properties
		  ShiftLeft = ((Shift_Left And flags) = Shift_Left)
		  ShiftRight = ((Shift_Right And flags) = Shift_Right)
		  
		  AltLeft = ((Alt_Left And flags) = Alt_Left)
		  AltRight = ((Alt_Right And flags) = Alt_Right)
		  
		  CmdLeft = ((Cmd_Left And flags) = Cmd_Left)
		  CmdRight = ((Cmd_Right And flags) = Cmd_Right)
		  
		  CtrlKey = ((ctrl_Key And flags) = ctrl_Key)
		  
		  FnKey = ((fn_Key And flags) = fn_Key)
		  
		  CapsLockKey = ((Caps_Lock And flags) = Caps_Lock)
		End Sub
	#tag EndMethod


	#tag Note, Name = Info
		All Properties are read only
		
		ModifierKeyClass.ShiftKey As Boolean
		// any shift key is pressed
		
		ModifierKeyClass.ShiftLeft As Boolean
		// left shift key is pressed
		
		ModifierKeyClass.ShiftRight As Boolean
		// right shift key is pressed
		
		
		ModifierKeyClass.AltKey As Boolean
		// any alt key is pressed
		
		ModifierKeyClass.AltLeft As Boolean
		// left alt key is pressed
		
		ModifierKeyClass.AltRight As Boolean
		// right alt key is pressed
		
		
		ModifierKeyClass.CmdKey As Boolean
		// any cmd key is pressed
		
		ModifierKeyClass.CmdLeft As Boolean
		// left cmd key is pressed
		
		ModifierKeyClass.CmdRight As Boolean
		// right cmd key is pressed
		
		
		ModifierKeyClass.CapsLockKey As Boolean
		// caps lock key is down
		
		ModifierKeyClass.CtrlKey As Boolean
		// ctrl key is pressed
		
		ModifierKeyClass.FnKey As Boolean
		// fn key is pressed
		
		ModifierKeyClass.ModifierString As String
		// Returns a string with all pressed modifier keys
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return AltLeft or AltRight
			  // any alt key is pressed
			End Get
		#tag EndGetter
		AltKey As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		AltLeft As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		AltRight As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		CapsLockKey As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return CmdLeft or CmdRight
			  // any cmd key is pressed
			End Get
		#tag EndGetter
		CmdKey As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		CmdLeft As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		CmdRight As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		CtrlKey As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FnKey As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim s As String
			  
			  if ShiftLeft then s = s + " ShiftLeft"
			  if ShiftRight then s = s + " ShiftRight"
			  
			  if AltLeft then s = s + " AltLeft"
			  if AltRight then s = s + " AltRight"
			  
			  if CmdLeft then s = s + " CmdLeft"
			  if CmdRight then s = s + " CmdRight"
			  
			  if CtrlKey then s = s + " CtrlKey"
			  
			  if FnKey then s = s + " FnKey"
			  
			  if CapsLockKey then s = s + " CapsLockKey"
			  
			  Return s
			End Get
		#tag EndGetter
		ModifierString As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return ShiftLeft or ShiftRight
			End Get
		#tag EndGetter
		ShiftKey As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		ShiftLeft As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		ShiftRight As Boolean
	#tag EndProperty


	#tag Constant, Name = Alt_Key, Type = Double, Dynamic = False, Default = \"&b000010000000000000000000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = Alt_Left, Type = Double, Dynamic = False, Default = \"&b000010000000000000100000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = Alt_Right, Type = Double, Dynamic = False, Default = \"&b000010000000000001000000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = Caps_Lock, Type = Double, Dynamic = False, Default = \"&b000000010000000000000000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = Cmd_Key, Type = Double, Dynamic = False, Default = \"&b000100000000000000000000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = Cmd_Left, Type = Double, Dynamic = False, Default = \"&b000100000000000000001000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = Cmd_Right, Type = Double, Dynamic = False, Default = \"&b000100000000000000010000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ctrl_Key, Type = Double, Dynamic = False, Default = \"&b000001000000000000000001", Scope = Private
	#tag EndConstant

	#tag Constant, Name = fn_Key, Type = Double, Dynamic = False, Default = \"&b100000000000000000000000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = Shift_Key, Type = Double, Dynamic = False, Default = \"&b000000100000000000000000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = Shift_Left, Type = Double, Dynamic = False, Default = \"&b000000100000000000000010", Scope = Private
	#tag EndConstant

	#tag Constant, Name = Shift_Right, Type = Double, Dynamic = False, Default = \"&b000000100000000000000100", Scope = Private
	#tag EndConstant


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
			InitialValue="-2147483648"
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
			Name="ShiftLeft"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShiftRight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AltLeft"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AltRight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CmdLeft"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CmdRight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CapsLockKey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CtrlKey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FnKey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShiftKey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AltKey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CmdKey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ModifierString"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
