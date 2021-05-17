#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  dim f as integer
		  dim outFile as FolderItem=SpecialFolder.Desktop.Child("acroform filled.pdf")
		  
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
		  call pdf.SetImportFlags(pdf.kifImportAll)
		  
		  dim filePath as FolderItem = SpecialFolder.Desktop.Child("acroform.pdf")
		  
		  if (pdf.OpenImportFile(filePath, pdf.kptOpen, "") < 0) then
		    MsgBox "Input file """+filePath.name+""" not found. Please run the other example first to create the fields."
		    quit
		  end if
		  
		  call pdf.ImportPDFFile( 1, 1.0, 1.0)
		  
		  call pdf.EditPage(1)
		  
		  // check what fields are there and show in listbox:
		  
		  dim l as listbox = MainWindow.Listbox1
		  
		  dim c as integer = pdf.GetFieldCount-1
		  for i as integer = 0 to c
		    
		    L.AddRow str(i)
		    l.Cell(l.LastIndex,1) = pdf.GetFieldName(i)
		    
		    dim fieldType as integer = pdf.GetFieldType(i)
		    dim x as string = str(fieldType)
		    
		    Select case fieldType
		    case pdf.kftButton
		      x = "Button"
		    case pdf.kftCheckBox
		      x = "CheckBox"
		    case pdf.kftComboBox
		      x = "ComboBox"
		    case pdf.kftGroup
		      x = "Group"
		    case pdf.kftListBox
		      x = "ListBox"
		    case pdf.kftRadioBtn
		      x = "RadioBtn"
		    case pdf.kftText
		      x = "Text"
		    end Select
		    
		    l.Cell(l.LastIndex,2) = x
		    
		  next
		  
		  // fill values here:
		  
		  // a normal text field
		  f = pdf.FindField("Finanzamt")
		  if f>=0 then
		    call pdf.SetTextFieldValue(f, "Mayen", "", pdf.ktaLeft)
		  end if
		  
		  f = pdf.FindFieldAnsi("Vorname")
		  if f>=0 then
		    call pdf.SetTextFieldValue(f, "Peter", "", pdf.ktaLeft)
		  end if
		  
		  // and a combo box field:
		  f = pdf.FindField("Religion")
		  if f>=0 then
		    call pdf.SetFieldExpValue(f, 2, "Kath.", "Kath", true)
		  end if
		  
		  // set radiobutton
		  f = pdf.FindField("AntragsArt")
		  if f>=0 then
		    // got the radiobutton, now check the subfields
		    dim ff as DynaPDFFieldExMBS = pdf.GetFieldEx(f)
		    
		    dim u as integer = ff.KidCount-1
		    for i as integer = 0 to u
		      dim fff as DynaPDFFieldExMBS = ff.Kids(i)
		      if fff.Value = "Sparzulage" then // found ours
		        call pdf.SetCheckBoxState(fff.Handle, true) // set it
		      end if
		    next
		    
		  end if
		  
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
		  
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
