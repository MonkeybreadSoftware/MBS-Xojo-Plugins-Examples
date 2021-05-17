#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  dim f, act, keyStrokeAct, keyStrokeAct2, formatAct, formatAct2 as integer
		  dim outFile as FolderItem = SpecialFolder.Desktop.Child("acroform.pdf")
		  
		  dim alertScript as string = "if (app.viewerVersion >= 7.0 && app.viewerVersion < 8.0)"+EndOfLine.UNIX+_
		  "{"+EndOfLine.UNIX+_
		  "app.alert(""Due to bugs in Acrobat 7.0 character spacing does not work"+_
		  " in text fields. We use the flag pdf.kffComb instead which is supported since"+_
		  " Acrobat 6.0. However, if the field's format is controled by a JavaScript"+_
		  " Action, we cannot set the flag because Acrobat 6.0 is then unable"+_
		  " to display the field's text. Acrobat 7.0 has problems to place the"+_
		  " the cursor in such fields but the final format will be correctly applied."+_
		  " The problem is that if the form should work with Acrobat 6.0 we cannot set"+_
		  " the flag pdf.kffComb to the date fields. It is also impossible to get the same"+_
		  " result as with character spacing with the flag pdf.kffComb. So, what can we do to make the"+_
		  " form compatible to all Acrobat versions? I really don't know! The easiest way"+_
		  " would be to avoid the usage of such date formats."");"+EndOfLine.UNIX+_
		  "}"
		  
		  // Error messages and warnings are passed to the callback function.
		  
		  pdf.SetLicenseKey "Lite" // For this example you can use a Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF(nil)
		  call pdf.SetDocInfo pdf.kdiCreator, "REALbasic Example Project"
		  call pdf.SetDocInfo pdf.kdiTitle, "How to create an Interactive Form?"
		  call pdf.SetDocInfo pdf.kdiAuthor, "Jens Boschulte"
		  
		  call pdf.SetViewerPreferences(pdf.kvpDisplayDocTitle, pdf.kavNone)
		  // Conversion of pages to templates is normally not required. Templates are required if
		  // the page should be scaled or used multiple times in a document, e.g. as a page background.
		  // See help file for further information.
		  call pdf.SetImportFlags(BitwiseOr(pdf.kifImportAll, pdf.kifImportAsPage))
		  
		  dim filePath as FolderItem=FindFile("taxform.pdf")
		  
		  
		  if (pdf.OpenImportFile(filePath, pdf.kptOpen, "") < 0) then
		    MsgBox "Input file """+filePath.name+""" not found!"
		    quit
		  end if
		  
		  call pdf.ImportPDFFile( 1, 1.0, 1.0)
		  
		  call pdf.EditPage(1)
		  
		  call pdf.SetCheckBoxChar(pdf.kccCross4)
		  call pdf.SetLineWidth(0.0)
		  call pdf.SetFieldBorderColor(pdf.kNO_COLOR)
		  
		  f = pdf.CreateRadioButton("AntragsArt", "EinkommensSteuerErklärung", false, -1, 70, 746.5, 13.0, 13.0)
		  call pdf.CreateCheckBox("", "Sparzulage", false, f, 70, 722.5, 13.0, 13.0)
		  call pdf.CreateCheckBox("", "VerlustErklärung", false, f, 249.5, 722.5, 13.0, 13.0)
		  
		  call pdf.SetFont("Courier", pdf.kfsNone, 12.0, true, pdf.kcp1252)
		  call pdf.CreateTextField("Finanzamt", -1, false, 0, 70.0, 698.0, 358.0, 14.0)
		  call pdf.CreateTextField("Steuernummer", -1, false, 14, 70.0, 673.5, 150.0, 14.0)
		  call pdf.CreateTextField("Finanzamt_alt", -1, false, 0, 272.0, 673.5, 156.0, 14.0)
		  
		  call pdf.CreateCheckBox("Rückerstattung", "Ja", true, -1, 429, 675.0, 13.0, 13.0)
		  call pdf.CreateTextField("Telefon", -1, false, 0, 285.5, 650.0, 142.5, 14.0)
		  
		  ' Acrobat 7.0 ignores the character spacing, the only way to get the same result is to set the Comb flag.
		  ' See help file for further information.
		  
		  call pdf.SetCharacterSpacing(7.2)
		  f = pdf.CreateTextField("Name", -1, false, 25, 70.0, 626.0, 358.0, 14.0)
		  call pdf.SetFieldFlags(f, pdf.kffComb, false)
		  f = pdf.CreateTextField("Vorname", -1, false, 25, 70.0, 602.0, 358.0, 14.0)
		  call pdf.SetFieldFlags(f, pdf.kffComb, false)
		  f = pdf.CreateTextField("Geburtsdatum", -1, false, 10, 70.0, 578.0, 113.0, 14.0)
		  // Create a custom date format action -> input example: 13.05.1971 or 13-05-1971 or 13/05/1971
		  // Two actions are required, one for the event onKeyStroke and one for the event onFormat.
		  keyStrokeAct = pdf.CreateJSAction("AFDate_KeystrokeEx(""ddmmyyyy"")")
		  formatAct = pdf.CreateJSAction("AFDate_FormatEx(""ddmmyyyy"")")
		  
		  // Add both actions to the field
		  call pdf.AddActionToObj(pdf.kotField, pdf.koeOnKeyStroke, keyStrokeAct, f)
		  call pdf.AddActionToObj(pdf.kotField, pdf.koeOnFormat, formatAct, f)
		  
		  call pdf.SetCharacterSpacing(0.0)
		  f = pdf.CreateComboBox("Religion", false, -1, 185.0, 578.0, 71.0, 14.0)
		  call pdf.AddValToChoiceField(f, "keine", "keine", true)
		  call pdf.AddValToChoiceField(f, "Evang", "Evang.", false)
		  call pdf.AddValToChoiceField(f, "Kath", "Kath.", false)
		  call pdf.AddValToChoiceField(f, "andere", "andere", false)
		  
		  call pdf.CreateTextField("Beruf", -1, false, 0, 257.0, 578.0, 171.0, 14.0)
		  
		  call pdf.SetCharacterSpacing(7.2)
		  f = pdf.CreateTextField("Strasse", -1, false, 25, 70.0, 554.0, 358.0, 14.0)
		  call pdf.SetFieldFlags(f, pdf.kffComb, false)
		  f = pdf.CreateTextField("PLZ", -1, false, 5, 70.0, 530.0, 70.5, 14.0)
		  call pdf.SetFieldFlags(f, pdf.kffComb, false)
		  call pdf.SetNumberFormat(f, pdf.kdsNoneDot, 0, pdf.knsRed, "", false)
		  
		  f = pdf.CreateTextField("Wohnort", -1, false, 20, 142.5, 530.0, 285.5, 14.0)
		  call pdf.SetFieldFlags(f, pdf.kffComb, false)
		  
		  call pdf.SetCharacterSpacing(0.0)
		  call pdf.SetFont("Courier", pdf.kfsNone, 11.0, true, pdf.kcp1252)
		  
		  f = pdf.CreateTextField("VerheiratetSeit", -1, false, 10, 70.0, 506.0, 70.5, 14.0)
		  // We need another date format here. The date should be delimited with a dot.
		  keyStrokeAct2 = pdf.CreateJSAction("AFDate_KeystrokeEx(""dd.mm.yyyy"")")
		  formatAct2 = pdf.CreateJSAction("AFDate_FormatEx(""dd.mm.yyyy"")")
		  call pdf.AddActionToObj(pdf.kotField, pdf.koeOnKeyStroke, keyStrokeAct2, f)
		  call pdf.AddActionToObj(pdf.kotField, pdf.koeOnFormat, formatAct2, f)
		  
		  f = pdf.CreateTextField("VerwitwetSeit", -1, false, 10, 142.0, 506.0, 71.0, 14.0)
		  call pdf.AddActionToObj(pdf.kotField, pdf.koeOnKeyStroke, keyStrokeAct2, f)
		  call pdf.AddActionToObj(pdf.kotField, pdf.koeOnFormat, formatAct2, f)
		  
		  f = pdf.CreateTextField("GeschiedenSeit", -1, false, 10, 214.0, 506.0, 71.0, 14.0)
		  call pdf.AddActionToObj(pdf.kotField, pdf.koeOnKeyStroke, keyStrokeAct2, f)
		  call pdf.AddActionToObj(pdf.kotField, pdf.koeOnFormat, formatAct2, f)
		  
		  f = pdf.CreateTextField("GetrenntSeit", -1, false, 10, 286.0, 506.0, 142.0, 14.0)
		  call pdf.AddActionToObj(pdf.kotField, pdf.koeOnKeyStroke, keyStrokeAct2, f)
		  call pdf.AddActionToObj(pdf.kotField, pdf.koeOnFormat, formatAct2, f)
		  
		  call pdf.SetCharacterSpacing(7.2)
		  call pdf.SetFont("Courier", pdf.kfsNone, 12.0, true, pdf.kcp1252)
		  f = pdf.CreateTextField("EhefrauVorname", -1, false, 25, 70.0, 458.0, 358.0, 14.0)
		  call pdf.SetFieldFlags(f, pdf.kffComb, false)
		  f = pdf.CreateTextField("EhefrauName", -1, false, 25, 70.0, 434.0, 358.0, 14.0)
		  call pdf.SetFieldFlags(f, pdf.kffComb, false)
		  
		  f = pdf.CreateTextField("EhefrauGeburtdatum", -1, false, 10, 70.0, 410.0, 114.0, 14.0)
		  // Add both actions to the field
		  call pdf.AddActionToObj(pdf.kotField, pdf.koeOnKeyStroke, keyStrokeAct, f)
		  call pdf.AddActionToObj(pdf.kotField, pdf.koeOnFormat, formatAct, f)
		  
		  call pdf.SetCharacterSpacing(0.0)
		  f = pdf.CreateComboBox("EhefrauReligion", false, -1, 185.0, 410.0, 71.0, 14.0)
		  call pdf.AddValToChoiceField(f, "keine", "keine", true)
		  call pdf.AddValToChoiceField(f, "Evang", "Evang.", false)
		  call pdf.AddValToChoiceField(f, "Kath", "Kath.", false)
		  call pdf.AddValToChoiceField(f, "andere", "andere", false)
		  
		  call pdf.CreateTextField("EhefrauBeruf", -1, false, 0, 257.0, 410.0, 171.0, 14.0)
		  call pdf.CreateTextField("EhefrauStrasse", -1, false, 49, 70.0, 386.0, 358.0, 14.0)
		  
		  f = pdf.CreateRadioButton("Veranlagung", "Zusammen", false, -1, 70.0, 363.0, 13.0, 13.0)
		  call pdf.CreateCheckBox("", "Getrennt", false, f, 141.5, 363.0, 13.0, 13.0)
		  call pdf.CreateCheckBox("", "Eheschliessung", false, f, 213.5, 363.0, 13.0, 13.0)
		  
		  f = pdf.CreateRadioButton("Guetergemeinschaft", "Ja", false, -1, 357.0, 363.0, 13.0, 13.0)
		  call pdf.CreateCheckBox("", "Nein", false, f, 393.0, 363.0, 13.0, 13.0)
		  
		  call pdf.SetCharacterSpacing(7.2)
		  f = pdf.CreateTextField("Konto", -1, false, 10, 70.0, 314.0, 142.0, 14.0)
		  call pdf.SetFieldFlags(f, pdf.kffComb, false)
		  call pdf.SetNumberFormat(f, pdf.kdsNoneDot, 0, pdf.knsRed, "", false)
		  f = pdf.CreateTextField("BLZ", -1, false, 8, 286.0, 314.0, 113.0, 14.0)
		  call pdf.SetFieldFlags(f, pdf.kffComb, false)
		  call pdf.SetNumberFormat(f, pdf.kdsNoneDot, 0, pdf.knsRed, "", false)
		  
		  f = pdf.CreateTextField("Bank", -1, false, 25, 70.0, 290.0, 358.0, 14.0)
		  call pdf.SetFieldFlags(f, pdf.kffComb, false)
		  
		  call pdf.CreateCheckBox("AbwInhaber", "Ja", false, -1, 70.0, 267.0, 13.0, 13.0)
		  f = pdf.CreateTextField("AbwKontoInhaber", -1, false, 21, 128.0, 266.5, 300.0, 14.0)
		  call pdf.SetFieldFlags(f, pdf.kffComb, false)
		  
		  f = pdf.CreateTextField("AbwEmpfName", -1, false, 25, 70.0, 218.0, 358.0, 14.0)
		  call pdf.SetFieldFlags(f, pdf.kffComb, false)
		  f = pdf.CreateTextField("AbwEmpfVorname", -1, false, 25, 70.0, 194.0, 358.0, 14.0)
		  call pdf.SetFieldFlags(f, pdf.kffComb, false)
		  f = pdf.CreateTextField("AbwEmpfStrasse", -1, false, 25, 70.0, 170.0, 358.0, 14.0)
		  call pdf.SetFieldFlags(f, pdf.kffComb, false)
		  f = pdf.CreateTextField("AbwEmpfPLZ", -1, false, 5, 70.0, 146.5, 70.5, 14.0)
		  call pdf.SetFieldFlags(f, pdf.kffComb, false)
		  call pdf.SetNumberFormat(f, pdf.kdsNoneDot, 0, pdf.knsRed, "", false)
		  
		  f = pdf.CreateTextField("AbwEmpfWohnort", -1, false, 20, 142.5, 146.5, 285.5, 14.0)
		  call pdf.SetFieldFlags(f, pdf.kffComb, false)
		  
		  // Add a reset button to the form
		  call pdf.SetFieldBorderColor(pdf.kPDF_BLACK)
		  call pdf.SetFieldBackColor(pdf.kPDF_MOGREEN)
		  call pdf.SetLineWidth(1.0)
		  call pdf.SetFont("Helvetica", pdf.kfsBold, 12.0, true, pdf.kcp1252)
		  f = pdf.CreateButton("Reset", "Zurücksetzen", -1, 440.0, 730.0, 120.0, 25.0)
		  call pdf.SetFieldBorderStyle(f, pdf.kbsBevelled)
		  act = pdf.CreateResetAction
		  call pdf.AddActionToObj(pdf.kotField, pdf.koeOnMouseUp, act, f)
		  
		  call pdf.SetCharacterSpacing(0.0)
		  call pdf.SetFont("Courier", pdf.kfsNone, 12.0, true, pdf.kcp1252)
		  call pdf.WriteText(53.0, 48.0, d.LongDate)
		  
		  call pdf.SetFillColor(pdf.RGB(&hFF, &h66, &h66))
		  call pdf.SetFont("Helvetica", pdf.kfsBold, 22.0, false, pdf.kcp1252)
		  call pdf.WriteText(340.0, 70.0, "www.dynaforms.de")
		  
		  call pdf.SetLineWidth(0.0)
		  call pdf.SetLinkHighlightMode(pdf.khmPush)
		  call pdf.SetAnnotFlags(pdf.kafReadOnly)
		  call pdf.WebLink(340.0, 64.0, 204.0, 22.0, "http://www.dynaforms.de")
		  
		  call pdf.AddJavaScript("VersionCheck", alertScript)
		  
		  call pdf.EndPage
		  
		  // No fatal error occurred?
		  if pdf.HaveOpenDoc then
		    // OK, now we can open the output file.
		    if (not pdf.OpenOutputFile(outFile)) then
		      MsgBox "Make sure that you have write access to the project folder!"
		    end if
		  end if
		  
		  if pdf.CloseFile then
		    outFile.Launch
		  end if
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
