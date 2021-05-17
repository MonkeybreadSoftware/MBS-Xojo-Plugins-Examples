#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  dim pdf as new MyDynapdfMBS
		  dim f as Folderitem = SpecialFolder.Desktop.Child("DynaPDF transparent images console.pdf")
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  if pdf.CreateNewPDF(f) then
		    
		    call pdf.SetPageCoords pdf.kpcTopDown
		    
		    call pdf.Append
		    
		    call pdf.SetCompressionFilter(pdf.kcfFlate)
		    call pdf.SetUseTransparency true
		    call pdf.SetSaveNewImageFormat(false)
		    
		    // rect background
		    call pdf.SetColors(pdf.RGB(255,0,0))
		    call pdf.Rectangle(0,0,900,900,pdf.kfmFill)
		    
		    
		    //draw gif file with trasparency
		    dim gifimg as FolderItem=FindFile("img.gif")
		    
		    call pdf.SetTransparentColor pdf.kNO_COLOR // use gif transparent color
		    call pdf.InsertImageEx(10,10,0,0,gifimg,1)
		    
		    
		    dim p as new Picture(120, 120, 32)
		    dim m as new Picture(120, 120, 32)
		    
		    p.Graphics.ForeColor = &c00FF00
		    p.Graphics.FillOval 0, 0, 120, 120
		    m.Graphics.ForeColor = &c000000
		    m.Graphics.FillOval 0, 0, 120, 120
		    
		    call pdf.SetTransparentColor pdf.RGB(255,0,0) // use 0 for transparent
		    call pdf.InsertPicture(p,m,10,160,0,0)
		    
		    call pdf.EndPage
		    call pdf.CloseFile
		  end if
		  
		End Function
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


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
