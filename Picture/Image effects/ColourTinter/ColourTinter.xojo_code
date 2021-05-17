#tag Class
Protected Class ColourTinter
	#tag Method, Flags = &h0
		Sub TintPicture(theImg as Picture, pGreyBase as Color, pSepiaBase as Color)
		  Dim theRGBSurface as RGBSurface
		  Dim theWidth, theHeight as Integer
		  Dim pColor as Color
		  Dim x, y as Integer
		  Dim theGrey as Integer
		  
		  dim SepiaBaseR as Double
		  dim SepiaBaseG as Double
		  dim SepiaBaseB as Double
		  
		  dim GreyBaseR as Double
		  dim GreyBaseG as Double
		  dim GreyBaseB as Double
		  
		  SepiaBaseR=pSepiaBase.Red / 255.0
		  SepiaBaseG=pSepiaBase.Green / 255.0
		  SepiaBaseB=pSepiaBase.Blue / 255.0
		  
		  GreyBaseR=pGreyBase.Red / 255.0
		  GreyBaseG=pGreyBase.Green / 255.0
		  GreyBaseB=pGreyBase.Blue / 255.0
		  
		  theRGBSurface = theImg.RGBSurface
		  
		  theWidth = theImg.Width-1
		  theHeight = theImg.Height-1
		  
		  For x = 0 to theWidth
		    For y = 0 to theHeight
		      pColor = theImg.RGBSurface.Pixel( x, y )
		      
		      theGrey = ( GreyBaseR * pColor.Red ) + ( GreyBaseG * pColor.Green ) + ( GreyBaseB * pColor.Blue )
		      theImg.RGBSurface.Pixel( x, y ) = RGB( theGrey * SepiaBaseR, theGrey * SepiaBaseG, theGrey * SepiaBaseB )
		      
		    Next
		  Next
		  
		End Sub
	#tag EndMethod


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
			InitialValue="2147483648"
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
