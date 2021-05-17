#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  dim s as FolderItem = SpecialFolder.Desktop.Child("test.epub")
		  
		  dim z as new ZipMBS(s,0)
		  
		  AddFile z, "mimetype", "application/epub+zip", false // identifier
		  AddFile z, "META-INF/container.xml", Container, true // points to content files below
		  AddFile z, "content.opf", Content_OPF, true
		  AddFile z, "content.ncx", Content_NCX, true // table of content
		  AddFile z, "content.xhtml", Content_XML, true // actual content
		  
		  z.Close
		  
		  
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddFile(z as ZipMBS, path as string, content as string, Compress as Boolean)
		  dim d as new date
		  dim info as ZipFileInfoMBS
		  
		  info=new ZipFileInfoMBS
		  info.SetDate d
		  info.ExternalFileAttributes=0
		  info.InternalFileAttributes=0
		  info.DosDate=0
		  
		  if Compress then
		    z.CreateFile path, info, "", "", "", z.MethodDeflated, z.CompressionBestCompression
		  else
		    z.CreateFile path, info, "", "", "", z.MethodNone, 0
		  end if
		  
		  z.Write content
		  z.CloseFile
		  
		  
		End Sub
	#tag EndMethod


	#tag Constant, Name = Container, Type = String, Dynamic = False, Default = \"<\?xml version\x3D\"1.0\" encoding\x3D\"UTF-8\"\?>\r  <container\r    xmlns\x3D\"urn:oasis:names:tc:opendocument:xmlns:container\"\r    version\x3D\"1.0\">\r    <rootfiles>\r      <rootfile\r        full-path\x3D\"content.opf\"\r        media-type\x3D\"application/oebps-package+xml\"/>\r    </rootfiles>\r  </container>", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Content_NCX, Type = String, Dynamic = False, Default = \"<\?xml version\x3D\"1.0\" encoding\x3D\"UTF-8\"\?>\r  <!DOCTYPE ncx \r    PUBLIC \"-//NISO//DTD ncx 2005-1//EN\" \"http://www.daisy.org/z3986/2005/ncx-2005-1.dtd\">\r  <ncx\r    xmlns\x3D\"http://www.daisy.org/z3986/2005/ncx/\"\r    version\x3D\"2005-1\"\r    xml:lang\x3D\"de-DE\">\r    <head>\r      <meta name\x3D\"dc:Title\" content\x3D\"Hello World\"/>\r      <meta name\x3D\"dtb:uid\" content\x3D\"id_Hello_World\"/>\r    </head>\r    <docTitle>\r      <text>Hello World</text>\r    </docTitle>\r    <navMap>\r      <navPoint playOrder\x3D\"1\" id\x3D\"id_Hello_World_01\">\r        <navLabel>\r          <text>Hello World</text>\r        </navLabel>\r        <content src\x3D\"content.xhtml\"/>\r      </navPoint>\r    </navMap>\r  </ncx>", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Content_OPF, Type = String, Dynamic = False, Default = \"<\?xml version\x3D\"1.0\" encoding\x3D\"UTF-8\"\?>\r  <package\r    xmlns:xsi\x3D\"http://www.w3.org/2001/XMLSchema-instance\"\r    xmlns:dc\x3D\"http://purl.org/dc/elements/1.1/\"\r    xmlns:opf\x3D\"http://www.idpf.org/2007/opf\"\r    xmlns\x3D\"http://www.idpf.org/2007/opf\"\r    version\x3D\"2.0\"\r    unique-identifier\x3D\"BookId\">\r    <metadata>\r      <dc:language xsi:type\x3D\"dcterms:RFC3066\">de-DE</dc:language>\r      <dc:title>Hello World</dc:title>\r      <dc:identifier id\x3D\"BookId\">id_Hello_World</dc:identifier>\r    </metadata>\r    <manifest>\r      <item id\x3D\"ncx\" href\x3D\"content.ncx\" media-type\x3D\"application/x-dtbncx+xml\"/>\r      <item id\x3D\"Datei_1\" href\x3D\"content.xhtml\" media-type\x3D\"application/xhtml+xml\"/>\r    </manifest>\r    <spine toc\x3D\"ncx\">\r      <itemref idref\x3D\"Datei_1\"/>\r    </spine>\r  </package>", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Content_XML, Type = String, Dynamic = False, Default = \"<\?xml version\x3D\"1.0\" encoding\x3D\"UTF-8\"\?>\r  <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\" \r     \"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">\r  <html xmlns\x3D\"http://www.w3.org/1999/xhtml\">\r    <head>\r      <meta http-equiv\x3D\"Content-Type\" content\x3D\"text/html; charset\x3DUTF-8\"/>\r      <link rel\x3D\"schema.DC\" href\x3D\"http://purl.org/dc/elements/1.1/\"/>\r      <title>Hello World</title>\r      <meta name\x3D\"DC.identifier\" content\x3D\"id_Hello_World\"/>\r    </head>\r    <body>\r      <h1>Hello World</h1>\r      <p>Ein Beispieltext.</p>\r    </body>\r  </html>", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
