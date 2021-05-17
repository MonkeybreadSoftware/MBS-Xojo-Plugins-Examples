#tag Class
Protected Class MyPDFView
Inherits CustomPDFViewMBS
	#tag Event
		Sub AfterDrawPagePost(graphics as NSGraphicsMBS, page as PDFPageMBS)
		  graphics.saveGraphicsState
		  
		  dim p1 as new NSRectMBS(0,0,50,50)
		  dim p2 as NSRectMBS = self.convertRectFromPage(p1, page)
		  dim p3 as NSRectMBS = self.convertRectToView(p2, self.documentView)
		  
		  'System.DebugLog str(p2.x)+" "+str(p2.y)
		  'System.DebugLog str(p3.x)+" "+str(p3.y)
		  
		  graphics.SetColorRGB(1.0,0,0)
		  graphics.fillRect(p3.X, p3.Y, p3.Width, p3.Height)
		  
		  Exception n as NSExceptionMBS
		    System.DebugLog n.message
		    
		  Finally
		    graphics.restoreGraphicsState
		    
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
