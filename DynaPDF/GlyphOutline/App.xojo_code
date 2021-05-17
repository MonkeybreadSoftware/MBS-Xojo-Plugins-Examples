#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  dim f as FolderItem = SpecialFolder.Desktop.Child("GlyphOutline.pdf")
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF f
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  // The font size is NOT considered by GetGlyphOutline!
		  call pdf.SetFont "Arial", pdf.kfsRegular, 10.0, true, pdf.kcp1252
		  
		  
		  dim text as string = "Hello World"
		  dim len as integer = len(text)
		  
		  dim x as integer = 50
		  dim y as integer = 50
		  dim fontSize as double = 40
		  dim Scale as Double = fontSize / 1000.0
		  
		  for i as integer = 1 to len
		    
		    dim ch as string = text.Mid(i,1)
		    
		    dim idx as integer = pdf.GetGlyphIndex( asc(ch))
		    
		    dim glyph as DynaPDFGlyphOutlineMBS = pdf.GetGlyphOutline(idx)
		    
		    if glyph <> nil then
		      
		      // See definition above
		      DrawGlyph(PDF, x, y + fontSize, fontSize, glyph)
		      
		      x = x + glyph.AdvanceX * scale
		      
		    end if
		  next
		  
		  call pdf.EndPage
		  
		  call pdf.CloseFile
		  
		  f.Launch
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DrawGlyph(pdf as DynaPDFMBS, PosX as Double, PosY as Double, FontSize as Double, Outline as DynaPDFGlyphOutlineMBS)
		  Dim idx As Integer = 0
		  dim size as integer = Outline.OutlineCount
		  if size = 0 then Return
		  
		  dim x1 as Double = 0
		  dim y1 as Double = 0
		  dim x2 as Double = 0
		  dim y2 as Double = 0
		  
		  dim fs as Double = FontSize / 1000.0
		  dim s as Double = fs / 64.0
		  
		  dim u as integer = size - 1
		  for i as integer = 0 to u
		    dim p as DynapdfPointMBS = Outline.Outline(i)
		    
		    dim px as integer = p.x
		    dim py as integer = p.y
		    
		    dim cmdX as integer = BitwiseAnd(px, 3)
		    dim cmdY as integer = BitwiseAnd(py, 3)
		    
		    dim cmd as integer = BitwiseOr(cmdX, Bitwise.ShiftLeft(cmdY, 2))
		    
		    Dim ppx As Integer = px / 4 // Bitwise.ShiftRight(px, 2)
		    dim ppy as integer = py / 4 // Bitwise.ShiftRight(py, 2)
		    
		    dim x as double = PosX + ppx * s
		    dim y as double = PosY - ppy * s
		    // Variant for top down coordinates (+ otherwise).
		    
		    // use random colors
		    call pdf.SetFillColor pdf.RGB(rnd * 256, rnd*256, rnd*256)
		    
		    If y < 10 Then
		      Break
		    End If
		    
		    
		    Select case cmd 
		    case 1 
		      call pdf.MoveTo(x, y)
		    case 2
		      call pdf.LineTo(x, y)
		    case 3
		      idx = idx + 1
		      select case idx
		      case 1
		        x1 = x
		        y1 = y
		      case 2
		        idx = 0
		        call pdf.Bezier_2_3(x1, y1, x, y)
		      end Select
		      
		    case 4
		      idx = idx + 1
		      select case idx
		      case 1
		        x1 = x
		        y1 = y
		      case 2
		        x2 = x
		        y2 = y
		      case 3
		        idx = 0
		        call pdf.Bezier_1_2_3(x1, y1, x2, y2, x, y)
		      end Select
		      
		    else
		      break // error?
		    end Select
		  next
		  
		  Call pdf.ClosePath(pdf.kfmStroke)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawGlyphColored(pdf as DynaPDFMBS, PosX as Double, PosY as Double, FontSize as Double, Outline as DynaPDFGlyphOutlineMBS)
		  Dim idx As Integer = 0
		  dim size as integer = Outline.OutlineCount
		  if size = 0 then Return
		  
		  dim x1 as Double = 0
		  dim y1 as Double = 0
		  dim x2 as Double = 0
		  dim y2 as Double = 0
		  
		  dim fs as Double = FontSize / 1000.0
		  dim s as Double = fs / 64.0
		  
		  dim u as integer = size - 1
		  for i as integer = 0 to u
		    dim p as DynapdfPointMBS = Outline.Outline(i)
		    
		    dim px as integer = p.x
		    dim py as integer = p.y
		    
		    dim cmdX as integer = BitwiseAnd(px, 3)
		    dim cmdY as integer = BitwiseAnd(py, 3)
		    
		    dim cmd as integer = BitwiseOr(cmdX, Bitwise.ShiftLeft(cmdY, 2))
		    
		    Dim ppx As Integer = px / 4 // Bitwise.ShiftRight(px, 2)
		    Dim ppy As Integer = py / 4 // Bitwise.ShiftRight(py, 2)
		    
		    dim x as double = PosX + ppx * s
		    dim y as double = PosY - ppy * s
		    // Variant for top down coordinates (+ otherwise).
		    
		    // use random colors
		    Call pdf.SetStrokeColor pdf.RGB(Rnd * 200, Rnd*200, Rnd*200)
		    
		    If y < 10 Then
		      Break
		    End If
		    
		    
		    Select Case cmd 
		    case 1 
		      Call pdf.MoveTo(x, y)
		    Case 2
		      call pdf.LineTo(x, y)
		      Call pdf.ClosePath(pdf.kfmStrokeNoClose)
		      Call pdf.MoveTo(x, y)
		    Case 3
		      idx = idx + 1
		      select case idx
		      case 1
		        x1 = x
		        y1 = y
		      case 2
		        idx = 0
		        Call pdf.Bezier_2_3(x1, y1, x, y)
		        Call pdf.ClosePath(pdf.kfmStrokeNoClose)
		        Call pdf.MoveTo(x, y)
		      End Select
		      
		    case 4
		      idx = idx + 1
		      select case idx
		      case 1
		        x1 = x
		        y1 = y
		      case 2
		        x2 = x
		        y2 = y
		      case 3
		        idx = 0
		        call pdf.Bezier_1_2_3(x1, y1, x2, y2, x, y)
		        Call pdf.ClosePath(pdf.kfmStrokeNoClose)
		        Call pdf.MoveTo(x, y)
		      End Select
		      
		    else
		      break // error?
		    end Select
		  next
		  
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
