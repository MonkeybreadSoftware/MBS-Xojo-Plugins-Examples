#tag Class
Protected Class MyUIEvents
Inherits WebUIDelegateMBS
	#tag Event
		Function AreToolbarsVisible() As boolean
		  system.debuglog "AreToolbarsVisible in Xojo"
		  Return false
		End Function
	#tag EndEvent

	#tag Event
		Sub Close()
		  'MsgBox "Close"
		End Sub
	#tag EndEvent

	#tag Event
		Function ContextMenuItemsForElement(elementInformation as Dictionary, defaultMenuItems() as NSMenuItemMBS) As NSMenuItemMBS()
		  dim menuItems() as NSMenuItemMBS = defaultMenuItems
		  
		  if MenuItems.Ubound >= 0 then
		    MenuItems.Append NSMenuItemMBS.separatorItem
		  end if
		  
		  dim m as new MyNSMenuItemMBS
		  m.Title = "Test me"
		  m.Enabled = true
		  
		  // keep reference to get events later!
		  self.myMenuItem = m
		  
		  MenuItems.Append m
		  
		  return MenuItems
		End Function
	#tag EndEvent

	#tag Event
		Function CreateWithRequest(Request as NSURLRequestMBS) As object
		  dim w as MainWindow
		  
		  system.debuglog "CreateWebViewWithRequest in Xojo"
		  
		  w=new MainWindow
		  
		  if Request<>Nil then
		    // old webkit gives request here. Newer versions call load request on new webview themself.
		    w.web.LoadRequest Request
		  end if
		  
		  Return w.web
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Function GetContentRect(byref left as double, byref top as double, byref width as double, byref height as double) As boolean
		  system.debuglog "GetContentRect in Xojo"
		  
		  top=w.web.top
		  left=w.web.left
		  Width=w.web.Width
		  Height=w.web.Height
		  
		  // Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Function GetFrame(byref left as double, byref top as double, byref width as double, byref height as double) As boolean
		  system.debuglog "GetFrame in Xojo"
		  
		  left=w.Left
		  top=w.top
		  width=w.Width
		  height=w.Height
		  
		  // Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Function GetStatusText() As String
		  system.debuglog "GetStatusText in Xojo"
		  Return w.StatusText.text
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Function IsResizable() As boolean
		  system.debuglog "IsResizeable in Xojo"
		  
		End Function
	#tag EndEvent

	#tag Event
		Function IsStatusBarVisible() As boolean
		  system.debuglog "IsResizeable in Xojo"
		  Return true
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  'MsgBox "Open"
		End Sub
	#tag EndEvent

	#tag Event
		Sub RunJavaScriptAlertPanelWithMessage(message as String)
		  system.debuglog "RunJavaScriptAlertPanelWithMessage"
		  MsgBox message
		End Sub
	#tag EndEvent

	#tag Event
		Function RunJavaScriptConfirmPanelWithMessage(message as String) As boolean
		  system.debuglog "RunJavaScriptConfirmPanelWithMessage"
		  MsgBox message
		  
		End Function
	#tag EndEvent

	#tag Event
		Function RunJavaScriptTextInputPanelWithPrompt(prompt as String, defaultText as String) As String
		  system.debuglog "RunJavaScriptTextInputPanelWithMessage"
		  MsgBox prompt+" "+defaultText
		End Function
	#tag EndEvent

	#tag Event
		Function runOpenPanelForFileButtonWithResultListener(listener as WebOpenPanelResultListenerMBS, allowMultipleFiles as boolean) As boolean
		  dim o as OpenDialog
		  dim f as FolderItem
		  
		  o=new OpenDialog
		  
		  f=o.ShowModal
		  
		  if f=nil then
		    listener.cancel
		  else
		    listener.chooseFilename f
		  end if
		  
		  Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Function SetContentRect(left as double, top as double, width as double, height as double) As boolean
		  system.debuglog "SetContentRect in Xojo"
		  system.debuglog str(left)+"/"+str(top)+" "+str(Width)+" "+str(Height)
		End Function
	#tag EndEvent

	#tag Event
		Function SetFrame(left as double, top as double, width as double, height as double) As boolean
		  system.debuglog "SetFrame in Xojo"
		  system.debuglog str(left)+"/"+str(top)+" "+str(Width)+" "+str(Height)
		  
		End Function
	#tag EndEvent

	#tag Event
		Function SetResizable(resizeable as boolean) As boolean
		  system.debuglog "SetResizeable in Xojo"
		  
		End Function
	#tag EndEvent

	#tag Event
		Function SetStatusBarVisible(visible as boolean) As boolean
		  system.debuglog "SetStatusbarVisible in Xojo"
		  
		End Function
	#tag EndEvent

	#tag Event
		Function SetStatusText(text as String) As boolean
		  system.debuglog "SetStatusText in Xojo"
		  system.debuglog text
		  
		  w.StatusText.text=text
		  
		End Function
	#tag EndEvent

	#tag Event
		Function SetToolbarsVisible(visible as boolean) As boolean
		  system.debuglog "SetToolbarsVisible in Xojo"
		  
		End Function
	#tag EndEvent

	#tag Event
		Function WindowClose() As boolean
		  system.debuglog "Closed in Xojo"
		  
		  w.Close
		  
		End Function
	#tag EndEvent

	#tag Event
		Function WindowFocus() As boolean
		  system.debuglog "Focus in Xojo"
		  
		  w.show
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Function WindowShow() As boolean
		  system.debuglog "Show in Xojo"
		  
		  w.show
		  
		End Function
	#tag EndEvent

	#tag Event
		Function WindowUnfocus() As boolean
		  system.debuglog "Unfocus in Xojo"
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		myMenuItem As MyNSMenuItemMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		w As mainwindow
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
