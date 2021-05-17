#tag Class
Protected Class MDIBackground
Inherits WinNotificationMBS
	#tag Event
		Sub GotNotification(Message as Integer, Name as string, Value1 as Integer, Value2 as Integer, byref Result as Integer, byref Handled as boolean)
		  Select case Message
		  case WM_ERASEBKGND
		    
		    dim DCHandle as integer = Value1
		    if DCHandle <> 0 then // must be valid
		      
		      Draw DCHandle
		      
		      // we draw something, so return success
		      handled = true
		      result = 1// success
		    end if
		  case WM_PAINT
		    
		    'declare function GetDC Lib "User32.dll" ( hWnd as Integer) as integer
		    'declare function ReleaseDC Lib "User32.dll" (hWnd as Integer, HDC as Integer) as Int32
		    '
		    'dim DCHandle as integer = GetDC(WindowHandle)
		    'System.DebugLog "DCHandle für Paint: "+str(DCHandle)
		    'if DCHandle <> 0 then // must be valid
		    '
		    'DrawPicture DCHandle
		    '
		    '// we draw something, so return success
		    'handled = true
		    'result = 1
		    '
		    'call ReleaseDC(WindowHandle, DCHandle)
		    '
		    'handled = true
		    'result = 0 // success
		    '
		    'end if
		  end Select
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ClearBitmap()
		  #if TargetWin32 then
		    
		    if hdcSrc <> nil then
		      // unload bitmap from source context
		      
		      declare function SelectObject Lib "gdi32.dll" (hdc as Ptr, hgdiobj as Ptr) as Ptr
		      
		      call SelectObject(hdcSrc, hold)
		      
		      hdcSrc = nil
		      hold = nil
		      
		      declare function DeleteObject Lib "gdi32.dll" ( hgdiobj as Ptr) as Int32
		      
		      call DeleteObject(hdcSrc)
		      hdcSrc = nil
		      
		      // free image
		      
		      
		      call DeleteObject(hBitmap)
		      hBitmap = nil
		      
		    end if
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  #if TargetWin32 then
		    // get MDI window
		    dim MDIWindowHandle as integer = app.MDIWindow.Handle
		    
		    // get child where we draw into
		    declare function GetWindow lib "User32.dll" ( hWnd as integer, uCmd as UInt32) as integer
		    
		    WindowHandle = GetWindow(MDIWindowHandle, GW_CHILD)
		    
		    if WindowHandle = 0 then
		      break // error
		    else
		      Super.Constructor(WindowHandle)
		      
		      call ListenForMessage(WM_ERASEBKGND)
		      'call ListenForMessage(WM_PAINT)
		    end if
		    
		    
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(DCHandle as Integer)
		  #if TargetWin32 then
		    dim r as Rect
		    
		    // query size of window
		    declare function GetClientRect lib "User32.dll" (WindowHandle as Integer, byref r as Rect) as Int32
		    
		    dim b as Integer = GetClientRect(WindowHandle, r)
		    
		    dim w as integer = r.right - r.left
		    dim h as integer = r.bottom - r.top
		    
		    System.DebugLog "Window size: "+str(w)+" x "+str(h)
		    
		    // fill with color
		    
		    FillRect DCHandle, 0, 0, w, h, &cFF0000
		    
		    // draw a picture
		    
		    DrawPicture DCHandle
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawPicture(DCHandle as Integer)
		  #if TargetWin32 then
		    if hdcSrc = nil then 
		      
		      // create source context
		      
		      declare function CreateCompatibleDC Lib "gdi32.dll" (h as integer) as Ptr
		      
		      hdcSrc = CreateCompatibleDC(0)
		      System.DebugLog "hdcSrc: "+str(hdcSrc)
		      
		      // load bitmap into source context
		      
		      declare function SelectObject Lib "gdi32.dll" (hdc as Ptr, hgdiobj as Ptr) as Ptr
		      
		      hBitmap = pic.CopyOSHandle(Picture.HandleType.WindowsBMP)
		      hOld = SelectObject(hdcSrc, hBitmap)
		      System.DebugLog "hBitmap: "+str(hBitmap)
		      System.DebugLog "hOld: "+str(hOld)
		    end if
		    
		    
		    // draw into window
		    Declare Function StretchBlt Lib "gdi32.dll" ( hdcDest As Integer, nXDest As Int32, nYDest As Int32, nDestWidth As Int32, _
		    nDestHeight As Int32, hdcSrc As Ptr, XSrc As Int32, YSrc As Int32, hSrcWidth As Int32, nSrcHeight As Int32, _
		    dwRop As UInt32) As Int32
		    
		    System.DebugLog "DCHandle: "+str(DCHandle)
		    System.DebugLog "hdcSrc: "+str(hdcSrc)
		    dim rr as integer = StretchBlt(DCHandle, 0, 0, pic.Width, pic.Height, hdcSrc, 0, 0, pic.Width, pic.Height, SRCCOPY)
		    System.DebugLog "StretchBlt: "+str(rr)
		    
		  #endif
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillRect(DCHandle as Integer, x as integer, y as integer, w as integer, h as integer, c as color)
		  #if TargetWin32 then
		    dim co as UInt32 = c.red + c.green * 256 + c.blue * 65536
		    
		    declare function CreateSolidBrush lib "gdi32.dll" (c as UInt32) as ptr
		    declare function FillRect lib "User32.dll" (hDC as Integer, byref r as Rect, Brush as Ptr) as int32
		    
		    dim brush as ptr = CreateSolidBrush(co)
		    System.DebugLog "brush: "+str(brush)
		    
		    dim r as rect
		    r.left = x
		    r.top = y
		    r.right = x + w
		    r.bottom = y + h
		    dim re as integer = FillRect(DCHandle, r, brush)
		    System.DebugLog "FillRect returns: "+str(re)
		    
		    
		    declare function DeleteObject Lib "gdi32.dll" ( hgdiobj as Ptr) as Int32
		    
		    call DeleteObject(brush)
		    brush = nil
		  #endif
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private hBitmap As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private hdcSrc As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private hOld As ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPic As Picture
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mPic
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mPic = value
			  ClearBitmap
			  
			End Set
		#tag EndSetter
		Pic As Picture
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		WindowHandle As Integer
	#tag EndProperty


	#tag Constant, Name = GW_CHILD, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SRCCOPY, Type = Double, Dynamic = False, Default = \"&h00CC0020", Scope = Public
	#tag EndConstant

	#tag Constant, Name = WM_ERASEBKGND, Type = Double, Dynamic = False, Default = \"&h14", Scope = Public
	#tag EndConstant

	#tag Constant, Name = WM_PAINT, Type = Double, Dynamic = False, Default = \"&h000F", Scope = Public
	#tag EndConstant


	#tag Structure, Name = RECT, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		left as Integer
		  top as Integer
		  right as Integer
		bottom as integer
	#tag EndStructure


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
		#tag ViewProperty
			Name="WindowHandle"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Pic"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
