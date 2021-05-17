#tag Class
Protected Class HUDSlider
Inherits Canvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  return true
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  knobX=X-HUDSliderKnobRound.width/2
		  if knobX<0 then knobX=0
		  if knobX>width-HUDSliderKnobRound.width then knobX=width-HUDSliderKnobRound.width
		  UpdateValue
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  mvalue = value
		  lastValue=-1
		  //knobX=mvalue*(mmaximum-mminimum)/(width-HUDSliderKnobRound.width)+mminimum
		  knobX=mvalue*((width-HUDSliderKnobRound.width)+mminimum)/(mmaximum-mminimum)
		  
		  UpdateValueSetter
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.DrawPicture HUDSliderTrackleftCap,0,3
		  for x as integer = 3 to me.width-4
		    g.DrawPicture HUDSliderTrackfill,x,3
		  next x
		  g.DrawPicture HUDSliderTrackrightCap,me.width-3,3
		  g.DrawPicture HUDSliderKnobRound,knobX,0
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub UpdateValue()
		  mvalue=knobX*(mmaximum-mminimum)/(width-HUDSliderKnobRound.width)+mminimum
		  
		  if mvalue<>lastValue then
		    valueChanged(mvalue)
		    lastValue=mvalue
		    me.Invalidate
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateValueSetter()
		  if mvalue<>lastValue then
		    valueChanged(mvalue)
		    lastValue=mvalue
		    me.Invalidate
		  end if
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event valueChanged(mvalue as single)
	#tag EndHook


	#tag Note, Name = Info
		Code by Christophe De Vocht
		You may use this in your apps as long you give credits. :-)
		
		If you add other controls or improvements : please send it to christophe.devocht@telenet.be
	#tag EndNote


	#tag Property, Flags = &h0
		Knobx As single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private lastValue As single
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mMaximum
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  try
			    mMaximum = value
			    knobX=(mvalue-mminimum)*(width-HUDSliderKnobRound.width)/(mmaximum-mminimum)
			    
			    UpdateValueSetter
			    me.Invalidate
			  catch
			  end try
			End Set
		#tag EndSetter
		Maximum As single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mMinimum
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  try
			    mMinimum = value
			    knobX=(mvalue-mminimum)*(width-HUDSliderKnobRound.width)/(mmaximum-mminimum)
			    
			    UpdateValueSetter
			    me.Invalidate
			  catch
			  end try
			End Set
		#tag EndSetter
		Minimum As single
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mMaximum As single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMinimum As single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mvalue As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mvalue
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  try
			    
			    if value < mMinimum then
			      mvalue=mMinimum
			    else
			      
			      mvalue = value
			    end if
			    
			    //msgbox str(mvalue)
			    
			    knobX=(mvalue-mminimum)*(width-HUDSliderKnobRound.width)/(mmaximum-mminimum)
			    
			    
			    UpdateValueSetter
			    me.Invalidate
			  catch
			  end try
			  
			End Set
		#tag EndSetter
		value As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
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
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group="Initial State"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Minimum"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="single"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Maximum"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="single"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Value"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Knobx"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="single"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
