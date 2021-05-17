#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // read redirects
		  ReadRedirects
		  
		  
		  dim pdf as new MyDynapdfMBS
		  dim f as FolderItem = SpecialFolder.Desktop.Child("REAL Studio Documentation Wiki Snapshot.pdf")
		  
		  
		  'pdf.SetLicenseKey "enter your serial number here" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF f
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo output"
		  
		  ReadFiles
		  SortFiles
		  
		  // add title page
		  dim TitleFile as folderitem = SpecialFolder.Desktop.Child("title.pdf")
		  
		  if TitleFile.Exists then
		    call pdf.OpenImportFile(TitleFile, 0, "")
		    call pdf.ImportPDFFile(1, 1.0, 1.0)
		    call pdf.CloseImportFile
		  end if
		  
		  // add all pages
		  dim d as new StringToStringHashMapMBS
		  
		  dim u as integer = UBound(files)
		  for i as integer = 0 to u
		    dim file as FolderItem = files(i)
		    
		    dim n as integer = pdf.GetPageCount+1
		    
		    call pdf.OpenImportFile(file, 0, "")
		    call pdf.ImportPDFFile(n, 1.0, 1.0)
		    call pdf.CloseImportFile
		    
		    d.value(urls(i))=str(n)
		  next
		  
		  System.DebugLog "GetPageCount: "+str(pdf.GetPageCount)
		  System.DebugLog "GetAnnotCount: "+str(pdf.GetAnnotCount)
		  
		  // build list of annotations
		  dim ac as integer = pdf.GetAnnotCount-1
		  dim Annots(-1) as annot
		  
		  for i as integer = 0 to ac
		    dim a as DynaPDFAnnotationExMBS = pdf.GetAnnotEx(i)
		    dim x as new Annot
		    
		    x.page = a.PageNum
		    x.BBOX = a.BBox
		    x.URL = a.DestFile
		    x.handle = i
		    
		    annots.Append x
		    
		    if a.PageNum = 1 then
		      System.DebugLog x.URL
		    end if
		  next
		  
		  // apply redirections
		  dim ur as integer = UBound(redirectFrom)
		  for ir as integer = 0 to ur
		    dim l as string = "http://docs.realsoftware.com/index.php/"+redirectFrom(ir)
		    dim r as string = "http://docs.realsoftware.com/index.php/"+redirectTo(ir)
		    
		    if l<>"http://docs.realsoftware.com/index.php/Not_equal" then
		      dim destpageR as integer = val(d.Lookup(r, "0"))
		      dim destpageL as integer = val(d.Lookup(l, "0"))
		      if destpageR>0 then
		        d.value(l)=str(destpageR)
		      else
		        System.DebugLog "Missing page for "+r
		        'break
		      end if
		    end if
		  next
		  
		  // links to wiki should stay there
		  dim it as StringToStringHashMapIteratorMBS = d.find("http://docs.realsoftware.com/index.php/Main_Page")
		  if it.isEqual(d.last) = false then
		    d.Remove it
		  end if
		  
		  // now fix links
		  for each a as Annot in annots
		    
		    dim url as string = NthField(a.URL, "#", 1)
		    dim after as string = NthField(a.URL, "#", 2)
		    
		    dim destpage as integer = val(d.Lookup(URL, "0"))
		    
		    if destpage>0 then
		      dim h as Double = abs(a.BBOX.top-a.BBOX.Bottom)
		      call pdf.DeleteAnnotation(a.handle)
		      call pdf.EditPage(a.page)
		      call pdf.PageLink(a.BBOX.Left, a.BBOX.top-h, a.BBOX.Right-a.BBOX.Left, h, destpage)
		      call pdf.EndPage
		    else
		      System.DebugLog "Missing page for "+URL
		      'break
		    end if
		  next
		  
		  call pdf.CloseFile
		  pdf = nil
		  
		  f.Launch
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ReadFiles()
		  dim folder as FolderItem = SpecialFolder.Desktop.Child("pdf files")
		  
		  
		  
		  dim c as integer = folder.count
		  
		  for i as integer = 1 to c
		    dim file as FolderItem = folder.TrueItem(i)
		    
		    if file<>nil and right(file.name,4)=".pdf" then
		      dim tname as string = left(file.name, len(file.name)-4)+".txt"
		      dim tfile as FolderItem = file.parent.Child(tname)
		      if tfile<>nil and tfile.Exists then
		        dim t as TextInputStream = tfile.OpenAsTextFile
		        
		        if t = nil then
		          t = tfile.OpenAsTextFile
		        end if
		        
		        if t<>Nil then
		          dim url as string = t.ReadLine(encodings.UTF8)
		          
		          urls.Append url
		          files.Append file
		        end if
		      end if
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReadRedirects()
		  // Read duplicates list to avoid duplicates in PDFs
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("redirect")
		  dim t as TextInputStream = f.OpenAsTextFile
		  
		  if t = nil then Return
		  
		  dim tab as string = encodings.ASCII.Chr(9)
		  
		  while not t.EOF
		    dim line as string = t.ReadLine(encodings.ASCII)
		    
		    dim l as string = NthField(line, tab, 1)
		    dim r as string = NthField(line, tab, 2)
		    
		    if len(r)>0 then
		      redirectFrom.Append l
		      redirectto.Append r
		      
		    end if
		    
		  wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SortFiles()
		  // sort by URL
		  urls.SortWith(files)
		  
		  // sort category pages to the front
		  dim u as integer = UBound(urls)
		  for i as integer = 0 to u
		    const k = "http://docs.realsoftware.com/index.php/Category"
		    if left(urls(i),len(k)) = k then
		      dim url as string = urls(i)
		      dim file as FolderItem = files(i)
		      
		      files.Remove i
		      urls.Remove i
		      
		      files.Insert 0, file
		      urls.Insert 0, url
		      
		    end if
		  next
		  
		  
		  // sort main page to the front
		  for i as integer = 0 to u
		    if urls(i) = "http://docs.realsoftware.com/index.php/UsersGuide:Main" then
		      dim url as string = urls(i)
		      dim file as FolderItem = files(i)
		      
		      files.Remove i
		      urls.Remove i
		      
		      files.Insert 0, file
		      urls.Insert 0, url
		      
		      exit
		    end if
		  next
		  
		  
		  // sort main page to the front
		  for i as integer = 0 to u
		    if urls(i) = "http://docs.realsoftware.com/index.php/Main_Page" then
		      dim url as string = urls(i)
		      dim file as FolderItem = files(i)
		      
		      files.Remove i
		      urls.Remove i
		      
		      files.Insert 0, file
		      urls.Insert 0, url
		      
		      exit
		    end if
		  next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		files(-1) As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		redirectFrom(-1) As string
	#tag EndProperty

	#tag Property, Flags = &h0
		redirectTo(-1) As string
	#tag EndProperty

	#tag Property, Flags = &h0
		URLs(-1) As string
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
