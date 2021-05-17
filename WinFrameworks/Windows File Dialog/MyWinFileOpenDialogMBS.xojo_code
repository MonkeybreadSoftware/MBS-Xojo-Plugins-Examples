#tag Class
Protected Class MyWinFileOpenDialogMBS
Inherits WinFileOpenDialogMBS
	#tag Event
		Sub ButtonClicked(ControlID as Integer)
		  Log CurrentMethodName+" "+Str(ControlID)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub CheckButtonToggled(ControlID as Integer, Checked as Boolean)
		  log CurrentMethodName+" "+Str(ControlID)
		  
		  if ControlID = 7 then
		    if checked then
		      me.ControlState(8) = me.kControlStateEnableVisible
		    else
		      me.ControlState(8) = me.kControlStateVisible
		    end if
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub ControlActivating(ControlID as Integer)
		  log CurrentMethodName+" "+Str(ControlID)
		End Sub
	#tag EndEvent

	#tag Event
		Function FileOk() As Boolean
		  Log CurrentMethodName
		  
		  MainWindow.CheckCustomControls(me)
		  
		  Return True
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub FileTypeChanged()
		  log CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub FolderChanged()
		  Log CurrentMethodName
		  
		  dim folder as WinShellItemMBS = self.Folder
		  if folder <> nil then
		    log folder.NativePath
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function FolderChanging(Folder as WinShellItemMBS) As boolean
		  Log CurrentMethodName
		  Log Folder.NativePath
		  
		  Return True
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub ItemSelected(ControlID as Integer, ItemID as Integer)
		  Log CurrentMethodName+" "+str(ControlID)+" "+str(ItemID)
		End Sub
	#tag EndEvent

	#tag Event
		Function Overwrite(item as WinShellItemMBS) As Integer
		  Log CurrentMethodName
		  
		  Return kOverwriteDefault
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub SelectionChange()
		  log CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Function ShareViolation(item as WinShellItemMBS) As Integer
		  Log CurrentMethodName
		  
		  Return kShareViolationDefault
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub log(s as string)
		  list.AddRow s
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		list As listbox
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
