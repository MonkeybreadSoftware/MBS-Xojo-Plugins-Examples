#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with Annotations.pdf")
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF f
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo output"
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  dim y as Double = 50
		  
		  call pdf.SetFont( "Helvetica", pdf.kfsRegular, 20.0, false, pdf.kcp1252)
		  AddHighlightAnnot pdf, pdf.katHighlight, pdf.kPDF_YELLOW,  50.0, y, "Highlight Annotation", "Highlight Annotations", "This is a highlight annotation"
		  AddHighlightAnnot pdf, pdf.katSquiggly,  pdf.kPDF_RED,    300.0, y, "Squiggly Annotation",  "Highlight Annotations", "This is a squiggly annotation"
		  y = y + 30.0
		  AddHighlightAnnot pdf, pdf.katStrikeOut, pdf.kPDF_RED,     50.0, y, "Strikeout Annotation",  "Highlight Annotations", "This is a strikeout annotation"
		  AddHighlightAnnot pdf, pdf.katUnderline, pdf.kPDF_RED,    300.0, y, "Underline Annotation",  "Highlight Annotations", "This is a underline annotation"
		  
		  y = y + 40.0
		  call pdf.CircleAnnot( 50.0, y, 200.0, 100.0, 1.0, pdf.kPDF_CREAM, pdf.kPDF_BLACK, pdf.kcsDeviceRGB, "Test app", "Circle Annotations", "This is a circle annotation")
		  call pdf.SquareAnnot(300.0, y, 200.0, 100.0, 1.0, pdf.kPDF_CREAM, pdf.kPDF_BLACK, pdf.kcsDeviceRGB, "Test app", "Square Annotations", "This is a square annotation")
		  
		  y = y + 130.0
		  call pdf.ChangeFontSize(12.0)
		  call pdf.WriteFTextEx(50.0, y, pdf.GetPageWidth - 100.0, -1.0, pdf.ktaLeft, _
		  "The icon color of text and file attachment annotations can be changed if "+_
		  "necessary with SetAnnotColor(). The background color must be set.\n\nText Annotations:")
		  
		  y = pdf.GetPageHeight - pdf.GetLastTextPosY + 10.0
		  
		  dim a as integer
		  
		  // The default icon color can be changed if necessary
		  call pdf.TextAnnot( 50.0, y, 200.0, 100.0, "Test app", "This is a text annotation", pdf.kaiComment, false)
		  a = pdf.TextAnnot(100.0, y, 200.0, 100.0, "Test app", "This is a text annotation", pdf.kaiHelp, false)
		  call pdf.SetAnnotColor(a, pdf.kfcBackColor, pdf.kcsDeviceRGB, PDF.RGB(200, 20, 30))
		  
		  call pdf.TextAnnot(150.0, y, 200.0, 100.0, "Test app", "This is a text annotation", pdf.kaiInsert, false)
		  a = pdf.TextAnnot(200.0, y, 200.0, 100.0, "Test app", "This is a text annotation", pdf.kaiKey, false)
		  call pdf.SetAnnotColor(a, pdf.kfcBackColor, pdf.kcsDeviceRGB, PDF.RGB(50, 200, 30))
		  call pdf.TextAnnot(250.0, y, 200.0, 100.0, "Test app", "This is a text annotation", pdf.kaiNewParagraph, false)
		  a = pdf.TextAnnot(300.0, y, 200.0, 100.0, "Test app", "This is a text annotation", pdf.kaiNote, false)
		  call pdf.SetAnnotColor(a, pdf.kfcBackColor, pdf.kcsDeviceRGB, PDF.RGB(70, 120, 210))
		  call pdf.TextAnnot( 350.0, y, 200.0, 100.0, "Test app", "This is a text annotation", pdf.kaiParagraph, false)
		  
		  y = y + 50.0
		  call pdf.WriteText(50.0, y, "File Attachment Annotations:")
		  
		  y = y + 20.0
		  
		  dim path as FolderItem = FindFile("gdi.emf")
		  call pdf.FileAttachAnnot( 50.0, y, pdf.kfaiGraph,     "Test app", "An example attachment", path, true)
		  call pdf.FileAttachAnnot(100.0, y, pdf.kfaiPaperClip, "Test app", "An example attachment", path, true)
		  a =  pdf.FileAttachAnnot(150.0, y, pdf.kfaiPushPin, "Test app", "An example attachment", path, true)
		  call pdf.SetAnnotColor(a, pdf.kfcBackColor, pdf.kcsDeviceRGB, PDF.RGB(70, 120, 210))
		  call pdf.FileAttachAnnot(200.0, y, pdf.kfaiTag,       "Test app", "An example attachment", path, true)
		  
		  y = y + 60.0
		  a = pdf.FreeTextAnnot(50.0, y, 300.0, 80.0, "Test app", "This is a FreeText Annotation.", pdf.ktaCenter)
		  call pdf.SetAnnotBorderWidth(a, 3.0)
		  call pdf.SetAnnotColor(a, pdf.kfcBorderColor, pdf.kcsDeviceRGB, pdf.kPDF_GRAY)
		  
		  y = y + 120.0
		  call pdf.WriteText(50.0, y, "Line Annotations:")
		  
		  y = y + 30.0 
		  call pdf.LineAnnot(50.0, y, 350.0, y, 1.0, pdf.kleNone,         pdf.kleNone, pdf.kPDF_RED, pdf.kPDF_BLACK, pdf.kcsDeviceRGB, "Test app", "Line Annotations", "This is a line annotation")
		  y = y + 20.0 
		  call pdf.LineAnnot(50.0, y, 350.0, y, 1.0, pdf.kleButt,         pdf.kleButt, pdf.kPDF_RED, pdf.kPDF_BLACK, pdf.kcsDeviceRGB, "Test app", "Line Annotations", "This is a line annotation")
		  y = y + 20.0 
		  call pdf.LineAnnot(50.0, y, 350.0, y, 1.0, pdf.kleCircle,       pdf.kleCircle, pdf.kPDF_RED, pdf.kPDF_BLACK, pdf.kcsDeviceRGB, "Test app", "Line Annotations", "This is a line annotation")
		  y = y + 20.0 
		  call pdf.LineAnnot(50.0, y, 350.0, y, 1.0, pdf.kleClosedArrow,  pdf.kleClosedArrow, pdf.kPDF_RED, pdf.kPDF_BLACK, pdf.kcsDeviceRGB, "Test app", "Line Annotations", "This is a line annotation")
		  y = y + 20.0 
		  call pdf.LineAnnot(50.0, y, 350.0, y, 1.0, pdf.kleRClosedArrow, pdf.kleRClosedArrow, pdf.kPDF_RED, pdf.kPDF_BLACK, pdf.kcsDeviceRGB, "Test app", "Line Annotations", "This is a line annotation")
		  y = y + 20.0
		  call pdf.LineAnnot(50.0, y, 350.0, y, 1.0, pdf.kleDiamond,      pdf.kleDiamond, pdf.kPDF_RED, pdf.kPDF_BLACK, pdf.kcsDeviceRGB, "Test app", "Line Annotations", "This is a line annotation")
		  y = y + 20.0 
		  call pdf.LineAnnot(50.0, y, 350.0, y, 1.0, pdf.kleOpenArrow,    pdf.kleOpenArrow, pdf.kPDF_RED, pdf.kPDF_BLACK, pdf.kcsDeviceRGB, "Test app", "Line Annotations", "This is a line annotation")
		  y = y + 20.0 
		  call pdf.LineAnnot(50.0, y, 350.0, y, 1.0, pdf.kleROpenArrow,   pdf.kleROpenArrow, pdf.kPDF_RED, pdf.kPDF_BLACK, pdf.kcsDeviceRGB, "Test app", "Line Annotations", "This is a line annotation")
		  y = y + 20.0 
		  call pdf.LineAnnot(50.0, y, 350.0, y, 1.0, pdf.kleSlash,        pdf.kleSlash, pdf.kPDF_RED, pdf.kPDF_BLACK, pdf.kcsDeviceRGB, "Test app", "Line Annotations", "This is a line annotation")
		  y = y + 20.0 
		  call pdf.LineAnnot(50.0, y, 350.0, y, 1.0, pdf.kleSquare,       pdf.kleSquare, pdf.kPDF_RED, pdf.kPDF_BLACK, pdf.kcsDeviceRGB, "Test app", "Line Annotations", "This is a line annotation")
		  
		  call pdf.EndPage
		  
		  call pdf.Append
		  
		  dim points() as DynapdfPointMBS
		  points.Append new DynapdfPointMBS(50.0, 200.0)
		  points.Append new DynapdfPointMBS(50.0, 100.0)
		  points.Append new DynapdfPointMBS(150.0, 50.0)
		  points.Append new DynapdfPointMBS(250.0, 100.0)
		  points.Append new DynapdfPointMBS(250.0, 200.0)
		  dim count as integer = points.Ubound + 1
		  
		  call pdf.PolyLineAnnot(points, 1.0, pdf.kleDiamond, pdf.kleCircle, pdf.kPDF_WHITE, pdf.kPDF_RED, pdf.kcsDeviceRGB, "Test app", "Polyline Annotations", "This is a polyline annotation")
		  
		  for i as integer = 0 to points.Ubound
		    points(i).x = points(i).x + 250.0
		  next
		  
		  call pdf.PolygonAnnot(points, 1.0, pdf.kPDF_CREAM, pdf.kPDF_RED, pdf.kcsDeviceRGB, "Test app", "Polygon Annotations", "This is a polygon annotation")
		  
		  for i as integer = 0 to points.Ubound
		    points(i).x = points(i).x - 250.0
		    points(i).y = points(i).x + 230.0
		  next
		  
		  y = 230.0
		  call pdf.SetFont("Helvetica", pdf.kfsRegular, 12.0, false, pdf.kcp1252)
		  call pdf.WriteFTextEx(50.0, y, pdf.GetPageWidth - 100.0, -1.0, pdf.ktaLeft, "The points of an Ink Annotation will be approximated with bezier curves." +_
		  "The result is a smooth path. A polyline annotation is almost the same annotation type without the approximation with bezier curves.")
		  
		  call pdf.InkAnnot(points, 1.0, pdf.kPDF_BLUE, pdf.kcsDeviceRGB, "Test app", "Ink Annotations", "This is an ink annotation")
		  
		  y = y + 230.0
		  call pdf.WriteText(50.0, y, "Stamp Annotations:")
		  y = y + 20.0
		  call pdf.WriteFTextEx(50.0, y, pdf.GetPageWidth - 100.0, -1.0, pdf.ktaLeft, "The default color of a stamp annotation can be changed with SetAnnotColor(). The border or text color must be set.")
		  
		  y = pdf.GetPageHeight - pdf.GetLastTextPosY + 10.0
		  call pdf.StampAnnot(pdf.krsApproved,             50.0, y, 150.0, 50.0, "Test app", "Stamp Annotations", "This is a stamp annotation")
		  call pdf.StampAnnot(pdf.krsAsIs,                220.0, y, 150.0, 50.0, "Test app", "Stamp Annotations", "This is a stamp annotation")
		  call pdf.StampAnnot(pdf.krsConfidential,        390.0, y, 150.0, 50.0, "Test app", "Stamp Annotations", "This is a stamp annotation")
		  
		  y = y + 60.0
		  call pdf.StampAnnot(pdf.krsDepartmental,         50.0, y, 150.0, 50.0, "Test app", "Stamp Annotations", "This is a stamp annotation")
		  call pdf.StampAnnot(pdf.krsDraft,               220.0, y, 150.0, 50.0, "Test app", "Stamp Annotations", "This is a stamp annotation")
		  call pdf.StampAnnot(pdf.krsExperimental,        390.0, y, 150.0, 50.0, "Test app", "Stamp Annotations", "This is a stamp annotation")
		  
		  y = y + 60.0
		  call pdf.StampAnnot(pdf.krsExpired,              50.0, y, 150.0, 50.0, "Test app", "Stamp Annotations", "This is a stamp annotation")
		  a = pdf.StampAnnot(pdf.krsFinal,            220.0, y, 150.0, 50.0, "Test app", "Stamp Annotations", "This is a stamp annotation")
		  call pdf.SetAnnotColor(a, pdf.kfcBorderColor, pdf.kcsDeviceRGB, PDF.RGB(170, 10, 160))
		  call pdf.StampAnnot(pdf.krsForComment,          390.0, y, 150.0, 50.0, "Test app", "Stamp Annotations", "This is a stamp annotation")
		  
		  y = y + 60.0
		  call pdf.StampAnnot(pdf.krsForPublicRelease,     50.0, y, 150.0, 50.0, "Test app", "Stamp Annotations", "This is a stamp annotation")
		  call pdf.StampAnnot(pdf.krsNotApproved,         220.0, y, 150.0, 50.0, "Test app", "Stamp Annotations", "This is a stamp annotation")
		  call pdf.StampAnnot(pdf.krsNotForPublicRelease, 390.0, y, 150.0, 50.0, "Test app", "Stamp Annotations", "This is a stamp annotation")
		  
		  y = y + 60.0
		  call pdf.StampAnnot(pdf.krsSold,                 50.0, y, 150.0, 50.0, "Test app", "Stamp Annotations", "This is a stamp annotation")
		  call pdf.StampAnnot(pdf.krsTopSecret,           220.0, y, 150.0, 50.0, "Test app", "Stamp Annotations", "This is a stamp annotation")
		  
		  
		  
		  call pdf.EndPage
		  
		  call pdf.CloseFile
		  
		  f.Launch
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddHighlightAnnot(pdf as DynaPDFMBS, Type as Integer, ColorValue as UInt32, x as Double, y as Double, Text as string, subject as string, comment as string)
		  dim w as Double = pdf.GetTextWidth(text)
		  
		  call pdf.WriteText x, y, text
		  call pdf.HighlightAnnot(type, x, y + pdf.GetDescent, w, 20.0, ColorValue, "Test app", Subject, Comment)
		  
		  
		End Sub
	#tag EndMethod

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
