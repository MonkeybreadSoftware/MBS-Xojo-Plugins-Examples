#tag Class
Protected Class MyPicker
Inherits ABPickerMBS
	#tag Event
		Sub GroupDoubleClicked()
		  MainWindow.List.InsertRow 0,"Group Double Clicked"
		End Sub
	#tag EndEvent

	#tag Event
		Sub GroupSelectionChanged()
		  MainWindow.List.InsertRow 0,"Group Selection Changed"
		End Sub
	#tag EndEvent

	#tag Event
		Sub NameDoubleClicked()
		  MainWindow.List.InsertRow 0,"Name Double Clicked"
		  
		  dim c as integer
		  dim t as string
		  dim a as ABAddressBookMBS=MainWindow.a
		  
		  dim s() as Variant = me.SelectedValues
		  
		  c=UBound(s)
		  if c>=0 then
		    // pick first, newer Mac OS X gives formatted text of address, older ones give dictionary...
		    
		    if s(0) isa Dictionary then
		      dim d as Dictionary=s(0)
		      
		      t=t+d.Lookup(a.kABAddressStreetKey,"")+EndOfLine
		      t=t+d.Lookup(a.kABAddressZIPKey,"")+" "
		      t=t+d.Lookup(a.kABAddressCityKey,"")+EndOfLine
		      t=t+d.Lookup(a.kABAddressCountryKey,"")+EndOfLine
		    elseif VarType(s(0)) = Variant.TypeString then
		      t = s(0)
		    end if
		  end if
		  
		  MainWindow.EditField1.text=t
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub NameSelectionChanged()
		  MainWindow.List.InsertRow 0,"Name Selection Changed"
		End Sub
	#tag EndEvent

	#tag Event
		Sub ValueSelectionChanged()
		  MainWindow.List.InsertRow 0,"Value Selection Changed"
		  
		End Sub
	#tag EndEvent


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
