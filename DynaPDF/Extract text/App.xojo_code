#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // This example shows you what the raw text in a PDF is.
		  // for getting the text nice, please use Text extraction.rbp
		  
		  dim pdf as new MyDynapdfMBS
		  dim f as FolderItem
		  dim s as DynaPDFStackMBS
		  dim i,c,ImportFlags as integer
		  dim list as listbox
		  dim text,texts(-1) as string
		  
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  'pdf.SetLicenseKey "Lite"
		  
		  call pdf.CreateNewPDF(nil)
		  call pdf.Append
		  call pdf.SetPageCoords(pdf.kpcBottomUp)
		  
		  ImportFlags=BitwiseOr(pdf.kifContentOnly, pdf.kifImportAsPage)
		  call pdf.SetImportFlags(ImportFlags)
		  
		  f=FindFile("dynapdf_help.pdf")
		  
		  If f=Nil Or f.Exists=False Then
		    MsgBox "Please change code to point to a pdf file."
		    quit
		  end if
		  
		  if pdf.OpenImportFile(f, pdf.kptOpen, "")<>0 then
		    MsgBox "error loading pdf"
		    quit
		  End If
		  
		  // Lite only
		  'Call pdf.ImportPDFFile(1)
		  'Call pdf.EditPage(1)
		  
		  // Pro only to import single page
		  Call pdf.ImportPDFPage(1)
		  
		  // needs Pro license, but you can use ImportPDFFile instead of you only have Lite license.
		  
		  list=OutputWindow.List
		  
		  call pdf.InitStack(s)
		  
		  while pdf.GetPageText(s)
		    c=s.KerningCount-1
		    for i=0 to c
		      text=s.KerningText(i)
		      if len(text)=1 and asc(text)=0 then
		        text=" " // empty space between words
		      end if
		      
		      list.AddRow text
		      list.Cell(list.LastIndex,1)=str(s.KerningLength(i))
		      list.Cell(list.LastIndex,2)=str(s.KerningAdvance(i))
		      list.Cell(list.LastIndex,3)=str(s.KerningWidth(i))
		      
		      dim ctm as DynapdfMatrixMBS = s.ctm
		      dim tm as DynapdfMatrixMBS = s.tm
		      dim m as DynapdfMatrixMBS = MulMatrix(ctm, tm)
		      
		      dim x as Double = 0.0
		      dim y as Double = 0.0
		      
		      Transform m,x,y
		      
		      list.Cell(list.LastIndex,4)=str(round(x)) // we round for display
		      list.Cell(list.LastIndex,5)=str(round(y))
		      
		      texts.Append text
		    next
		  wend
		  
		  OutputWindow.EditField1.text=Join(texts,"")
		End Sub
	#tag EndEvent


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

	#tag Method, Flags = &h0
		Function MulMatrix(m1 as DynapdfMatrixMBS, m2 as DynapdfMatrixMBS) As DynapdfMatrixMBS
		  dim retval as new DynapdfMatrixMBS
		  
		  retval.a = M2.a * M1.a + M2.b * M1.c
		  retval.b = M2.a * M1.b + M2.b * M1.d
		  retval.c = M2.c * M1.a + M2.d * M1.c
		  retval.d = M2.c * M1.b + M2.d * M1.d
		  retval.x = M2.x * M1.a + M2.y * M1.c + M1.x
		  retval.y = M2.x * M1.b + M2.y * M1.d + M1.y
		  return retval
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Transform(m as DynapdfMatrixMBS, byref x as double, byref y as double)
		  dim ox as Double = x
		  dim oy as Double = y
		  
		  x = ox * M.a + oy * M.c + M.x
		  y = ox * M.b + oy * M.d + M.y
		  
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
