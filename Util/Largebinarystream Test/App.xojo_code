#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  msgbox "Test files are created on desktop!"
		  
		  Test "Testfile" 
		  
		  Test "Testfile long 1234567890 1234567890 1234567890 1234567890" 
		  
		  // this fails on Windows. Not sure what the problem is.
		  // Maybe need a japanese version of Windows?
		  Test "Testfile with Unicode 日本語のページを検索"
		  
		  quit
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub Test(Filename as string)
		  dim little as boolean
		  dim f as folderItem
		  dim n as integer
		  dim b as LargeBinaryStreamMBS
		  dim t as textoutputStream
		  
		  little=false // Test for little endian?
		  
		  MsgBox Filename
		  f=SpecialFolder.Desktop.Child(filename) // testfile on Desktop
		  
		  // Open as largebinaryStreamCloseBoxCloseBox
		  b=f.CreateLargeBinaryStreamMBS("TEXT","ttxt")
		  if b=nil then
		    msgBox "Create of file failed"
		    return
		  end if
		  
		  b.littleEndian=little
		  
		  // Write some data
		  b.write "Hallo"
		  b.writelong 123456789
		  b.writeshort -12345
		  b.writebyte 123
		  
		  if b.position<>12 then
		    msgBox "Not enough written"+str(b.position)
		    return
		  end if
		  // Close
		  b.close
		  b=nil
		  
		  f=SpecialFolder.Desktop.Child(filename) // testfile on Desktop
		  // Open as largebinaryStreamCloseBoxCloseBox for read
		  b=f.OpenAsLargeBinaryStreamMBS(false)
		  if b=nil then
		    msgBox "open of file failed"
		    return
		  end if
		  
		  b.littleEndian=little
		  
		  // Write some data
		  if b.read(5)<>"Hallo" then
		    msgBox "Read failed on string"
		    return
		  end if
		  if b.readlong<>123456789 then
		    msgBox "Read failed on long"
		    return
		  end if
		  if b.readshort<>-12345 then
		    msgBox "Read failed on short"
		    return
		  end if
		  if b.readbyte<>123 then
		    msgBox "Read failed on byte"
		    return
		  end if
		  
		  
		  if b.Read(10)<>"" then
		    MsgBox "Failed while reading over the end of the file."
		    Return
		  end if
		  
		  b.Position=0
		  if lenb(b.Read(1000))<>12 then
		    MsgBox "Failed while reading the whole file."
		    Return
		  end if
		  
		  // Close
		  b.close
		  
		  'f.delete
		  
		  msgBox "Okay."
		  
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
