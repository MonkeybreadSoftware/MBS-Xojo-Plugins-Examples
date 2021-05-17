#tag Class
Protected Class MyNSViewMBS
Inherits CustomNSViewMBS
	#tag Event
		Sub DrawRect(g as NSGraphicsMBS, left as double, top as double, width as double, height as double)
		  
		  System.DebugLog "Realbasic drawRect event"
		  
		  // draw icon
		  g.drawAtPoint Image,20,2,0,0,128,128,g.NSCompositeSourceOver,1.0
		End Sub
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
		    
		    p=file.IconImageMBS(128)
		    m=file.IconMaskMBS(128)
		    
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
