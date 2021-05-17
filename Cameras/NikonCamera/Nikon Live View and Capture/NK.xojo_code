#tag Module
Protected Module NK
	#tag Method, Flags = &h0
		Sub init()
		  m = new MyNikonMBS
		  
		  Dim f as folderitem=app.ExecutableFile.Parent.Child("Nikon Test Libs")
		  If TargetMacOS then
		    if m.LoadLibrary("/Library/Application Support/Nikon/Camera Control Modules/Type0005 Module.bundle") = false then
		      MsgBox "Failed to load module."
		      Return
		    end if
		  Else
		    
		    If m.LoadLibrary("Type0005.md3")=false then
		      MsgBox "Failed to load module. "
		      Return
		    End If
		    
		    
		  End If
		  
		  if m.OpenModule = false then
		    MsgBox "Failed to open module."
		    Return
		  end if
		  
		  const kNkMAIDCapability_Name = 9
		  
		  'MsgBox "Module open."
		  
		  'MsgBox "Name of module: "+m.GetCapString(m.kModule, kNkMAIDCapability_Name)
		  
		  MsgBox str(m.GetSourceCount)+" devices."
		  
		  if m.OpenSource(0) = false then
		    MsgBox "Failed to open first device."
		    Return
		  end if
		  LV=New NikonLiveImageMBS
		  System.DebugLog "Set Live View Status"
		  Const  kNkMAIDCapability_LiveViewStatus=1
		  Dim LVStatus as Boolean=m.SetCapEnumUInt32(m.kDevice, 33342,1)
		  If m.GetCapUInt32(m.kDevice, kNkMAIDCapability_LiveViewStatus)<>1 then
		    MsgBox("Live View not running, "+str(m.GetCapUInt32(m.kDevice, kNkMAIDCapability_LiveViewStatus)))
		  End If
		  System.DebugLog "End Set Live View Status"
		  
		  'MsgBox m.GetCapString(m.kDevice, kNkMAIDCapability_Name)
		  'NKCapture
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LVEnd()
		  
		  NkLvActive=false
		  Window1.LVTimer.Mode=0
		  const kNkMAIDCapability_LiveViewStatus = &h823E
		  const kNkMAIDLiveViewStatus_OFF = 0
		  const kNkMAIDLiveViewStatus_ON = 1
		  
		  nk.m.SetCapUInt32(nk.m.kDevice, kNkMAIDCapability_LiveViewStatus, kNkMAIDLiveViewStatus_OFF)
		  
		  if nk.m.Lasterror = 0 then
		    // ok
		    
		  else
		    MsgBox "Failed to disable live view: "+str(nk.m.Lasterror)
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LVInit()
		  const kNkMAIDCapability_LiveViewProhibit = &h825E
		  
		  dim n as integer = nk.m.GetCapUInt32(nk.m.kDevice, kNkMAIDCapability_LiveViewProhibit)
		  
		  if nk.m.Lasterror<>0 then
		    MsgBox "error: "+str(nk.m.Lasterror)
		  elseif n <> 0 then
		    
		    MsgBox "kNkMAIDCapability_LiveViewProhibit: "+hex(n)
		  else
		    
		    const kNkMAIDCapability_LiveViewStatus = &h823E
		    const kNkMAIDLiveViewStatus_OFF = 0
		    const kNkMAIDLiveViewStatus_ON = 1
		    
		    nk.m.SetCapUInt32(nk.m.kDevice, kNkMAIDCapability_LiveViewStatus, kNkMAIDLiveViewStatus_ON)
		    
		    if nk.m.Lasterror = 0 then
		      // ok
		      
		      Window1.LVTimer.Enabled=True
		      Window1.LVTimer.Period=15
		      Window1.LVTimer.Mode=2
		      NkLvActive=True
		    else
		      MsgBox "Failed to enable live view: "+str(nk.m.Lasterror)
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NKCapture()
		  If NkLvActive then LVEnd
		  'MsgBox CurrentMethodName+" 1"
		  while m.Capture = false
		    // try again
		    'MsgBox CurrentMethodName+" 2"
		  wend
		  
		  'MsgBox CurrentMethodName+" 3"
		  
		  // wait some time
		  dim n as integer = 1
		  do
		    n = n + 1
		    app.DoEvents 100
		    'call m.Async
		    'MsgBox CurrentMethodName+" 4"
		    
		    if m.OpenItem(0) then
		      'MsgBox CurrentMethodName+" 5"
		      exit // ok
		    else
		      'MsgBox CurrentMethodName+" 6"
		      if n>20 then
		        MsgBox "Failed to open first image."
		        Return
		      end if
		    end if
		  loop
		  
		  'MsgBox CurrentMethodName+" 7"
		  
		  'MsgBox m.GetCapString(m.kItem, kNkMAIDCapability_Name)
		  
		  if m.OpenData(m.kDataObjTypeImage) = false then
		    MsgBox "Failed to open first image's data."
		    Return
		  end if
		  
		  'MsgBox CurrentMethodName+" 8"
		  
		  if not m.Acquire then
		    MsgBox "Failed to acquire."
		    Return
		  end if
		  If NkLvContinue then LVInit
		  
		  'MsgBox CurrentMethodName+" 9"
		  ''MsgBox "OK"
		End Sub
	#tag EndMethod


	#tag Note, Name = Credits
		Example code created by Christian Schmitz and Christopher Rosado.
		64-Bit safe for Mac.
	#tag EndNote


	#tag Property, Flags = &h0
		LV As NikonLiveImageMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		m As MyNikonMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		NkLvActive As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		NkLvContinue As Boolean
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
			Name="NkLvActive"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NkLvContinue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
