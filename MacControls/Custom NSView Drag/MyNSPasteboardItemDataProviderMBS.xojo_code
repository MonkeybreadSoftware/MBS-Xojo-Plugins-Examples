#tag Class
Protected Class MyNSPasteboardItemDataProviderMBS
Inherits NSPasteboardItemDataProviderMBS
	#tag Event
		Sub provideDataForType(Pasteboard as NSPasteboardMBS, item as NSPasteboardItemMBS, type as string)
		  '/*------------------------------------------------------
		  'method called by pasteboard to support promised
		  'drag types.
		  '--------------------------------------------------------*/
		  '//sender has accepted the drag and now we need to send the data for the type we promised
		  if type = NSPasteboardMBS.NSPasteboardTypeTIFF then
		    dim tiff as MemoryBlock = image.TIFFRepresentation
		    
		    //set data for TIFF type on the pasteboard as requested
		    Pasteboard.dataForType(NSPasteboardMBS.NSPasteboardTypeTIFF) = tiff
		    
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		image As NSImageMBS
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
	#tag EndViewBehavior
End Class
#tag EndClass
