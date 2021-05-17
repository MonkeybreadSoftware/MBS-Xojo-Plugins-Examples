#tag Class
Protected Class FileOpenPanel
Inherits NSOpenPanelMBS
Implements Notifier,Receiver
	#tag Event
		Sub savePanelDidEnd(ReturnCode as integer)
		  dim files() As FolderItem
		  
		  if ReturnCode > 0 Then
		    for i As Integer = 0 to me.FilesCount
		      if me.Files(i) <> nil Then files.Append me.Files(i)
		    next
		  end if
		  
		  me.Results = new OpenPanelResults(me.CallerMethod, files)
		  NotifyAll
		End Sub
	#tag EndEvent

	#tag Event
		Function shouldShowFilename(path as string, item as folderitem) As boolean
		  dim t as string
		  
		  if AllFileTypes then Return true
		  
		  if item.Directory then // special handling for folders
		    dim l as LaunchServicesItemInfoMBS
		    l=item.LaunchServicesItemInfoMBS(4) // check for bundled files like Pages documents
		    if l=nil then
		      Return true
		    else
		      Return l.IsPackage=False
		    end if
		  end if
		  
		  t=item.MacType
		  For Each s As String In FileTypes
		    if StrComp(s,t,0)=0 then Return true
		  next
		  
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddNotifier(recv As Receiver)
		  // Part of the Notifier interface.
		  
		  if Receivers.IndexOf(recv) = -1 Then
		    Receivers.Append recv
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AddShowAllFileTypesCheckbox()
		  AssureAccessoryView
		  
		  if AccView <> nil Then
		    ShowAllTypesCheckbox = new OpenFileButton(0, 10, 126, 20, kShowAllTypesIdentifier, "Show all file types", me)
		    ShowAllTypesCheckbox.setButtonType NSButtonMBS.NSSwitchButton
		    
		    AccView.addSubview ShowAllTypesCheckbox
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AddShowInvisiblesCheckbox()
		  AssureAccessoryView
		  
		  if AccView <> nil Then
		    ShowInvisiblesCheckView = new OpenFileButton(140, 10, 132, 20, kShowInvisiblesIdentifier, "Show invisible files", me)
		    ShowInvisiblesCheckView.setButtonType NSButtonMBS.NSSwitchButton
		    
		    AccView.addSubview ShowInvisiblesCheckView
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AssureAccessoryView()
		  if AccView = nil Then
		    AccView = new NSViewMBS(0, 0, 460, 40)
		    me.accessoryView = me.AccView
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(initialFolder As FolderItem, hilitedFile As String, fileTypes() As String, callingMethod As String, allowInvisibles As Boolean, multipleSelection As Boolean, parentWindow As Window)
		  // Use this constructor for choosing files
		  
		  Super.Constructor
		  
		  me.CallerMethod = callingMethod
		  me.FileTypes = FileTypes
		  
		  me.allowsMultipleSelection = multipleSelection
		  
		  if parentWindow isa Receiver Then AddNotifier(Receiver(parentWindow))
		  
		  if allowInvisibles Then
		    AddShowInvisiblesCheckbox
		  end if
		  
		  if Ubound(fileTypes) >= 0 and fileTypes(0) <> "APPL" Then
		    AddShowAllFileTypesCheckbox
		  end if
		  
		  'me.canChooseDirectories = False
		  'me.canChooseFiles = True
		  
		  me.beginSheetForDirectory(initialFolder, hilitedFile, nil, parentWindow)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Data() As Variant
		  // Part of the Notifier interface.
		  
		  Return me.Results
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataChanged(src As Notifier)
		  // handles results from OpenFileButtons
		  
		  dim command As String = src.Data
		  
		  Select Case command
		  Case kShowAllTypesIdentifier
		    dim btnValue As Integer
		    btnValue = ShowAllTypesCheckbox.state
		    AllFileTypes=btnValue=1
		    super.validateVisibleColumns
		    
		  Case kShowInvisiblesIdentifier
		    me.showsHiddenFiles = ShowInvisiblesCheckView.state = 1
		  End Select
		  
		  'validateVisibleColumns
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NotifyAll()
		  // Part of the Notifier interface.
		  
		  for i As Integer = 0 to UBound(me.Receivers)
		    me.Receivers(i).DataChanged me
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function OSTypeArrayToHFSArray(osTypes() As String) As String()
		  dim s As String = "'" + Join(OSTypes, "','") + "'"
		  
		  Return Split(s, ",")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function OSTypeStrToArray(osTypes As String) As String()
		  return Split(OSTypes, ",")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function OSTypeStrToHFSArray(osTypes As String) As String()
		  dim arr() As String = Split(OSTypes, ",")
		  
		  dim s As String = "'" + Join(arr, "','") + "'"
		  
		  Return Split(s, ",")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveNotifier(rcv As Receiver)
		  // Part of the Notifier interface.
		  
		  dim n As Integer = me.Receivers.IndexOf(rcv)
		  if n > -1 Then me.Receivers.Remove n
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private AccView As NSViewMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private AllFileTypes As boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CallerMethod As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private FileTypes(-1) As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Receivers() As Receiver
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Results As OpenPanelResults
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ShowAllTypesCheckbox As OpenFileButton
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ShowInvisiblesCheckView As OpenFileButton
	#tag EndProperty


	#tag Constant, Name = kAddToFavesIdentifier, Type = String, Dynamic = False, Default = \"AddToFavorites", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kShowAllTypesIdentifier, Type = String, Dynamic = False, Default = \"ShowAllTypes", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kShowInvisiblesIdentifier, Type = String, Dynamic = False, Default = \"ShowInvisibles", Scope = Private
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
