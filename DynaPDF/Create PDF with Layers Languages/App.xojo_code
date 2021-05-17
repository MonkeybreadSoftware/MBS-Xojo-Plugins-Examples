#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with Layers Languages.pdf")
		  
		  pdf.SetLicenseKey "Lite" // For this example you can use a Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF f
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo output"
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  // Pass warnings and errors to this error callback function
		  
		  dim oc1 as integer = pdf.CreateOCG("Deutsch", true, false, pdf.koiAll)
		  dim oc2 as integer = pdf.CreateOCG("English", true, true, pdf.koiAll)
		  
		  dim bmkDE as integer = pdf.AddBookmark("Deutsch", -1, 1, false)
		  dim bmkEN as integer = pdf.AddBookmark("English", -1, 1, false)
		  
		  dim toggle(-1), on(-1), off(-1) as Uint32
		  toggle.Append oc1
		  toggle.Append oc2
		  
		  
		  // Simply toggle the state from On to Off or vice versa
		  dim act as integer = pdf.CreateSetOCGStateAction(on, off, toggle, true)
		  
		  // Add the action to the bookmarks
		  call pdf.AddActionToObj(pdf.kotBookmark, pdf.koeOnMouseUp, act, bmkDE)
		  call pdf.AddActionToObj(pdf.kotBookmark, pdf.koeOnMouseUp, act, bmkEN)
		  call pdf.SetPageCoords(pdf.kpcTopDown)
		  call pdf.Append
		  call pdf.SetFont("Arial", pdf.kfsRegular + pdf.kfsItalic, 12.0, true, pdf.kcp1252)
		  
		  dim text1 as string = "Dieses Beispiel zeigt wie ein mehrsprachiges Dokument "+_
		  "erzeugt werden kann."+_
		  EndOfLine.UNIX+_
		  EndOfLine.UNIX+_
		  "Zunächst wird beim Öffnen des Dokuments die Sprache mit "+_
		  "einer JavaScript Aktion eingestellt."+_
		  EndOfLine.UNIX+_
		  EndOfLine.UNIX+_
		  "Zusätzlich kann die Sprache auch über zwei Lesezeichen "+_
		  "ausgewählt werden. Hierbei wird lediglich ein Layer ein- "+_
		  "bzw. ausgeblendet."+_
		  EndOfLine.UNIX+_
		  EndOfLine.UNIX+_
		  "Der Seiteninhalt muss natürlich zweimal erzeugt werden, einmal "+_
		  "in Deutsch und einmal in Englisch in diesem Beispiel, jeweils "+_
		  "in unterschiedlichen Layern."
		  
		  dim text2 as string = "This example shows how a multi-language document can be "+_
		  "created."+_
		  EndOfLine.UNIX+_
		  EndOfLine.UNIX+_
		  "The language is initially selected with a JavaScript "+_
		  "Action when opening the file."+_
		  EndOfLine.UNIX+_
		  EndOfLine.UNIX+_
		  "Additionally, the wished language can be selected with two "+_
		  "bookmarks. The bookmarks simply hide or unhide a layer."+_ 
		  EndOfLine.UNIX+_
		  EndOfLine.UNIX+_
		  "The page contents must of course be created twice, one time "+_
		  "in English and one time in German in this example, but in "+_
		  "different layers."
		  
		  // Text for the German layer
		  call pdf.BeginLayer(oc1)
		  call pdf.WriteFTextEx(50.0, 50.0, pdf.GetPageWidth - 100.0, pdf.GetPageHeight - 100.0, pdf.ktaLeft, text1)
		  
		  call pdf.EndLayer
		  
		  
		  // Text for the English layer
		  call pdf.BeginLayer(oc2)
		  call pdf.WriteFTextEx(50.0, 50.0, pdf.GetPageWidth - 100.0, pdf.GetPageHeight - 100.0, pdf.ktaLeft, text2)
		  call pdf.EndLayer
		  call pdf.EndPage
		  // This script displays the correct layer depending on the viewer // language. SI32 actLang = pdfCreateJSAction(pdf,
		  
		  dim lines(-1) as string
		  
		  lines.Append "if (app.viewerVersion >= 6.0)"
		  lines.Append "{"
		  lines.Append "    var ocgArray = this.getOCGs();"
		  lines.Append "    var de = (app.language == ""DEU"");"
		  lines.Append "    for (var i = 0; i < ocgArray.length; i++)"
		  lines.Append "       {"
		  lines.Append "       if (ocgArray[i].name==""English"")"
		  lines.Append "          {"
		  lines.Append "          ocgArray[i].state = !de;"
		  lines.Append "          }"
		  lines.Append "       else"
		  lines.Append "          {"
		  lines.Append "          ocgArray[i].state = de;"
		  lines.Append "          }"
		  lines.Append "       }"
		  lines.Append "}"
		  
		  dim javascript as string = Join(lines,EndOfLine.UNIX)
		  
		  dim actLang as integer = pdf.CreateJSAction(javascript)
		  
		  call pdf.AddActionToObj(pdf.kotCatalog, pdf.koeOnOpen, actLang, -1)
		  
		  call pdf.CloseFile
		  
		  f.Launch
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
