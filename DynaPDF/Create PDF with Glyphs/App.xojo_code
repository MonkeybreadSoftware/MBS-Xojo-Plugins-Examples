#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim line as integer = 120
		  dim col as integer = 60
		  dim page as integer = 1
		  dim font as string = "Arial" // font to test
		  dim t as string
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with Glyphs " + font + ".pdf")
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF f
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo output"
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  dim hFont1 as integer = pdf.SetFont (font, pdf.kfsNone, 20.0, true, pdf.kcpUnicode)
		  dim hFont2 as integer = pdf.SetFont ( "Courier", pdf.kfsNone, 14.0, true, pdf.kcpUnicode)
		  
		  dim fontInfo as DynaPDFFontInfoMBS = pdf.GetFontInfoEx(hFont1)
		  
		  call pdf.changeFont(hFont2)
		  call pdf.ChangeFontSize(24.0)
		  'call pdf.SetFont "Courier New", pdf.kfsNone, 24.0, true, pdf.kcpUnicode
		  call pdf.WriteFText pdf.ktaCenter, "Glyphs for " + font
		  
		  for i as integer = 32 to 65535
		    
		    if i >= 56320 and i <= 57343 then continue  // Skip the Unicode 'dead area'
		    
		    t = encodings.UTF16.Chr(i)
		    
		    if pdf.TestGlyphs( hFont1, t ) <> -1 then continue  // Check font for populated codepoints
		    
		    call pdf.changeFont(hFont2)
		    call pdf.ChangeFontSize(14.0)
		    'call pdf.SetFont "Courier New", pdf.kfsNone, 14.0, true, pdf.kcpUnicode
		    call pdf.WriteText col, line, getHex(i)
		    
		    call pdf.changeFont(hFont1)
		    call pdf.ChangeFontSize(20.0)
		    'call pdf.SetFont font, pdf.kfsNone, 20.0, true, pdf.kcpUnicode
		    call pdf.WriteText col + 70, line + fontInfo.Descent/72.0, t
		    
		    if line < 650 then
		      line = line + 30
		      
		    else
		      line = 120
		      
		      if col < 440 then
		        col = col + 130
		      else
		        col = 60
		        
		        call pdf.changeFont(hFont2)
		        call pdf.ChangeFontSize(14.0)
		        'call pdf.SetFont "Courier New", pdf.kfsNone, 14.0, true, pdf.kcpUnicode
		        call pdf.WriteText 470, 750,  "Page " + str( page )
		        call pdf.EndPage
		        
		        call pdf.Append
		        call pdf.changeFont(hFont2)
		        call pdf.ChangeFontSize(24.0)
		        'call pdf.SetFont "Courier New", pdf.kfsNone, 24.0, true, pdf.kcpUnicode
		        call pdf.WriteFText pdf.ktaCenter, "Glyphs for " + font + " (contd.)"
		        
		        page = page + 1
		      end if
		    end if
		  next
		  
		  call pdf.changeFont(hFont2)
		  'call pdf.SetFont "Courier New", pdf.kfsNone, 14.0, true, pdf.kcpUnicode
		  call pdf.WriteText 470, 750,  "Page " + str( page )
		  call pdf.EndPage
		  
		  call pdf.CloseFile
		  
		  f.Launch
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function getHex(int as integer) As string
		  dim s as string
		  
		  select case len(hex(int))
		  case 2
		    s = "&h00" + hex(int)
		    
		  case 3
		    s = "&h0" + hex(int)
		    
		  case else
		    s = "&h" + hex(int)
		  end select
		  
		  return s
		End Function
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
