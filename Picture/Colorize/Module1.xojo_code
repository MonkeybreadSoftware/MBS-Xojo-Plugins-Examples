#tag Module
Protected Module Module1
	#tag Method, Flags = &h21
		Private Function blend2(left as color, right as color, value as double) As color
		  dim r,g,b as integer
		  
		  r = round(left.Red * (1-value) + right.Red * value)
		  g = round(left.Green * (1-value) + right.Green * value)
		  b = round(left.Blue * (1-value) + right.Blue * value)
		  
		  return rgb(r,g,b)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function blend3(left as color, main as color, right as color, value as double) As color
		  if value < 0 then
		    return blend2(left, main, value+1)
		  elseif value > 0 then
		    return blend2(main, right, value)
		  else
		    return main
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Colorize(original as color, newColor as color, saturation as double, lightness as double) As color
		  dim refColor as color
		  dim orgLightness as double
		  
		  //Ranges...
		  // saturation 0..1
		  // lightness -1..1
		  
		  orgLightness = original.Value  //get lightness value of original color
		  
		  refColor = blend2(RGB(128,128,128), newColor, saturation)  //get colorizing color as mid-grey reference color
		  
		  if (lightness <= -1) then
		    return &c000000
		    
		  elseif (lightness >= 1) then
		    return &cFFFFFF
		    
		  elseif (lightness >= 0) then
		    return blend3(&c000000, refColor, &cFFFFFF, 2 * (1 - lightness) * (orgLightness - 1) + 1)
		    
		  else
		    return blend3(&c000000, refColor, &cFFFFFF, 2 * (1 + lightness) * orgLightness - 1)
		  end
		End Function
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
End Module
#tag EndModule
