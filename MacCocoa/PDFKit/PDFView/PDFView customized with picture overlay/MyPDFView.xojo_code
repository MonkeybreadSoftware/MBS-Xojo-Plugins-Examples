#tag Class
Protected Class MyPDFView
Inherits CustomPDFViewMBS
	#tag Event
		Sub AfterDrawPagePost(graphics as NSGraphicsMBS, page as PDFPageMBS)
		  graphics.saveGraphicsState
		  
		  dim p1 as new NSRectMBS(0,0,595,842)
		  dim p2 as NSRectMBS = self.convertRectFromPage(p1, page)
		  dim p3 as NSRectMBS = self.convertRectToView(p2, self.documentView)
		  
		  dim p as Picture = LogoMBS(300)
		  p.mask.Graphics.ForeColor = &cFFFFFF
		  p.mask.Graphics.Fillrect 0,0,300,300
		  p.mask.Graphics.ForeColor = &c777777
		  p.mask.Graphics.Filloval 0,0,300,300
		  
		  graphics.SetColorRGB(1.0,0,0)
		  graphics.drawAtPoint new NSImageMBS(p,p.mask), p3.X+p3.width/2-p.Width/2, p3.Y+p3.height/2-p.Width/2, 0, 0, 300, 300, graphics.NSCompositeSourceOver, 1.0
		  
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
