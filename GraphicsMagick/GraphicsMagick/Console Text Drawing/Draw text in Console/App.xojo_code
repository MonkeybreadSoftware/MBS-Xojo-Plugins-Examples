#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  // if you run in the RB IDE you get folders, so we need to move up
		  dim projectfolder as FolderItem = SpecialFolder.Desktop
		  
		  dim f as FolderItem = projectfolder.Child("test.db")
		  dim d as new REALSQLDatabase
		  
		  d.DatabaseFile = f
		  
		  if d.Connect then
		    db = d
		    
		    dim g as new GMGeometryMBS(500,500)
		    dim c as new GMColorRGBMBS("white") // white
		    dim image as new GMImageMBS(g, c)
		    
		    image.strokeColor = new GMColorRGBMBS("red") // Outline color
		    image.fillColor = new GMColorRGBMBS("green") // Fill color
		    image.strokeWidth = 5
		    
		    dim draw as GMGraphicsMBS = image.Graphics
		    
		    // Draw a circle
		    draw.Circle(250, 250, 120, 150)
		    draw.Draw
		    
		    WriteText image, 30,30, "Hello World", "Times", 24, stBold
		    
		    WriteText image, 30,  430, "Hello World normal",    "Monaco", 12, 0
		    WriteText image, 230, 430, "Hello World italic",    "Monaco", 12, stBold
		    WriteText image, 30,  470, "Hello World underline", "Times",  12, 0
		    WriteText image, 230, 470, "Hello World bold",      "Times",  12, stBold
		    
		    
		    dim file as FolderItem = projectfolder.Child("output.jpg")
		    
		    image.quality = 100
		    image.magick = "JPEG"
		    image.write(file)
		    
		  else
		    print "Failed to open letter database."
		  end if
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function WriteLetter(image as GMImageMBS, x as integer, y as integer, letter as string, font as string, size as integer, style as integer) As integer
		  
		  dim r as RecordSet = db.SQLSelect("select data from letter where code="+str(asc(letter))+" and font="""+font+""" and size="+str(size)+" and style="+str(style))
		  
		  if r<>Nil and not r.EOF then
		    dim data as string = r.Field("data").StringValue
		    
		    dim b as new GMBlobMBS(data)
		    dim g as new GMGeometryMBS
		    dim img as new GMImageMBS(b,g,"PNG")
		    
		    if img.isValid then
		      
		      call image.compositeXY(img, x, y, GMImageMBS.CopyCompositeOp)
		      
		      Return img.width
		    end if
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WriteText(image as GMImageMBS, x as integer, y as integer, text as string, font as string, size as integer, style as integer)
		  text = ConvertEncoding(text, encodings.utf8)
		  
		  dim c as integer = len(text)
		  for i as integer = 1 to c
		    
		    dim dx as integer = WriteLetter(image, x, y, mid(text,i,1), font, size, style)
		    
		    x = x + dx
		    
		  next
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private db As REALSQLDatabase
	#tag EndProperty


	#tag Constant, Name = stBold, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = stItalic, Type = Double, Dynamic = False, Default = \"4", Scope = Private
	#tag EndConstant

	#tag Constant, Name = stUnderline, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
