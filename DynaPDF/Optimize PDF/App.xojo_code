#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub NewDocument()
		  dim f as FolderItem = GetOpenFolderItem(FileTypes.Pdf)
		  
		  if f<>nil then
		    OpenDocument f
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub OpenDocument(item As FolderItem)
		  process item
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Process(InputFile as FolderItem)
		  if InputFile = nil then Return
		  
		  dim OutputFile as FolderItem = GetSaveFolderItem(FileTypes.Pdf, InputFile.name)
		  if OutputFile = nil then Return
		  
		  Dim pdf As New MyDynapdfMBS
		  'pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  call pdf.CreateNewPDF OutputFile
		  
		  /// If the imported document should be edited then avoid
		  // the conversion of pages to templates (see SetImportFlags()
		  // for further information).
		  call pdf.SetImportFlags(bitwiseOr(pdf.kifImportAll, pdf.kifImportAsPage))
		  
		  // import and remove duplicates in images, colorspaces, templates and pattern
		  // The flag if2UseProxy reduces the memory usage. The duplicate check is optional but recommended.
		  
		  call pdf.SetImportFlags2(bitwiseOr(pdf.kif2UseProxy, pdf.kif2DuplicateCheck))
		  
		  // Import the PDF file so that it can be edited
		  call pdf.OpenImportFile(InputFile)
		  
		  dim pageCount as integer = pdf.ImportPDFFile(1, 1.0, 1.0) // If DestPage is 1, the return value is the new number of pages
		  
		  call pdf.CloseImportFile
		  
		  // It is not allowed to call this function twice for the same document in memory!
		  // In addition, we can either optimize the entire PDF file or nothing.
		  
		  // Note that this function requires the DynaPDF Pro.
		  dim flags as integer = Bitwise.BitOr(_
		  pdf.kofInMemory, _ // Optimize the file fully in memory. Only useful for small PDF files.
		  pdf.kofScaleImages, _ // Scale images as specified in the DynaPDFOptimizeParamsMBS class.
		  pdf.kofNewLinkNames, _ // If set, rename all object links to short names like F1, F2 etc.
		  pdf.kofDeleteInvPaths, _ // Delete invisible paths.
		  pdf.kofDeletePrivateData, _ // Delete private data objects from pages, templates, and images.
		  pdf.kofIgnoreZeroLineWidth, _
		  pdf.kofDeleteAlternateImages, _ // If set, alternate images will be deleted.
		  pdf.kofDeleteThumbnails) // Thumbnails can be deleted since PDF viewers can create thumbnails easily on demand.
		  
		  
		  // pdf.kofInMemory          // Optimize the file fully in memory. Only useful for small PDF files.
		  // pdf.kofConvertAllColors  // If set, Separation, DeviceN, and NChannel color spaces will be converted to the device space.
		  // pdf.kofIgnoreICCBased    // If set, ICCBased color spaces will be left unchanged.
		  // pdf.kofScaleImages       // Scale all images 
		  // pdf.kofNewLinkNames      // If set, rename all object links to short names like F1, F2 etc.
		  // pdf.kofDeleteInvPaths    // Delete invisible paths. An invisible path is a path that was finished with the no-op operator "n".
		  
		  
		  Dim o As New DynaPDFOptimizeParamsMBS
		  
		  o.MinColorRes = 100 // scale images with more than 100 dpi
		  o.ResColorImages = 150 // down to 150 dpi
		  
		  call pdf.Optimize(flags, o) 
		  
		  call pdf.CloseFile
		  
		  dim InputLen as integer = InputFile.length
		  dim OutputLen as integer = OutputFile.Length
		  
		  MsgBox str(InputLen,"0")+" before, "+str(OutputLen, "0")+" after, "+str(InputLen - OutputLen, "0")+ " saved."
		  quit
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
