#tag Class
Protected Class BetterImageView
Inherits WebImageView
	#tag Event
		Sub Open()
		  if ErrorImages = nil then
		    ErrorImages = new Dictionary
		  end if
		  
		  dim key as string = str(me.Width)+"x"+str(me.Height)
		  
		  // check to see if we got one already for this size
		  if not ErrorImages.HasKey(key) then
		    
		    dim p as new Picture(me.Width, me.Height, 32)
		    
		    dim g as Graphics = p.Graphics
		    g.TextSize = 12
		    
		    dim s as string = "Missing Picture"
		    dim w as integer = g.stringWidth(s)
		    dim h as integer = g.TextHeight
		    
		    g.TextFont = "Helvetica"
		    g.drawstring s, (g.Width-w)/2, (g.Height-h)/2
		    
		    ErrorImage = new WebPicture(p)
		    
		    ErrorImages.Value(key) = ErrorImage
		  else
		    ErrorImage = ErrorImages.Value(key)
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Shown()
		  dim w as string = str(me.Width)
		  dim h as string = str(me.height)
		  dim o as string = "document.getElementById('"+me.ControlID+"_image')"
		  
		  // set width/height to the one of the control.
		  me.ExecuteJavaScript o+".width = '"+w+"px';"
		  me.ExecuteJavaScript o+".height = '"+h+"px';"
		  me.ExecuteJavaScript o+".style.width = '"+w+"px';"
		  me.ExecuteJavaScript o+".style.height = '"+h+"px';"
		  me.ExecuteJavaScript o+".style.marginLeft = '0px';"
		  me.ExecuteJavaScript o+".style.marginTop = '0px';"
		  me.ExecuteJavaScript o+".style.top = '0px';"
		  me.ExecuteJavaScript o+".style.left = '0px';"
		  
		  // set on error event, so we replace image with error image in case of load error
		  me.ExecuteJavaScript o+".onerror=function(){ this.src='"+me.ErrorImage.URL+"' };"
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		ErrorImage As WebPicture
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared ErrorImages As Dictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
