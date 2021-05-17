#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub NewDocument()
		  dim f as FolderItem = GetOpenFolderItem("")
		  
		  if f<>Nil then
		    OpenDocument f
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub OpenDocument(item As FolderItem)
		  ReadCSV item
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ReadCSV(file as FolderItem)
		  dim t as TextInputStream = TextInputStream.Open(file)
		  
		  t.Encoding = Encodings.UTF8 // we expect here: UTF-8
		  
		  
		  
		  // prepare window
		  dim w as new TextWindow
		  dim list as listbox = w.List
		  
		  w.Title = file.DisplayName
		  
		  // read header
		  dim header as string = t.ReadLine
		  dim headerItems() as string = SplitCommaSeparatedValuesMBS(header)
		  
		  dim u as integer = UBound(headerItems)
		  list.ColumnCount = u+1
		  for i as integer = 0 to u
		    list.Heading(i) = headerItems(i)
		  next
		  
		  // read rows
		  dim lines() as string
		  while not t.EOF
		    dim line as string = t.ReadLine
		    
		    if line.trim.len>0 then // ignore empty lines
		      lines.append line
		    end if
		  wend
		  
		  
		  dim AllLines as string = Join(lines, EndOfLine)
		  dim items() as string = SplitCommaSeparatedValuesMBS(AllLines, "")
		  
		  dim n as integer
		  
		  while n < items.Ubound
		    list.AddRow ""
		    
		    for i as integer = 0 to u
		      list.cell(list.LastIndex, i) = items(n)
		      list.CellHelpTag(list.LastIndex, i) = items(n)
		      n = n + 1
		    next
		    
		  wend
		  
		  
		End Sub
	#tag EndMethod


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&L\xC3\xB6schen", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&L\xC3\xB6schen"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&L\xC3\xB6schen"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"Beenden", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Beenden"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
