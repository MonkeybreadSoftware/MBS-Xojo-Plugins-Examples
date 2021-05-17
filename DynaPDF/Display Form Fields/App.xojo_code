#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  dim f as integer
		  
		  // Error messages and warnings are passed to the callback function.
		  
		  pdf.SetLicenseKey "Lite" // For this example you can use a Lite, Pro or Enterprise License
		  
		  dim file as FolderItem = SpecialFolder.Desktop.Child("A-1.pdf")
		  
		  call pdf.CreateNewPDF(nil)
		  call pdf.OpenImportFile(file)
		  call pdf.ImportPDFFile( 1, 1.0, 1.0)
		  
		  // check what fields are there and show in listbox:
		  
		  dim list as listbox = MainWindow.List
		  
		  dim PageDic as new Dictionary
		  dim PageCount as integer = pdf.GetPageCount
		  for PageIndex as integer = 1 to PageCount
		    dim page as new Page
		    page.Page = PageIndex
		    
		    PageDic.Value(PageIndex) = page
		    
		    List.addFolder str(pageIndex)
		    List.RowTag(List.LastIndex) = page
		    
		  next
		  
		  dim lostFields as new page
		  
		  dim FieldCount as integer = pdf.GetFieldCount-1
		  for FieldIndex as integer = 0 to FieldCount
		    
		    dim field as new Field
		    
		    field.index = FieldIndex
		    field.Info = pdf.GetFieldex(FieldIndex)
		    field.name = pdf.GetFieldName(FieldIndex)
		    field.type = pdf.GetFieldType(FieldIndex)
		    
		    dim PageNum as integer = field.Info.PageNum
		    if PageNum>0 then
		      dim page as page = PageDic.Value(PageNum)
		      page.Fields.Append field
		    else
		      lostFields.Fields.Append field
		    end if
		    
		    field.ExpValCount = pdf.GetFieldExpValCount(FieldIndex)
		    field.ExpValue = pdf.GetFieldExpValue(FieldIndex)
		    for i as integer = 0 to field.ExpValCount-1
		      
		    next
		  next
		  
		  List.addFolder "Fields without page"
		  List.RowTag(List.LastIndex) = lostFields
		  
		  call pdf.CloseFile
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
