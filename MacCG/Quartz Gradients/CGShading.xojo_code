#tag Module
Protected Module CGShading
	#tag Method, Flags = &h0
		Sub DrawAxialGradient(dest as Graphics, vertical as Boolean, color1 as Color, color2 as Color, Left as Integer, Top as Integer, Width as Integer, Height as Integer)
		  dim rect as CGRectMBS
		  dim shading as CGShadingMBS
		  dim domainAndRange as MemoryBlock
		  dim startPoint, endPoint as CGPointMBS
		  
		  dim colorSpace as CGColorSpaceMBS = CGColorSpaceMBS.CreateDeviceRGB
		  
		  if not vertical then
		    startPoint = new CGPointMBS(0,Height)
		    endPoint   = new CGPointMBS(0,0)
		  else
		    startPoint = new CGPointMBS(0,0)
		    endPoint   = new CGPointMBS(width,0)
		  end if
		  
		  dim f as new MyCGFunction
		  f.r1 = color1.Red   / 255.0
		  f.g1 = color1.Green / 255.0
		  f.b1 = color1.Blue  / 255.0
		  f.a1 = 1.0
		  f.r2 = color2.Red   / 255.0
		  f.g2 = color2.Green / 255.0
		  f.b2 = color2.Blue  / 255.0
		  f.a2 = 1.0
		  
		  #if Target32Bit then
		    domainAndRange = New MemoryBlock(4 * 8)
		    domainAndRange.SingleValue(0*4) = 0
		    domainAndRange.SingleValue(1*4) = 1
		    domainAndRange.SingleValue(2*4) = 0
		    domainAndRange.SingleValue(3*4) = 1
		    domainAndRange.SingleValue(4*4) = 0
		    domainAndRange.SingleValue(5*4) = 1
		    domainAndRange.SingleValue(6*4) = 0
		    domainAndRange.SingleValue(7*4) = 1
		  #else
		    domainAndRange = New MemoryBlock(8 * 8)
		    domainAndRange.DoubleValue(0*8) = 0
		    domainAndRange.DoubleValue(1*8) = 1
		    domainAndRange.DoubleValue(2*8) = 0
		    domainAndRange.DoubleValue(3*8) = 1
		    domainAndRange.DoubleValue(4*8) = 0
		    domainAndRange.DoubleValue(5*8) = 1
		    domainAndRange.DoubleValue(6*8) = 0
		    domainAndRange.DoubleValue(7*8) = 1
		  #endif
		  
		  dim contextHandle as integer = dest.Handle(dest.HandleTypeCGContextRef)
		  dim context as CGContextMBS = CGContextMBS.contextWithCGContext(contextHandle)
		  
		  if context<>nil then
		    context.SaveGState
		    
		    // Clip to the Specified bounds
		    
		    rect=new CGRectMBS(left, top, Width, Height)
		    
		    f.Create 1, domainAndRange, 4, domainAndRange
		    System.DebugLog "f: "+hex(f.Handle)
		    
		    // Draw Gradient
		    shading = CGShadingCreateAxialMBS(colorSpace, startPoint, endPoint, f, false, false)
		    System.DebugLog "shading: "+hex(shading.Handle)
		    
		    context.DrawShading shading
		    
		    // Close CGContext
		    context.RestoreGState
		    'context.Flush
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawRadialGradient(dest as Graphics, vertical as Boolean, color1 as Color, color2 as Color, Left as Integer, Top as Integer, Width as Integer, Height as Integer, startRadius as single, endRadius as single)
		  dim rect as CGRectMBS
		  dim shading as CGShadingMBS
		  dim domainAndRange as MemoryBlock
		  dim startPoint, endPoint as CGPointMBS
		  
		  dim colorSpace as CGColorSpaceMBS = CGColorSpaceMBS.CreateDeviceRGB
		  
		  if not vertical then
		    startPoint = new CGPointMBS(70,70)
		    endPoint   = new CGPointMBS(20,20)
		  else
		    startPoint = new CGPointMBS(20,70)
		    endPoint   = new CGPointMBS(70,20)
		  end if
		  
		  dim f as new MyCGFunction
		  f.r1 = color1.Red   / 255.0
		  f.g1 = color1.Green / 255.0
		  f.b1 = color1.Blue  / 255.0
		  f.a1 = 1.0
		  f.r2 = color2.Red   / 255.0
		  f.g2 = color2.Green / 255.0
		  f.b2 = color2.Blue  / 255.0
		  f.a2 = 1.0
		  
		  #if Target32Bit then
		    domainAndRange = New MemoryBlock(4 * 8)
		    domainAndRange.SingleValue(0*4) = 0
		    domainAndRange.SingleValue(1*4) = 1
		    domainAndRange.SingleValue(2*4) = 0
		    domainAndRange.SingleValue(3*4) = 1
		    domainAndRange.SingleValue(4*4) = 0
		    domainAndRange.SingleValue(5*4) = 1
		    domainAndRange.SingleValue(6*4) = 0
		    domainAndRange.SingleValue(7*4) = 1
		  #else
		    domainAndRange = New MemoryBlock(8 * 8)
		    domainAndRange.DoubleValue(0*8) = 0
		    domainAndRange.DoubleValue(1*8) = 1
		    domainAndRange.DoubleValue(2*8) = 0
		    domainAndRange.DoubleValue(3*8) = 1
		    domainAndRange.DoubleValue(4*8) = 0
		    domainAndRange.DoubleValue(5*8) = 1
		    domainAndRange.DoubleValue(6*8) = 0
		    domainAndRange.DoubleValue(7*8) = 1
		  #endif
		  
		  dim contextHandle as integer = dest.Handle(dest.HandleTypeCGContextRef)
		  dim context as CGContextMBS = CGContextMBS.contextWithCGContext(contextHandle)
		  
		  if context<>nil then
		    context.SaveGState
		    
		    // Clip to the Specified bounds
		    
		    rect=new CGRectMBS(Left, Top, Width, Height)
		    
		    f.Create 1, domainAndRange, 4, domainAndRange
		    
		    // Draw Gradient
		    shading = CGShadingCreateRadialMBS(colorSpace, startPoint, startRadius, endPoint, endRadius, f, false, false)
		    
		    context.DrawShading shading
		    
		    // Close CGContext
		    context.RestoreGState
		    'context.Flush
		  end if
		End Sub
	#tag EndMethod


	#tag Constant, Name = pi, Type = Double, Dynamic = False, Default = \"3.14159265358979", Scope = Public
	#tag EndConstant


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
