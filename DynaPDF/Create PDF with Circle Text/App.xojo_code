#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with Circle Text.pdf")
		  
		  // create new PDF
		  call pdf.CreateNewPDF f
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  // new page
		  call pdf.Append
		  
		  const pi = 3.1415926535897932384626433832795
		  call pdf.SetFontEx("Arial", pdf.kfsRegular, 12.0, true, pdf.kcp1252)
		  
		  dim txt as string = "This text flows around a circle... "
		  dim len as integer = len(txt)
		  
		  dim width as double = pdf.GetTextWidth(txt)
		  
		  // circumference = d * pi or 2 * r * pi
		  dim r as double = width / pi * 0.5
		  
		  // we need two rotations
		  // at -90 degree the first character should have rotation of 0 degree
		  // and the text should go in a circle.
		  // so we calculate first the destination position for a character and
		  // then we rotate it there in place 
		  
		  dim m as new DynapdfMatrixMBS
		  dim alpha, w, si, co, x, y as double
		  
		  dim a as double = -90.0 / 180.0 * pi
		  dim g as double = 0.0
		  
		  dim character as string = left(txt,1)
		  w = pdf.GetTextWidth(character)
		  
		  // We change the rotating angle, so we rotate character in the center
		  
		  // We subtract it back later with WriteAngleText() 
		  g = w / r * 0.5
		  a = a + g
		  
		  for i as integer = 1 to len
		    // calculate length of character 
		    character = mid(txt,i,1)
		    w = pdf.GetTextWidth(character)
		    
		    si = sin(a)
		    co = cos(a)
		    // we rotate the coordinate system at point 250, 590...
		    m.a = co
		    m.b = si
		    m.c = -si
		    m.d = co
		    m.x = 250.0
		    m.y = 590.0
		    
		    x = -r
		    y = 0.0
		    m.Transform(x, y)
		    
		    alpha = ((a-g) * 180.0 / pi) + 90.0
		    call pdf.WriteAngleText(character, alpha, x, y, 0.0, 0.0)
		    a = a - w / r // Radians
		  next
		  
		  
		  // finish page
		  call pdf.EndPage
		  
		  // Close file
		  call pdf.CloseFile
		  
		  // open PDF
		  f.Launch
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
