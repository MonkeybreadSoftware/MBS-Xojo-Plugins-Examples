#tag Class
Protected Class MyNSViewMBS
Inherits CustomNSViewMBS
	#tag Event
		Sub DrawRect(g as NSGraphicsMBS, left as double, top as double, width as double, height as double)
		  
		  System.DebugLog "Realbasic drawRect event"
		  
		  if me.clicked then
		    statusitem.DrawStatusBarBackground left,top,width,height,true
		  else
		    statusitem.DrawStatusBarBackground left,top,width,height,false
		  end if
		  
		  // draw something to track mouse events 
		  g.SetColorRGB(0,0,0,0.05)
		  g.fillRect left,top,width,height
		  
		  // draw icon
		  g.drawAtPoint Image,0,2,0,0,16,16,g.NSCompositeSourceOver,1.0
		End Sub
	#tag EndEvent

	#tag Event
		Function mouseDown(e as NSEventMBS, x as double, y as double) As boolean
		  System.DebugLog "Realbasic mousedown event"
		  
		  clicked=True
		  needsDisplay=true // will make the view redraw
		  
		End Function
	#tag EndEvent

	#tag Event
		Function mouseUp(e as NSEventMBS, x as double, y as double) As boolean
		  System.DebugLog "Realbasic mouseup event"
		  
		  clicked=false
		  needsDisplay=true // will make the view redraw
		  
		  if statusitem<>nil and menu<>Nil then
		    statusitem.popUpStatusItemMenu(Menu)
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  image=GetSafariIcon
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Function GetSafariIcon() As nsimagembs
		  dim file as FolderItem
		  dim p,m as Picture
		  
		  file=LaunchServicesFindApplicationForInfoMBS("","com.apple.Safari","")
		  
		  if file<>nil then
		    
		    p=file.IconImageMBS(16)
		    m=file.IconMaskMBS(16)
		    
		    if p<>Nil and m<>nil then
		      Return new NSImageMBS(p,m)
		    end if
		  end if
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected clicked As boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected image As nsimagembs
	#tag EndProperty

	#tag Property, Flags = &h0
		menu As nsmenumbs
	#tag EndProperty

	#tag Property, Flags = &h0
		statusitem As mycocoastatusItemMBS
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
