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
		  
		  dim pdf as new MyDynapdfMBS
		  pdf.SetLicenseKey "Lite" // For this example you can use a Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF OutputFile
		  
		  /// If the imported document should be edited then avoid
		  // the conversion of pages to templates (see SetImportFlags()
		  // for further information).
		  call pdf.SetImportFlags(bitwiseOr(pdf.kifImportAll,pdf.kifImportAsPage))
		  
		  // Import the PDF file so that it can be edited
		  call pdf.OpenImportFile(InputFile,pdf.kptOpen,"")
		  
		  dim iAuthor as string
		  if pdf.GetInDocInfo(pdf.kdiAuthor, iAuthor)>0 then
		    MetadataWindow.iAuthor.text = iAuthor
		  end if
		  
		  dim iCreator as string
		  if pdf.GetInDocInfo(pdf.kdiCreator, iCreator)>0 then
		    MetadataWindow.iCreator.text = iCreator
		  end if
		  
		  dim iCompany as string
		  if pdf.GetInDocInfo(pdf.kdiCompany, iCompany)>0 then
		    MetadataWindow.iCompany.text = iCompany
		  end if
		  
		  dim iKeywords as string
		  if pdf.GetInDocInfo(pdf.kdiKeywords, iKeywords)>0 then
		    MetadataWindow.iKeywords.text = iKeywords
		  end if
		  
		  dim iProducer as string
		  if pdf.GetInDocInfo(pdf.kdiProducer, iProducer)>0 then
		    MetadataWindow.iProducer.text = iProducer
		  end if
		  
		  dim iSubject as string
		  if pdf.GetInDocInfo(pdf.kdiSubject, iSubject)>0 then
		    MetadataWindow.iSubject.text = iSubject
		  end if
		  
		  dim iTitle as string
		  if pdf.GetInDocInfo(pdf.kdiTitle, iTitle)>0 then
		    MetadataWindow.iTitle.text = iTitle
		  end if
		  
		  MetadataWindow.ShowModal
		  if MetadataWindow.ok = false then
		    Return
		  end if
		  
		  iAuthor = MetadataWindow.iAuthor.text
		  if len(iAuthor)>0 then
		    call pdf.SetDocInfo pdf.kdiAuthor, iAuthor
		  end if
		  
		  iCreator = MetadataWindow.iCreator.text
		  if len(iCreator)>0 then
		    call pdf.SetDocInfo pdf.kdiCreator, iCreator
		  end if
		  
		  iCompany = MetadataWindow.iCompany.text
		  if len(iCompany)>0 then
		    call pdf.SetDocInfo pdf.kdiCompany, iCompany
		  end if
		  
		  iTitle = MetadataWindow.iTitle.text
		  if len(iTitle)>0 then
		    call pdf.SetDocInfo pdf.kdiTitle, iTitle
		  end if
		  
		  iKeywords = MetadataWindow.iKeywords.text
		  if len(iKeywords)>0 then
		    call pdf.SetDocInfo pdf.kdiKeywords, iKeywords
		  end if
		  
		  iProducer = MetadataWindow.iProducer.text
		  if len(iProducer)>0 then
		    call pdf.SetDocInfo pdf.kdiProducer, iProducer
		  end if
		  
		  iTitle = MetadataWindow.iTitle.text
		  if len(iTitle)>0 then
		    call pdf.SetDocInfo pdf.kdiTitle, iTitle
		  end if
		  
		  dim pageCount as integer = pdf.ImportPDFFile(1, 1.0, 1.0) // If DestPage is 1, the return value is the new number of pages
		  
		  call pdf.CloseImportFile
		  
		  call pdf.CloseFile
		  
		  MetadataWindow.Close
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
