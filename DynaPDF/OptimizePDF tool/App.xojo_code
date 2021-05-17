#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  // This is a command line tool to optimize PDFs automatically
		  
		  if UBound(args) < 2 then
		    print "OptimizePDF InputFile OutputFile"
		    Return 2
		  end if
		  
		  dim InputPath  as string = args(1)
		  dim OutputPath as string = args(2)
		  
		  #if RBVersion < 2013 then
		    dim InputFile  as FolderItem = GetFolderItem(InputPath,  FolderItem.PathTypeShell)
		    dim OutputFile as FolderItem = GetFolderItem(OutputPath, FolderItem.PathTypeShell)
		  #else
		    dim InputFile  as FolderItem = GetFolderItem(InputPath,  FolderItem.PathTypeNative)
		    dim OutputFile as FolderItem = GetFolderItem(OutputPath, FolderItem.PathTypeNative)
		  #endif
		  
		  if InputFile = nil then
		    print "Invalid file path: "+InputPath
		    Return 3
		  end if
		  
		  if Process(inputFile, outputFile) then
		    Return 0
		  else
		    Return 1
		  end if
		  
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  print CurrentMethodName
		  print Introspection.GetType(error).fullname
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Process(InputFile as FolderItem, OutputFile as FolderItem) As Boolean
		  
		  dim pdf as new MyDynapdfMBS
		  
		  // pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  call pdf.CreateNewPDF nil
		  
		  /// If the imported document should be edited then avoid
		  // the conversion of pages to templates (see SetImportFlags()
		  // for further information).
		  call pdf.SetImportFlags(bitwiseOr(pdf.kifImportAll, pdf.kifImportAsPage))
		  
		  // import and remove duplicates in images, colorspaces, templates and pattern
		  // The flag if2UseProxy reduces the memory usage. The duplicate check is optional but recommended.
		  
		  call pdf.SetImportFlags2(bitwiseOr(pdf.kif2UseProxy, pdf.kif2DuplicateCheck))
		  
		  // Import the PDF file so that it can be edited
		  if pdf.OpenImportFile(InputFile) < 0 then
		    Return false
		  end if
		  
		  dim pageCount as integer = pdf.ImportPDFFile(1, 1.0, 1.0) // If DestPage is 1, the return value is the new number of pages
		  
		  if pageCount <= 0 then
		    Return false
		  end if
		  
		  call pdf.CloseImportFile
		  
		  // It is not allowed to call this function twice for the same document in memory!
		  // In addition, we can either optimize the entire PDF file or nothing.
		  
		  // Note that this function requires the DynaPDF Pro.
		  dim flags as integer = Bitwise.BitOr(_
		  pdf.kofInMemory, _ // Optimize the file fully in memory. Only useful for small PDF files.
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
		  
		  
		  dim o as new DynaPDFOptimizeParamsMBS
		  
		  o.MinColorRes = 100 // scale images with more than 100 dpi
		  o.ResColorImages = 150 // down to 150 dpi
		  
		  if not pdf.Optimize(flags, o)  then
		    Return false
		  end if
		  
		  if not pdf.OpenOutputFile(OutputFile) then
		    Return false
		  end if
		  
		  call pdf.CloseFile
		  
		  dim InputLen as integer = InputFile.length
		  dim OutputLen as integer = OutputFile.Length
		  
		  print str(InputLen,"0")+" before, "+str(OutputLen, "0")+" after, "+str(InputLen - OutputLen, "0")+ " saved."
		  
		  Return true
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
