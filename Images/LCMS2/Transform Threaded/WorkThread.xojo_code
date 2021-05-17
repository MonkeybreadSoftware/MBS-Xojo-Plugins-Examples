#tag Class
Protected Class WorkThread
Inherits Thread
	#tag Event
		Sub Run()
		  // we just convert from generic RGB to SRGB
		  // not useful, but we measure how long this takes
		  
		  Dim fi As FolderItem = MainWindow.FindFile("Generic RGB Profile.icc")
		  
		  Dim pi As LCMS2ProfileMBS = LCMS2ProfileMBS.OpenProfileFromFile(fi)
		  Dim po As LCMS2ProfileMBS = LCMS2ProfileMBS.CreateSRGBProfile
		  
		  
		  Dim b1 As New LCMS2BitmapMBS(Input)
		  
		  Dim out As New Picture(Input.Width, Input.Height, 32)
		  Dim b2 As New LCMS2BitmapMBS(out)
		  
		  Dim pif As Integer = pi.FormatterForColorspace(1, False)
		  Dim pof As Integer = po.FormatterForColorspace(1, False)
		  
		  Dim intent As Integer = 1 // relative colormetric
		  Dim t As LCMS2TransformMBS = LCMS2TransformMBS.CreateTransform(po, pof, pi, pif, intent)
		  
		  Dim m1 As Double = Microseconds
		  Dim b As Boolean = t.TransformMT(b1, b2, ThreadCount)
		  Dim m2 As Double = Microseconds
		  
		  TimeMessage = "Transform on main thread: "+Str( (m2-m1) / 1000.0, "0")+"ms"
		  
		  If b Then
		    
		    // show in canvas
		    
		    Self.pic = b2.Picture
		    
		  Else
		    TimeMessage = "Transform failed"
		  End If
		  
		  
		  xojo.core.Timer.CallLater 0, Addressof Finished
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Finished()
		  
		  win.pic = pic
		  win.output.invalidate
		  win.Log TimeMessage
		  
		  win = Nil
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Input As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		pic As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		ThreadCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		TimeMessage As string
	#tag EndProperty

	#tag Property, Flags = &h0
		win As MainWindow
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
			Name="DebugIdentifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadState"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ThreadStates"
			EditorType="Enum"
			#tag EnumValues
				"0 - Running"
				"1 - Waiting"
				"2 - Paused"
				"3 - Sleeping"
				"4 - NotRunning"
			#tag EndEnumValues
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
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Input"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="pic"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TimeMessage"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
