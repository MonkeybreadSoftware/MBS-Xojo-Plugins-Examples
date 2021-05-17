#tag Class
Protected Class HUDPopupMenu
Inherits Canvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Pushed=true
		  me.Invalidate
		  dim last as integer
		  
		  //
		  // initialize items
		  //
		  Dim MyMenu as New MenuItem
		  
		  last=CountFields(InitialValue,endofline)
		  For i as integer=1 to last
		    MyMenu.Append(new MenuItem(NthField(InitialValue,endofline,i)))
		    
		    if i-1 = ListIndex then
		      MyMenu.item(i-1).Checked=true
		    else
		      MyMenu.item(i-1).Checked=false
		    end if
		  Next
		  
		  Dim Item as MenuItem = MyMenu.PopUp(window2.left+self.left+2,window2.top+self.top+6)
		  
		  //
		  // initialize items
		  //
		  
		  Pushed=false
		  me.Invalidate
		  
		  If not (Item = Nil) Then
		    for tel as integer = 0 to MyMenu.Count-1
		      if item.text = MyMenu.Item(tel).Text then
		        mListIndex=tel
		        ActiveName=item.text
		        exit
		      end if
		    next tel
		  end if
		  
		  
		  return true
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  Change()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  ActiveName=NthField(InitialValue,endofline,mlistindex+1)
		  
		  ListCount=CountFields(InitialValue,endofline)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  if  not self.pushed then
		    
		    
		    g.DrawPicture hudpopupleftactive,0,0
		    for x as integer = 6 to me.width-20
		      g.DrawPicture hudpopupmiddleactive,x,0
		    next x
		    g.DrawPicture hudpopuprightactive,me.width-19,0
		    
		  else
		    
		    g.DrawPicture hudpopupleftpush,0,0
		    for x as integer = 6 to me.width-20
		      g.DrawPicture hudpopupmiddlepush,x,0
		    next x
		    g.DrawPicture hudpopuprightpush,me.width-19,0
		    
		  end if
		  
		  g.ForeColor = rgb(240,240,240)
		  //g.TextFont="SmallSystem"
		  g.TextSize=10
		  g.DrawString ActiveName,10,13,me.width-25,true
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddRow(newItem as string)
		  If InitialValue  = "" then
		    InitialValue=InitialValue+newItem
		    ActiveName=newItem
		  else
		    InitialValue=InitialValue+endofline+newItem
		  end if
		  
		  ListCount=CountFields(InitialValue,endofline)
		  
		  me.Invalidate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRows(lijst() as string)
		  For i as integer =0 to Ubound(lijst)
		    if InitialValue="" then
		      InitialValue=InitialValue+lijst(i)
		    else
		      InitialValue=InitialValue+endofline+lijst(i)
		    end if
		  Next
		  
		  ActiveName=NthField(InitialValue,endofline,mListIndex+1)
		  
		  ListCount=CountFields(InitialValue,endofline)
		  
		  me.Invalidate
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteAllRows()
		  InitialValue=""
		  Activename=""
		  ListIndex=0
		  
		  ListCount=CountFields(InitialValue,endofline)
		  
		  
		  me.Invalidate
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Change()
	#tag EndHook


	#tag Note, Name = Info
		Code by Christophe De Vocht
		You may use this in your apps as long you give credits. :-)
		
		If you add other controls or improvements : please send it to christophe.devocht@telenet.be
	#tag EndNote


	#tag Property, Flags = &h0
		ActiveName As string
	#tag EndProperty

	#tag Property, Flags = &h0
		InitialValue As string
	#tag EndProperty

	#tag Property, Flags = &h0
		ListCount As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mListIndex
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mListIndex = value
			  ActiveName=NthField(InitialValue,endofline,mListIndex+1)
			  me.Invalidate
			End Set
		#tag EndSetter
		ListIndex As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mListIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Pushed As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return ActiveName
			End Get
		#tag EndGetter
		Text As String
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
			Name="ListIndex"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialValue"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Pushed"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ActiveName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ListCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
