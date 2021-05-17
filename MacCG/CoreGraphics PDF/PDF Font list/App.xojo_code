#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // Original example can be found on Apple's Website.
		  // Translation from C is quite easy ;-)
		  
		  dim c as CGContextMBS
		  dim f as FolderItem
		  dim r as CGRectMBS
		  dim size, y, i, count as integer
		  dim s as String
		  
		  count=FontCount
		  size=count*20+20
		  
		  f=SpecialFolder.Desktop.Child("RB Fontlist Demo.pdf")
		  
		  r=CGMakeRectMBS(0,0,400,size)
		  // Create the context
		  c=CGNewPDFDocumentMBS(f,r,"PDF from Xojo","Christian Schmitz","MBS Plugin 2.7")
		  
		  if c<>nil then
		    
		    // We must begin a new page before drawing to a PDF context
		    c.BeginPage(r)
		    
		    count=count-1 // 0 based array
		    for i=0 to count
		      s=font(i)
		      
		      y=size-(i*20+10)
		      
		      c.SetRGBFillColor 0,0,0, 1 
		      c.SelectFont s, 12, 1
		      
		      // ShowTextAtPoint does not do all encodings correct
		      c.ShowTextAtPoint s,10,y
		      
		      c.SelectFont "Times New Roman", 12, 1
		      c.ShowTextAtPoint s,230,y
		      c.ShowTextAtPoint str(i+1),210,y
		    next
		    
		    // We've finished rendering the page
		    c.EndPage
		    c.Flush
		    
		    c=nil // to force the file to be written as we want to launch it
		    f.Launch
		  else
		    MsgBox "Failed to creator file!"
		  end if
		  
		  quit
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
