#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  dim fi as FolderItem = SpecialFolder.Desktop.Child("Create PDF with sum form field.pdf")
		  
		  pdf.SetLicenseKey "Lite" // For this example you can use a Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF fi
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  dim y as Double = 50
		  
		  dim lines() as string
		  
		  lines.Append "var v1 = this.getField(""Val1"");"
		  lines.Append "var v2 = this.getField(""Val2"");"
		  lines.Append "var v3 = this.getField(""Val3"");"
		  lines.Append "event.value = v1.value + v2.value + v3.value;"
		  
		  dim script as string = Join(lines, EndOfLine.UNIX)
		  dim f as integer
		  dim a as integer
		  
		  a = pdf.CreateJSAction(script)
		  
		  f = pdf.CreateTextField("Val1", -1, false, 0, 50.0, y, 200.0, 20.0)
		  call pdf.SetTextFieldValue(f, "50.00", "50.00", pdf.ktaRight)
		  call pdf.SetNumberFormat(f, pdf.kdsNoneDot, 2, pdf.knsMinusBlack, "", false)
		  
		  y = y + 30
		  f = pdf.CreateTextField("Val2", -1, true, 0, 50.0, y, 200.0, 20.0)
		  call pdf.SetTextFieldValue(f, "100.00", "100.00", pdf.ktaRight)
		  call pdf.SetNumberFormat(f, pdf.kdsNoneDot, 2, pdf.knsMinusBlack, "", false)
		  
		  y = y + 30
		  f = pdf.CreateTextField("Val3", -1, false, 0, 50.0, y, 200.0, 20.0)
		  call pdf.SetTextFieldValue(f, "200.00", "200.00", pdf.ktaRight)
		  call pdf.SetNumberFormat(f, pdf.kdsNoneDot, 2, pdf.knsMinusBlack, "", false)
		  
		  y = y + 30
		  f = pdf.CreateTextField("Sum", -1, false, 10, 50.0, y, 200.0, 20.0)
		  call pdf.SetFieldBorderWidth(f, 0.0)
		  call pdf.SetTextFieldValue(f, "350.00 €", "350.00 €", pdf.ktaRight)
		  call pdf.SetFieldFlags(f, pdf.kffReadOnly, false)
		  
		  // This last field calculates sum of other fields
		  // Works only in PDF Viewers supporting JavaScript!
		  
		  call pdf.AddActionToObj(pdf.kotField, pdf.koeOnCalc, a, f)
		  call pdf.SetNumberFormat(f, pdf.kdsCommaDot, 2, pdf.knsMinusBlack, " €", false)
		  
		  
		  
		  call pdf.EndPage
		  
		  call pdf.CloseFile
		  
		  fi.Launch
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
