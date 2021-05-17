#tag Class
Protected Class MyTimer
Inherits Timer
	#tag Event
		Sub Action()
		  dim x as integer = System.Mousex
		  dim y as integer = screen(0).Height-System.Mousey
		  
		  dim belowWindowNumber as integer = 0
		  if o<>Nil then
		    belowWindowNumber = o.WindowID
		  end if
		  dim windowNumber as integer = NSWindowMBS.windowNumberAtPoint(x,y, belowWindowNumber)
		  
		  if LastWindowNumber = windowNumber then Return
		  
		  LastWindowNumber = windowNumber
		  
		  dim list() as Dictionary = CGWindowMBS.GetWindowListInfo(CGWindowMBS.kCGWindowListOptionIncludingWindow, windowNumber)
		  
		  if UBound(list) <0 then Return
		  Dim w As Dictionary = list(0)
		  
		  Dim bounds As Dictionary = w.Lookup(CGWindowMBS.kCGWindowBounds, Nil)
		  
		  If bounds <> Nil Then
		    dim wx as integer = bounds.Value("X")
		    dim wy as integer = bounds.Value("Y")
		    dim wh as integer = bounds.Value("height")
		    dim ww as integer = bounds.Value("width")
		    
		    dim p as Picture = new Picture(ww,wh,32)
		    dim m as Picture = new Picture(ww,wh,32)
		    
		    p.Graphics.forecolor = &cFFFFFF
		    p.graphics.FillRect 0, 0, p.Width, p.Height
		    m.Graphics.forecolor = &c777777
		    m.graphics.FillRect 0, 0, m.Width, m.Height
		    p.Graphics.forecolor = &cFF0000
		    p.Graphics.PenWidth = 3
		    p.Graphics.PenHeight = 3
		    p.graphics.drawrect 0, 0, p.Width, p.Height
		    
		    o=new MyOverlayMBS(wx,wy,ww,wh)
		    o.Pict=p
		    o.Mask=m
		    o.UpdateShow
		    o.TargetWindowNumber = windowNumber
		    o.TargetInfo = list(0)
		    o.IgnoreMouseClicks = false
		  End If
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		LastWindowNumber As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		o As MyOverlayMBS
	#tag EndProperty


	#tag ViewBehavior
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
			Name="RunMode"
			Visible=true
			Group="Behavior"
			InitialValue="2"
			Type="RunModes"
			EditorType="Enum"
			#tag EnumValues
				"0 - Off"
				"1 - Single"
				"2 - Multiple"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=false
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
			Name="Period"
			Visible=true
			Group="Behavior"
			InitialValue="1000"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastWindowNumber"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
