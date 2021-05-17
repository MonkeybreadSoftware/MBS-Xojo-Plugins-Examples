#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Dim d As New DynapdfMBS
		  dim file as FolderItem
		  
		  d.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  file=SpecialFolder.Desktop.Child("Create PDF with Barcodes.pdf")
		  
		  call d.CreateNewPDF file
		  call d.Append
		  
		  
		  
		  // UPCA
		  Dim b1 As New DynaPDFBarcode2MBS
		  b1.BarcodeType = b1.kbctUPCA
		  b1.Data = "72527270270"
		  
		  Call d.InsertBarcode(100, 100, 200, 50, d.kcoLeft, d.kcoTop, b1)
		  
		  
		  
		  // UPCA
		  Dim b2 As New DynaPDFBarcode2MBS
		  b2.BarcodeType = b1.kbctUPCA
		  b2.Data = "72527270270+12345"
		  
		  Call d.InsertBarcode(100, 200, 200, 50, d.kcoLeft, d.kcoTop, b2)
		  
		  
		  
		  // UPCE
		  Dim b3 As New DynaPDFBarcode2MBS
		  b3.BarcodeType = b1.kbctUPCE
		  b3.Data = "1123456"
		  
		  Call d.InsertBarcode(100, 300, 200, 50, d.kcoLeft, d.kcoTop, b3)
		  
		  
		  
		  // EANX
		  Dim b4 As New DynaPDFBarcode2MBS
		  b4.BarcodeType = b1.kbctEANX
		  b4.Data = "54321"
		  
		  Call d.InsertBarcode(100, 400, 200, 50, d.kcoLeft, d.kcoTop, b4)
		  
		  
		  
		  // EANX
		  Dim b5 As New DynaPDFBarcode2MBS
		  b5.BarcodeType = b1.kbctEANX
		  b5.Data = "7432365+54321"
		  
		  Call d.InsertBarcode(100, 500, 200, 50, d.kcoLeft, d.kcoTop, b5)
		  
		  
		  
		  // CODE39
		  Dim b6 As New DynaPDFBarcode2MBS
		  b6.BarcodeType = b6.kbctCode39
		  b6.Data = "CODE39"
		  
		  Call d.InsertBarcode(100, 600, 200, 50, d.kcoLeft, d.kcoTop, b6)
		  
		  
		  
		  
		  // PDF417
		  Dim b7 As New DynaPDFBarcode2MBS
		  b7.BarcodeType = b1.kbctPDF417
		  b7.Data = "Hello World, Just a test. 123"
		  
		  Call d.InsertBarcode(300, 100, 200, 50, d.kcoLeft, d.kcoTop, b7)
		  
		  
		  
		  // DataMatrix
		  Dim b8 As New DynaPDFBarcode2MBS
		  b8.BarcodeType = b1.kbctDataMatrix
		  b8.Data = "Hello World"
		  
		  Call d.InsertBarcode(300, 200, 200, 50, d.kcoLeft, d.kcoTop, b8)
		  
		  
		  
		  // QRCode
		  Dim b9 As New DynaPDFBarcode2MBS
		  b9.BarcodeType = b1.kbctQRCode
		  b9.Data = "Hello World"
		  
		  Call d.InsertBarcode(300, 300, 200, 50, d.kcoLeft, d.kcoTop, b9)
		  
		  
		  
		  // QRCode
		  Dim b10 As New DynaPDFBarcode2MBS
		  b10.BarcodeType = b1.kbctQRCode
		  b10.Data = "Hello World, Just a test. 123"
		  // Option1 for QRCode is the ECC Level with values from 1 = low, 2 = middle, 3 = better, 4 high. Default is low.
		  b10.Option1 = 4
		  
		  Call d.InsertBarcode(300, 400, 200, 50, d.kcoLeft, d.kcoTop, b10)
		  
		  
		  
		  // EAN128
		  Dim b11 As New DynaPDFBarcode2MBS
		  b11.BarcodeType = b1.kbctEAN128
		  b11.Data = "[00]993262210000005384"
		  b11.BorderWidth = 5 // with border around
		  b11.Options = b11.kbcoBox
		  b11.FgColor = d.RGB(100, 0, 0)
		  
		  Call d.InsertBarcode(300, 500, 200, 50, d.kcoLeft, d.kcoTop, b11)
		  
		  
		  
		  // OneCode USPS
		  Dim b12 As New DynaPDFBarcode2MBS
		  b12.BarcodeType = b1.kbctUSPSOneCode
		  b12.Data = "01234567094987654321-012345678"
		  
		  Call d.InsertBarcode(300, 600, 200, 50, d.kcoLeft, d.kcoTop, b12)
		  
		  
		  
		  
		  
		  
		  call d.EndPage
		  call d.CloseFile
		  
		  file.Launch
		  
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
