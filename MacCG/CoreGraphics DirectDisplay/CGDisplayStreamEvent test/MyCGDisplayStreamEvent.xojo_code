#tag Class
Protected Class MyCGDisplayStreamEvent
Inherits CGDisplayStreamEventMBS
	#tag Event
		Sub FrameAvailable(Status as Integer, displayTime as UInt64, frameSurfaceHandle as Integer, Update as CGDisplayStreamUpdateMBS)
		  dim n as integer = 0
		  dim statustext as string
		  Select case status
		  case StatusFrameBlank
		    statustext = "Blank"
		  case StatusFrameComplete
		    statustext = "Complete"
		  case StatusFrameIdle
		    statustext = "Idle"
		  case StatusStopped
		    statustext = "Stopped"
		  else
		    Break
		  end Select
		  
		  // filter our own window.
		  
		  dim RefreshedRects() as CGRectMBS = update.getRects(update.UpdateRefreshedRects)
		  dim MovedRects() as CGRectMBS = update.getRects(update.UpdateMovedRects)
		  
		  
		  // show others, e.g. seconds in menubar
		  
		  list.InsertRow n, "FrameAvailable at "+str(displayTime)+": "+statustext+", "+str(update.DropCount)+" drops"
		  
		  for each r as CGRectMBS in RefreshedRects
		    n = n + 1
		    list.InsertRow n, "   refreshed: pos: "+str(r.Left)+"/"+str(r.top)+", width: "+str(r.Width)+", height: "+str(r.Height)
		  next
		  
		  for each r as CGRectMBS in MovedRects
		    n = n + 1
		    list.InsertRow n, "   moved: pos: "+str(r.Left)+"/"+str(r.top)+", width: "+str(r.Width)+", height: "+str(r.Height)
		  next
		  
		  dim ci as CIImageMBS = Update.CIImage
		  if ci <> nil then
		    dim p as Picture = ci.RenderPicture
		    if p <> nil then
		      MainWindow.RefreshedRects = RefreshedRects
		      MainWindow.pic = p
		      output.Invalidate
		    end if
		  end if
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		factor As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		list As Listbox
	#tag EndProperty

	#tag Property, Flags = &h0
		output As canvas
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
		#tag ViewProperty
			Name="factor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
