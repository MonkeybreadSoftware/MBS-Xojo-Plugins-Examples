#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Dim pdf As New MyDynapdfMBS
		  dim d as new date
		  Dim fi As FolderItem = SpecialFolder.Desktop.Child("Create Fields with JavaScript Actions.pdf")
		  
		  pdf.SetLicenseKey "Lite" // For this example you can use a Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF fi
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  call pdf.SetCompressionLevel(0) // so we can read in text editor
		  
		  // we try a lot of actions here. The fields should show text once you triggered event
		  Call pdf.Append
		  Call pdf.SetFont("Helvetica", 0, 12)
		  
		  Dim y As Double = 50
		  
		  If True Then 
		    // Catalog, Pages
		    Dim a As Integer = pdf.CreateJSAction("try { this.getField('FieldOpen').value = 'Open'; } catch(e) { alert(e); }")
		    Dim f As Integer = pdf.CreateTextField("FieldOpen", -1, False, 0, 50.0, y, 200.0, 20.0)
		    
		    Call pdf.AddActionToObj(pdf.kotPage, pdf.koeOnOpen, a, 1)
		    Call pdf.WriteText 260, y, "Open"
		    y = y + 30
		  End If
		  
		  If True Then
		    // Pages only
		    Dim a As Integer = pdf.CreateJSAction("try { this.getField('FieldClose').value = 'Close'; } catch(e) { alert(e); }")
		    Dim f As Integer = pdf.CreateTextField("FieldClose", -1, False, 0, 50.0, y, 200.0, 20.0)
		    
		    Call pdf.AddActionToObj(pdf.kotPage, pdf.koeOnClose, a, 1)
		    Call pdf.WriteText 260, y, "Close"
		    y = y + 30
		  End If
		  
		  If True Then
		    // All fields, page, link annotations, bookmarks
		    Dim a As Integer = pdf.CreateJSAction("try { this.getField('FieldMouseUp').value = 'MouseUp'; } catch(e) { alert(e); }")
		    Dim f As Integer = pdf.CreateTextField("FieldMouseUp", -1, False, 0, 50.0, y, 200.0, 20.0)
		    
		    Call pdf.AddActionToObj(pdf.kotField, pdf.koeOnMouseUp, a, f)
		    Call pdf.WriteText 260, y, "MouseUp"
		    y = y + 30
		  End If
		  
		  If True Then
		    // Form fields only
		    Dim a As Integer = pdf.CreateJSAction("try { this.getField('FieldMouseEnter').value = 'MouseEnter'; } catch(e) { alert(e); }")
		    Dim f As Integer = pdf.CreateTextField("FieldMouseEnter", -1, False, 0, 50.0, y, 200.0, 20.0)
		    
		    Call pdf.AddActionToObj(pdf.kotField, pdf.koeOnMouseEnter, a, f)
		    Call pdf.WriteText 260, y, "MouseEnter"
		    y = y + 30
		  End If
		  
		  If True Then
		    // Form fields only
		    Dim a As Integer = pdf.CreateJSAction("try { this.getField('FieldMouseExit').value = 'MouseExit'; } catch(e) { alert(e); }")
		    Dim f As Integer = pdf.CreateTextField("FieldMouseExit", -1, False, 0, 50.0, y, 200.0, 20.0)
		    
		    Call pdf.AddActionToObj(pdf.kotField, pdf.koeOnMouseExit, a, f)
		    Call pdf.WriteText 260, y, "MouseExit"
		    y = y + 30
		  End If
		  
		  If True Then
		    // Form fields only
		    Dim a As Integer = pdf.CreateJSAction("try { this.getField('FieldMouseDown').value = 'MouseDown'; } catch(e) { alert(e); }")
		    Dim f As Integer = pdf.CreateTextField("FieldMouseDown", -1, False, 0, 50.0, y, 200.0, 20.0)
		    
		    Call pdf.AddActionToObj(pdf.kotField, pdf.koeOnMouseDown, a, f)
		    Call pdf.WriteText 260, y, "MouseDown"
		    y = y + 30
		  End If
		  
		  If True Then
		    // Form fields only
		    Dim a As Integer = pdf.CreateJSAction("try { this.getField('FieldFocus').value = 'Focus'; } catch(e) { alert(e); }")
		    Dim f As Integer = pdf.CreateTextField("FieldFocus", -1, False, 0, 50.0, y, 200.0, 20.0)
		    
		    Call pdf.AddActionToObj(pdf.kotField, pdf.koeOnFocus, a, f)
		    Call pdf.WriteText 260, y, "Focus"
		    y = y + 30
		  End If
		  
		  If True Then
		    // Form fields only
		    Dim a As Integer = pdf.CreateJSAction("try { this.getField('FieldBlur').value = 'Blur'; } catch(e) { alert(e); }")
		    Dim f As Integer = pdf.CreateTextField("FieldBlur", -1, False, 0, 50.0, y, 200.0, 20.0)
		    
		    Call pdf.AddActionToObj(pdf.kotField, pdf.koeOnBlur, a, f)
		    Call pdf.WriteText 260, y, "Blur"
		    y = y + 30
		  End If
		  
		  If True Then
		    // Text fields only
		    Dim a As Integer = pdf.CreateJSAction("try { this.getField('FieldKeyStroke').value = 'KeyStroke'; } catch(e) { alert(e); }")
		    Dim f As Integer = pdf.CreateTextField("FieldKeyStroke", -1, False, 0, 50.0, y, 200.0, 20.0)
		    
		    Call pdf.AddActionToObj(pdf.kotField, pdf.koeOnKeyStroke, a, f)
		    Call pdf.WriteText 260, y, "KeyStroke"
		    y = y + 30
		  End If
		  
		  If True Then
		    // Text fields only
		    Dim a As Integer = pdf.CreateJSAction("try { this.getField('FieldFormat').value = 'Format'; } catch(e) { alert(e); }")
		    Dim f As Integer = pdf.CreateTextField("FieldFormat", -1, False, 0, 50.0, y, 200.0, 20.0)
		    
		    Call pdf.AddActionToObj(pdf.kotField, pdf.koeOnFormat, a, f)
		    Call pdf.WriteText 260, y, "Format"
		    y = y + 30
		  End If
		  
		  
		  If True Then
		    // Text fields only
		    Dim a As Integer = pdf.CreateJSAction("try { this.getField('FieldCalc').value = 'Calc'; } catch(e) { alert(e); }")
		    Dim f As Integer = pdf.CreateTextField("FieldCalc", -1, False, 0, 50.0, y, 200.0, 20.0)
		    
		    Call pdf.AddActionToObj(pdf.kotField, pdf.koeOnCalc, a, f)
		    Call pdf.WriteText 260, y, "Calc"
		    y = y + 30
		  End If
		  
		  
		  If True Then
		    // Text fields only
		    Dim a As Integer = pdf.CreateJSAction("try { this.getField('FieldValidate').value = 'Validate'; } catch(e) { alert(e); }")
		    Dim f As Integer = pdf.CreateTextField("FieldValidate", -1, False, 0, 50.0, y, 200.0, 20.0)
		    
		    Call pdf.AddActionToObj(pdf.kotField, pdf.koeOnValidate, a, f)
		    Call pdf.WriteText 260, y, "Validate"
		    y = y + 30
		  End If
		  
		  
		  
		  call pdf.EndPage
		  
		  call pdf.CloseFile
		  
		  fi.Launch
		  
		  Quit
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
