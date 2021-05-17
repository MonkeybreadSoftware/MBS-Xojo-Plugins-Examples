#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  AutoQuit = true
		  
		  m = new MyNikonMBS
		  
		  run
		  
		  m = nil
		  
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Run()
		  
		  if m.LoadLibrary("/Library/Application Support/Nikon/Camera Control Modules/Type0005 Module.bundle") = false then
		    MsgBox "Failed to load module."
		    Return
		  end if
		  
		  if m.OpenModule = false then
		    MsgBox "Failed to open module."
		    Return
		  end if
		  
		  const kNkMAIDCapability_Name = 9
		  
		  MsgBox "Module: "+m.GetCapString(m.kModule, kNkMAIDCapability_Name)
		  
		  if m.OpenSource(0) = false then
		    MsgBox "Failed to open first device."
		    Return
		  end if
		  
		  MsgBox "Device: "+m.GetCapString(m.kDevice, kNkMAIDCapability_Name)
		  
		  while m.Capture = false
		    // try again
		  wend
		  
		  // wait some time
		  dim n as integer = 1
		  do
		    n = n + 1
		    DoEvents 100
		    call m.Async_
		    
		    if m.OpenItem(0) then
		      exit // ok
		    else
		      if n>20 then
		        MsgBox "Failed to open first image."
		        Return
		      end if
		    end if
		  loop
		  
		  'MsgBox m.GetCapString(m.kItem, kNkMAIDCapability_Name)
		  
		  if m.OpenData(m.kDataObjTypeImage) = false then
		    MsgBox "Failed to open first image's data."
		    Return
		  end if
		  
		  if not m.Acquire then
		    MsgBox "Failed to acquire."
		    Return
		  end if
		  
		  MsgBox "OK"
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Credits
		Example code created by Christian Schmitz 
		and Christopher Rosado
	#tag EndNote


	#tag Property, Flags = &h0
		m As MyNikonMBS
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&L\xC3\xB6schen", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&L\xC3\xB6schen"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&L\xC3\xB6schen"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"Beenden", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Beenden"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
