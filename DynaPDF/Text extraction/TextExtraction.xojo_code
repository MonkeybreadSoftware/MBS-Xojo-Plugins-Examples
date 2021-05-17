#tag Class
Protected Class TextExtraction
	#tag Method, Flags = &h0
		Sub AddText()
		  const space = " "
		  
		  dim textDir as TextDirection = TextDirection.tfNotInitialized
		  dim x1 as double = 0.0
		  dim y1 as double = 0.0
		  dim x2 as double = 0.0
		  dim y2 as double = Stack.FontSize
		  
		  // Transform the text matrix to user space
		  dim m as DynapdfMatrixMBS = MulMatrix(Stack.ctm, Stack.tm)
		  
		  // Start point of the text record
		  Transform(m, x1, y1)
		  
		  // The second point to determine the text direction can also be used to calculate
		  // the visible font size measured in user space:
		  //   double realFontSize = CalcDistance(x1, y1, x2, y2);
		  
		  Transform(m, x2, y2)
		  // Determine the text direction
		  if y1 = y2 then
		    if x1>x2 then
		      textdir = TextDirection.tfRightToLeft
		    else
		      textDir = TextDirection.tfLeftToRight
		    end if
		  else
		    if y1>y2 then
		      textDir = TextDirection.tfBottomToTop
		    else
		      textDir = TextDirection.tfTopToBottom
		    end if
		  end if
		  
		  // Wrong direction or not on the same text line?
		  if textDir <> LastTextDir or false = IsPointOnLine(x1, y1, LastTextEndX, LastTextEndY, LastTextInfX, LastTextInfY) then
		    // Extend the x-coordinate to an infinite point.
		    LastTextInfX = 1000000.0
		    LastTextInfY = 0.0
		    Transform(m, LastTextInfX, LastTextInfY)
		    
		    if LastTextDir <> TextDirection.tfNotInitialized then
		      // Add a new line to the output file
		      out.WriteLine
		    end if
		  else
		    // The space width is measured in text space but the distance between two text
		    // records is measured in user space! We must transform the space width to user
		    // space before we can compare the values.
		    dim distance, spaceWidth as Double
		    // Note that we use the full space width here because the end position of the last record
		    // was set to the record width minus the half space width.
		    dim x3 as double = Stack.SpaceWidth
		    dim y3 as double = 0.0
		    Transform(m, x3, y3)
		    spaceWidth = CalcDistance(x1, y1, x3 ,y3)
		    distance   = CalcDistance(LastTextEndX, LastTextEndY, x1, y1)
		    
		    if (distance > spaceWidth) then
		      // Add a space to the output file
		      out.Write space
		    end if
		  end if
		  
		  dim spaceWidth as double = -Stack.SpaceWidth * 0.5
		  for i as integer =0 to Stack.KerningCount-1
		    if stack.KerningAdvance(i) < spaceWidth then
		      // Add a space to the output file
		      Write space
		    end if
		    Write stack.KerningText(i)
		  next
		  
		  // We don't set the cursor to the real end of the string because applications like MS Word
		  // add often a space to the end of a text record and this space can slightly overlap the next
		  // record. IsPointOnLine() would return false if the new record overlaps the previous one.
		  LastTextEndX = Stack.TextWidth + spaceWidth // spaceWidth is a negative value!
		  LastTextEndY = 0.0
		  LastTextDir  = textDir
		  // Calculate the end coordinate of the text record
		  Transform m, LastTextEndX, LastTextEndY
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CalcDistance(x1 as double, y1 as Double, x2 as Double, y2 as Double) As Double
		  dim dx as double = x2-x1
		  dim dy as double = y2-y1
		  
		  return sqrt(dx*dx + dy*dy)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(file as FolderItem, pdf as DynaPDFMBS)
		  me.pdf = pdf
		  me.stack = new DynaPDFStackMBS
		  
		  LastTextEndX = 0.0
		  LastTextEndY = 0.0
		  LastTextDir = TextDirection.tfNotInitialized
		  LastTextInfX = 0.0
		  LastTextInfY = 0.0
		  LastTextX = 0.0
		  LastTextY = 0.0
		  
		  
		  out = file.CreateTextFile
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function IsPointOnLine(x as Double, y as Double, x0 as Double, y0 as Double, x1 as Double, y1 as Double) As Boolean
		  dim dx, dy, di as Double
		  
		  x = x - x0
		  y = y - y0
		  dx = x1 - x0
		  dy = y1 - y0
		  di = (x*dx + y*dy) / (dx*dx + dy*dy)
		  
		  if di < 0.0 then
		    di = 0.0
		  elseif di > 1.0 then
		    di = 1.0
		  end if
		  
		  dx = x - di * dx
		  dy = y - di * dy
		  di = dx*dx + dy*dy
		  
		  return (di < MAX_LINE_ERROR)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function MulMatrix(m1 as DynapdfMatrixMBS, m2 as DynapdfMatrixMBS) As DynapdfMatrixMBS
		  dim r as new DynapdfMatrixMBS
		  
		  r.a = m2.a * m1.a + m2.b * m1.c
		  r.b = m2.a * m1.b + m2.b * m1.d
		  r.c = m2.c * m1.a + m2.d * m1.c
		  r.d = m2.c * m1.b + m2.d * m1.d
		  r.x = m2.x * m1.a + m2.y * m1.c + m1.x
		  r.y = m2.x * m1.b + m2.y * m1.d + m1.y
		  
		  Return r
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ParsePage()
		  redim templates(-1)
		  
		  if pdf.InitStack(stack) = false then Return
		  
		  LastTextEndX = 0.0
		  LastTextEndY = 0.0
		  LastTextDir = TextDirection.tfNotInitialized
		  LastTextInfX = 0.0
		  LastTextInfY = 0.0
		  LastTextX = 0.0
		  LastTextY = 0.0
		  
		  ParseText
		  ParseTemplates
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ParseTemplates()
		  dim tmplCount as integer = pdf.GetTemplCount
		  
		  for i as integer = 0 to tmplCount-1
		    
		    if pdf.EditTemplate(i) = false then Return
		    
		    dim template as integer = pdf.GetTemplHandle
		    if templates.IndexOf(template) < 0 then
		      templates.Append template
		      
		      if pdf.InitStack(stack) = false then Return
		      
		      ParseText
		      
		      // recursive for subtemplates
		      dim tmplCount2 as integer = pdf.GetTemplCount
		      for j as integer = 0 to tmplCount2-1
		        ParseTemplates
		      next
		    end if
		    call pdf.EndTemplate
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ParseText()
		  // Get the first text record if any
		  dim haveMore as Boolean = pdf.GetPageText(Stack)
		  
		  // No text found?
		  if not haveMore and Stack.TextLen = 0 then return
		  
		  AddText
		  
		  if haveMore then
		    while pdf.GetPageText(Stack)
		      
		      AddText
		    wend
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub Transform(m as DynapdfMatrixMBS, byref x as Double, byref y as Double)
		  dim tx as Double = x
		  
		  x = tx * M.a + y * M.c + M.x
		  y = tx * M.b + y * M.d + M.y
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(t as string)
		  out.Write ConvertEncoding(t, encodings.UTF8)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WritePageIdentifier(pagenum as integer)
		  if pagenum>1 then
		    out.WriteLine
		  end if
		  
		  out.WriteLine "%----------------------- Page "+str(Pagenum)+" -----------------------------"
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		LastTextDir As TextDirection
	#tag EndProperty

	#tag Property, Flags = &h0
		LastTextEndX As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		LastTextEndY As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		LastTextInfX As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		LastTextInfY As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		LastTextX As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		LastTextY As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		out As TextOutputStream
	#tag EndProperty

	#tag Property, Flags = &h0
		pdf As DynaPDFMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		stack As DynaPDFStackMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		Templates() As Integer
	#tag EndProperty


	#tag Constant, Name = MAX_LINE_ERROR, Type = Double, Dynamic = False, Default = \"4.0", Scope = Public
	#tag EndConstant


	#tag Enum, Name = TextDirection, Type = Integer, Flags = &h0
		tfLeftToRight=0
		  tfRightToLeft=1
		  tfTopToBottom=2
		  tfBottomToTop=4
		tfNotInitialized=-1
	#tag EndEnum


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
		#tag ViewProperty
			Name="LastTextEndY"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastTextEndX"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastTextInfX"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastTextInfY"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastTextX"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastTextY"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastTextDir"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="TextDirection"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
