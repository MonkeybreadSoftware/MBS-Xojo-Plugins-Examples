#tag Class
Protected Class MyCGDisplayReconfigurationEventMBS
Inherits CGDisplayReconfigurationEventMBS
	#tag Event
		Sub DisplayReconfiguration(DisplayID as integer, flags as integer)
		  dim flagnames(-1) as string
		  
		  if bitwiseAnd(flags, kCGDisplayUnMirrorFlag) <> 0 then 
		    flagnames.Append "UnMirror"
		  end if
		  
		  if bitwiseAnd(flags, kCGDisplaySetModeFlag) <> 0 then 
		    flagnames.Append "SetMode"
		  end if
		  
		  if bitwiseAnd(flags, kCGDisplaySetMainFlag) <> 0 then 
		    flagnames.Append "SetMain"
		  end if
		  
		  if bitwiseAnd(flags, kCGDisplayRemoveFlag) <> 0 then 
		    flagnames.Append "Remove"
		  end if
		  
		  if bitwiseAnd(flags, kCGDisplayMovedFlag) <> 0 then 
		    flagnames.Append "Moved"
		  end if
		  
		  if bitwiseAnd(flags, kCGDisplayMirrorFlag) <> 0 then 
		    flagnames.Append "Mirror"
		  end if
		  
		  if bitwiseAnd(flags, kCGDisplayEnabledFlag) <> 0 then 
		    flagnames.Append "Enabled"
		  end if
		  
		  if bitwiseAnd(flags, kCGDisplayDisabledFlag) <> 0 then 
		    flagnames.Append "Disabled"
		  end if
		  
		  if bitwiseAnd(flags, kCGDisplayDesktopShapeChangedFlag) <> 0 then 
		    flagnames.Append "DesktopShapeChanged"
		  end if
		  
		  if bitwiseAnd(flags, kCGDisplayBeginConfigurationFlag) <> 0 then 
		    flagnames.Append "BeginConfiguration"
		  end if
		  
		  if bitwiseAnd(flags, kCGDisplayAddFlag) <> 0 then 
		    flagnames.Append "Add"
		  end if
		  
		  window1.List.AddRow "Display "+str(DisplayID)+" changed: "+Join(flagnames)
		  
		End Sub
	#tag EndEvent


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
