#tag Class
Protected Class MyCarbonApplicationEventsMBS
Inherits CarbonApplicationEventsMBS
	#tag Event
		Sub ApplicationActivated()
		  ' This even works in built applications.
		  write "Application was activated."
		End Sub
	#tag EndEvent

	#tag Event
		Sub ApplicationDeactivated()
		  write "Application was deactivated."
		End Sub
	#tag EndEvent

	#tag Event
		Function ApplicationGetDockTileMenu() As integer
		  #if TargetCarbon then
		    
		    write "Create Dock Tile Menu"
		    dim m as new MenuMBS
		    
		    if m.NewMenu(1000,"Dockmenu") then
		      m.AppendItem "Just a little test"
		      m.AppendItem "Item 1"
		      m.AppendItem "Item 2"
		      m.AppendItem "Item 3"
		      m.AppendItem "Item 4"
		      
		      m.CommandID(1)=OSTypeFromStringMBS("Test") // codes must have minimum one big letter
		      m.CommandID(2)=OSTypeFromStringMBS("Tes1") // all Lowercase commands are Apple's
		      m.CommandID(3)=OSTypeFromStringMBS("Tes2")
		      m.CommandID(4)=OSTypeFromStringMBS("Tes3")
		      m.CommandID(5)=OSTypeFromStringMBS("Tes4")
		      
		      m.SetIconSelector 2,"FNDR"
		      
		      dockmenu=m // save for later
		      Return m.Handle
		    end if
		    
		  #endif
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub ApplicationHidden()
		  write "Application hidden."
		End Sub
	#tag EndEvent

	#tag Event
		Sub ApplicationLaunched(ProcessSerial as memoryblock)
		  dim s as String
		  dim p as ProcessMBS
		  
		  if ProcessSerial<>nil then
		    p=new ProcessMBS
		    
		    p.GetProcess(ProcessSerial)
		    s=p.Name
		    
		  end if
		  write "Application "+s+" launched."
		End Sub
	#tag EndEvent

	#tag Event
		Sub ApplicationQuit()
		  write "Application quit."
		End Sub
	#tag EndEvent

	#tag Event
		Sub ApplicationShown()
		  write "Application shown."
		End Sub
	#tag EndEvent

	#tag Event
		Sub ApplicationSwitched(ProcessSerial as memoryblock)
		  ' This even works in built applications.
		  dim s as String
		  dim p as ProcessMBS
		  
		  if ProcessSerial<>nil then
		    p=new ProcessMBS
		    
		    p.GetProcess(ProcessSerial)
		    p.Update
		    s=p.Name
		  end if
		  write "Application switched to "+s+"."
		End Sub
	#tag EndEvent

	#tag Event
		Sub ApplicationTerminated(ProcessSerial as memoryblock)
		  
		  if ProcessSerial<>nil then
		    // We can't look the serial up because the app is no longer in the list.
		    // You can make yourself a list of running applications and update it here.
		  end if
		  write "Application terminated."
		End Sub
	#tag EndEvent

	#tag Event
		Function GestureEnded(GlobalMouseX as double, GlobalMouseY as double, WindowHandle as integer, WindowMouseX as double, WindowMouseY as double, WindowPartCode as integer, KeyModifiers as integer) As boolean
		  write "GestureEnded"
		End Function
	#tag EndEvent

	#tag Event
		Function GestureMagnify(GlobalMouseX as double, GlobalMouseY as double, WindowHandle as integer, WindowMouseX as double, WindowMouseY as double, WindowPartCode as integer, KeyModifiers as integer, MagnificationAmount as double) As boolean
		  write "GestureMagnify "+str(MagnificationAmount)
		End Function
	#tag EndEvent

	#tag Event
		Function GestureRotate(GlobalMouseX as double, GlobalMouseY as double, WindowHandle as integer, WindowMouseX as double, WindowMouseY as double, WindowPartCode as integer, KeyModifiers as integer, RotationAmount as double) As boolean
		  write "GestureRotate "+str(RotationAmount)
		End Function
	#tag EndEvent

	#tag Event
		Function GestureStarted(GlobalMouseX as double, GlobalMouseY as double, WindowHandle as integer, WindowMouseX as double, WindowMouseY as double, WindowPartCode as integer, KeyModifiers as integer) As boolean
		  write "GestureStarted "+str(GlobalMouseX)+"/"+str(GlobalMouseY)+" "+hex(WindowHandle)+" "+str(WindowMouseX)+"/"+str(WindowMouseY)+" "+str(WindowPartCode)+" "+str(KeyModifiers)
		End Function
	#tag EndEvent

	#tag Event
		Function GestureSwipe(GlobalMouseX as double, GlobalMouseY as double, WindowHandle as integer, WindowMouseX as double, WindowMouseY as double, WindowPartCode as integer, KeyModifiers as integer, SwipeDirectionX as double, SwipeDirectionY as double) As boolean
		  write "GestureSwipe "+str(SwipeDirectionX)+"/"+str(SwipeDirectionY)
		  
		End Function
	#tag EndEvent

	#tag Event
		Function KeyboardRawKeyDown(maccharcode as integer, keycode as integer, modifiers as integer, keyboardtype as integer) As boolean
		  write "Keyboard raw key down "+str(keycode)
		  Return MainWindow.CheckBox1.Value
		  
		End Function
	#tag EndEvent

	#tag Event
		Function KeyboardRawKeyModifiersChanged(modifierkeys as integer) As boolean
		  write "Keyboard key modifiers changed "+str(modifierkeys)
		End Function
	#tag EndEvent

	#tag Event
		Function KeyboardRawKeyRepeat(maccharcode as integer, keycode as integer, modifiers as integer, keyboardtype as integer) As boolean
		  write "Keyboard raw key repeat "+str(keycode)
		  
		  Return MainWindow.CheckBox1.Value
		  
		End Function
	#tag EndEvent

	#tag Event
		Function KeyboardRawKeyUp(maccharcode as integer, keycode as integer, modifiers as integer, keyboardtype as integer) As boolean
		  write "Keyboard raw key up "+str(keycode)
		  
		  Return MainWindow.CheckBox1.Value
		  
		End Function
	#tag EndEvent

	#tag Event
		Function MouseWheelMoved(modifierKeys as integer, axis as integer, delta as integer) As boolean
		  dim d as Integer
		  dim a as string
		  
		  const cmdKey=256
		  const shiftKey=512
		  const alphaLock=1024
		  const optionKey=2048
		  const controlKey=4096
		  const rightShiftKey=8192
		  const rightOptionKey=16384
		  const rightControlKey=32768
		  
		  const kEventMouseWheelAxisY=1
		  const kEventMouseWheelAxisX=0
		  
		  if axis=kEventMouseWheelAxisY then
		    d=delta
		    
		    if BitwiseAnd(modifierKeys,optionkey)<>0 then
		      d=d*4 // scroll faster with option
		    end if
		    
		    List.ScrollPosition=List.ScrollPosition-d
		    a="Y"
		  elseif axis=kEventMouseWheelAxisX then
		    a="X"
		  else
		    a="?"
		  end if
		  
		  
		  write "MouseWheelMoved "+a+" "+str(delta)
		  
		End Function
	#tag EndEvent

	#tag Event
		Function ServiceCopy(Scrap as CarbonEventsScrapMBS) As boolean
		  'Scrap.AddText "Hi, this is REALbasic!"
		  Scrap.Adddata "TEXT","Hello"
		  
		  write "ServiceCopy"
		End Function
	#tag EndEvent

	#tag Event
		Function ServiceGetTypes(copytypes as CFMutableArrayMBS, pastetypes as CFMutableArrayMBS) As boolean
		  
		  pastetypes.Append me.CreateTypeStringWithOSType("TEXT") // Speak text
		  pastetypes.Append me.CreateTypeStringWithOSType("TIFF") // for Grab
		  
		  copytypes.Append me.CreateTypeStringWithOSType("TEXT")
		  
		  write "ServiceGettypes "+str(pastetypes.Count)
		End Function
	#tag EndEvent

	#tag Event
		Function ServicePaste(Scrap as CarbonEventsScrapMBS) As boolean
		  dim s as String
		  dim p as Picture
		  dim pw as PictureWindow
		  dim tw as TextWindow
		  
		  write "ServicePaste"
		  
		  if Scrap.DataAvailable("TIFF") then // is there a picture?
		    s=scrap.GetData("TIFF")
		    if s<>"" then // yes?
		      
		      p = picture.FromData(s)
		      if p <> Nil then
		        pw=new PictureWindow
		        pw.backdrop=p
		      end if
		    end if
		  end if
		  
		  if scrap.TextAvailable then // maybe ASCII Text?
		    s = scrap.GetText
		    if s<>"" then
		      tw=new TextWindow
		      tw.EditField1.text=s
		    end if
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Function ServicePerform(Scrap as CarbonEventsScrapMBS, MessageName as CFStringMBS, UserData as CFStringMBS) As boolean
		  write "ServicePerform"
		End Function
	#tag EndEvent

	#tag Event
		Sub VolumeMounted(VolumeRefNum as integer, VolumeRoot as FolderItem)
		  dim s as String
		  dim f as FolderItem
		  
		  f=NewVolumeFolderitemMBS(VolumeRefNum)
		  if f<>nil then
		    s=f.DisplayName
		  end if
		  
		  write "A volume was mounted: "+s
		End Sub
	#tag EndEvent

	#tag Event
		Sub VolumeUnmounted(VolumeRefNum as integer)
		  // If you keep a list you can identify the volume...
		  write "A volume was unmounted."
		End Sub
	#tag EndEvent


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
