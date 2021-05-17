#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim o as Object2d = CreateObjects
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with object2d.pdf")
		  
		  call pdf.CreateNewPDF f
		  call pdf.SetViewerPreferences pdf.kvpDisplayDocTitle,pdf.kavNone
		  call pdf.SetDocInfo pdf.kdiAuthor, "Christian Schmitz"
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo output"
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  pdf.drawObject o, pdf.GetPageWidth/2, pdf.GetPageHeight/2
		  
		  call pdf.EndPage
		  
		  call pdf.CloseFile
		  
		  f.Launch
		  
		  MainWindow.o=o
		  MainWindow.show
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function CreateObjects() As Object2d
		  Dim px as PixmapShape
		  Dim s as StringShape
		  Dim d as New Group2D
		  
		  const pi = 3.14159265
		  
		  px=New PixmapShape(logombs(100))
		  d.append px
		  
		  s=New StringShape
		  s.y=70
		  s.Text="You see the MBS Logo!"
		  s.TextFont="Helvetica"
		  s.Bold=true
		  d.append s
		  
		  s=New StringShape
		  s.y=120
		  s.Rotation = pi/2.0
		  s.Text="Rotated Text"
		  s.TextFont="Helvetica"
		  s.Bold=true
		  d.append s
		  
		  
		  Dim r as New RectShape
		  r.X=150
		  r.width=75
		  r.height=75
		  r.border=100
		  r.bordercolor=RGB(0,0,0) //black
		  r.fillcolor=RGB(0,127,127) // teal
		  r.borderwidth=2.5
		  r.rotation=-.78
		  d.append r
		  
		  Dim o as New OvalShape
		  o.width=60
		  o.height=60
		  o.Fillcolor=RGB(127,127,255)
		  o.x=-150
		  d.Append o
		  
		  
		  // mitte
		  r=New RectShape
		  r.X=0
		  r.width=10
		  r.height=10
		  r.border=100
		  r.borderwidth=0
		  r.rotation=0
		  d.append r
		  
		  // rechts
		  r=New RectShape
		  r.X=100
		  r.width=10
		  r.height=10
		  r.border=100
		  r.borderwidth=0
		  r.FillColor=&cFF0000
		  r.rotation=0
		  d.append r
		  
		  // links
		  r=New RectShape
		  r.X=-100
		  r.width=10
		  r.height=10
		  r.border=100
		  r.borderwidth=0
		  r.FillColor=&c0000FF
		  r.rotation=0
		  d.append r
		  
		  // unten
		  r=New RectShape
		  r.Y=100
		  r.width=10
		  r.height=10
		  r.FillColor=&c00FF00
		  r.border=100
		  r.borderwidth=0
		  r.rotation=0
		  d.append r
		  
		  // oben
		  r=New RectShape
		  r.Y=-100
		  r.width=10
		  r.height=10
		  r.border=100
		  r.borderwidth=0
		  r.rotation=0
		  d.append r
		  
		  
		  Return d
		  
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
