#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim MyPDF as New MyDynapdfMBS
		  
		  mypdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  Dim TestPicture as New Picture( 128 , 128 , 32 )
		  
		  // fill with black which will be transparent later
		  TestPicture.Graphics.ForeColor=&c000000
		  TestPicture.Graphics.FillRect 0,0,TestPicture.Width, TestPicture.Height
		  
		  // draw some red:
		  TestPicture.Graphics.ForeColor=&cFF0000
		  TestPicture.Graphics.FillRect 30,30,50,50
		  
		  
		  Dim PDFfolderItem As FolderItem = SpecialFolder.Desktop.Child( "DynaPDF Transparency Color Test.pdf" )
		  
		  call MyPDF.CreateNewPDF PDFfolderItem
		  call MyPDF.SetDocInfo MyPDF.kdiSubject, "testing transparency color"
		  call MyPDF.SetDocInfo MyPDF.kdiProducer, "Xojo test application"
		  call MyPDF.SetDocInfo MyPDF.kdiTitle, "Why Is the Black Still Here?"
		  call MyPDF.SetPageWidth 256
		  call MyPDF.SetPageHeight 256
		  
		  call MyPDF.SetPDFVersion( 3 )
		  call MyPDF.SetPageLayout( 0 )
		  call MyPDF.SetPageMode( 0 )
		  
		  Call MyPDF.SetColorSpace( 0 )   'RGB
		  call MyPDF.Append
		  
		  // you can uncomment the following line to see the difference:
		  Call MyPDF.SetTransparentColor( &h000000 ) ' black transparent
		  call MyPDF.SetCompressionFilter(MyPDF.kcfFlate) // no compression
		  Call MyPDF.InsertPicture( TestPicture , 64 , 64 , 128 , 128 )
		  Call MyPDF.SetUseTransparency( FALSE )
		  
		  call MyPDF.CloseImportFile
		  
		  call MyPDF.EndPage
		  
		  Call MyPDF.CloseFile
		  
		  PDFfolderItem.Launch
		  
		  Quit
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
