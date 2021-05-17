#tag Class
Protected Class App
Inherits Application
	#tag Method, Flags = &h0
		Sub CreateFiles()
		  dim f as FolderItem
		  dim t as TextOutputStream
		  dim i as integer
		  dim folder as FolderItem
		  
		  f=SpecialFolder.Desktop.Child("Test Inputfile.txt")
		  t=f.CreateTextFile
		  t.WriteLine Window1.StaticText1.text
		  t.Close
		  
		  folder=SpecialFolder.Desktop.Child("Testinputfolder")
		  folder.CreateAsFolder
		  
		  for i=1 to 10
		    f=folder.Child("test "+str(i))
		    t=f.CreateTextFile
		    t.WriteLine Window1.StaticText1.text
		    t.Close
		    
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestArchive()
		  dim b as LargeBinaryStreamMBS
		  dim f as FolderItem
		  dim bs as MBSStream
		  
		  // Creates an archive with one file.
		  // needs "Vancouver_Night_Panorama.tif" file on desktop
		  // creates "test.pack" on desktop
		  
		  // Create 
		  f=SpecialFolder.Desktop.Child("test.pack")
		  b=f.CreateLargeBinaryStreamMBS("TEXT","????")
		  
		  bs=new MBSLargeBinaryStream(b)
		  bs.ArchiveFile SpecialFolder.Desktop.Child("Test Inputfile.txt")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestArchiveFolder()
		  dim b as LargeBinaryStreamMBS
		  dim f as FolderItem
		  dim OutBinary, OutZip, OutAES, OutXOR as MBSStream
		  
		  // Creates an archive with files.
		  // needs "picts" folder on desktop
		  // creates "testfolder.pack" on desktop
		  
		  // Create 
		  f=SpecialFolder.Desktop.Child("testfolder.pack")
		  b=f.CreateLargeBinaryStreamMBS("TEXT","????")
		  
		  OutBinary=new MBSLargeBinaryStream(b)
		  
		  // xor before writing to file
		  OutXOR=new MBSXORStream(OutBinary,"Hello World") // xor, so nobody sees header data
		  
		  // and AES before
		  OutAES=new MBSAESstream(OutXOR,"1234567890123456")
		  
		  // and Zip it before!
		  OutZip=new MBSBufferedZipStream(OutAES)
		  
		  OutZip.ArchiveFolder SpecialFolder.Desktop.Child("Testinputfolder")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestRead()
		  dim b as BinaryStream
		  dim f as FolderItem
		  dim OutBinary, InBinary, InXOR, InAES, InZip as MBSStream
		  
		  f=SpecialFolder.Desktop.Child("Test Processfile.txt")
		  b=f.OpenAsBinaryFile(False)
		  if b=nil then
		    Return
		  end if
		  
		  InBinary=new MBSBinaryStream(b)
		  
		  // xor it
		  InXOR=new MBSXORStream(InBinary,"Hello World") // xor, so nobody sees header data
		  
		  // decrypt it
		  InAES=new MBSAESstream(InXOR,"1234567890123456")
		  
		  // Unzip it
		  InZip=new MBSZipStream(InAES)
		  
		  // find dest file
		  f=SpecialFolder.Desktop.Child("Test Outputfile.txt")
		  b=f.CreateBinaryFile("text")
		  
		  // Write it to a binary stream
		  OutBinary=new MBSBinaryStream(b)
		  
		  InZip.CopyStreamTo OutBinary,10000
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestUnarchive()
		  dim b as LargeBinaryStreamMBS
		  dim f as FolderItem
		  Dim bs As MBSStream
		  
		  // Opens an archive with one file.
		  // needs "test.pack" on desktop
		  // creates "output" folder on desktop
		  
		  // Create 
		  f=SpecialFolder.Desktop.Child("test.pack")
		  b=f.OpenAsLargeBinaryStreamMBS(false)
		  
		  f=SpecialFolder.Desktop.Child("output")
		  f.CreateAsFolder
		  
		  bs=new MBSLargeBinaryStream(b)
		  bs.UnarchiveFile f
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestUnarchiveFolder()
		  dim b as LargeBinaryStreamMBS
		  dim f as FolderItem
		  dim InZip, InBinary, InXOR, InAES as MBSStream
		  
		  // Opens an archive with files.
		  // needs "testfolder.pack" file on desktop
		  // creates "outputfolder" folder on desktop
		  
		  // Create 
		  f=SpecialFolder.Desktop.Child("testfolder.pack")
		  b=f.OpenAsLargeBinaryStreamMBS(false)
		  
		  f=SpecialFolder.Desktop.Child("Testoutputfolder")
		  f.CreateAsFolder
		  
		  InBinary=new MBSLargeBinaryStream(b)
		  
		  // xor it
		  InXOR=new MBSXORStream(InBinary,"Hello World") // xor, so nobody sees header data
		  
		  // decrypt it
		  InAES=new MBSAESstream(InXOR,"1234567890123456")
		  
		  // Unzip it
		  InZip=new MBSZipStream(InAES)
		  
		  InZip.UnarchiveFolder f
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestWrite()
		  dim b as BinaryStream
		  dim f as FolderItem
		  dim InBinary, OutBinary, OutXOR, OutAES, OutZip as MBSStream
		  
		  f=SpecialFolder.Desktop.Child("Test Inputfile.txt")
		  b=f.OpenAsBinaryFile(False)
		  if b=nil then
		    Return
		  end if
		  
		  // Read from BinaryStream
		  InBinary=new MBSBinaryStream(b)
		  
		  f=SpecialFolder.Desktop.Child("Test Processfile.txt")
		  b=f.CreateBinaryFile("text")
		  
		  // send data to binary stream
		  OutBinary=new MBSBinaryStream(b)
		  
		  // xor before
		  OutXOR=new MBSXORStream(OutBinary,"Hello World") // xor, so nobody sees header data
		  
		  // and AES before
		  OutAES=new MBSAESstream(OutXOR,"1234567890123456")
		  
		  // and Zip it before!
		  OutZip=new MBSBufferedZipStream(OutAES)
		  
		  InBinary.CopyStreamTo OutZip,100000
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
