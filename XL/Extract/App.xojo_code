#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  RegisterLibXL
		  
		  // select a file and open it
		  dim book as XLBookMBS
		  dim tab as string = encodings.ASCII.Chr(9)
		  dim file as FolderItem = GetOpenFolderItem(FileTypes1.All)
		  
		  if file = nil then quit
		  
		  if right(file.Name,4) = ".xls" then
		    book = new XLBookMBS(false)
		  elseif Right(file.Name,5)=".xlsx" then
		    book = new XLBookMBS(true)
		  else
		    MsgBox "Unknown file extension!"
		    quit
		  end if
		  
		  // Warning: Without a license the plugin will read only 100 cells (first row is unavailable)
		  
		  // book.SetKey("...", "...")
		  
		  if book.Load(file) then
		    
		    // now write all values from all sheets to text file
		    dim f as FolderItem = SpecialFolder.Desktop.Child("test.txt")
		    dim t as TextOutputStream = f.CreateTextFile
		    
		    for each sheet as XLSheetMBS in book.Sheets
		      t.WriteUTF8 "Sheet: "+sheet.Name
		      t.WriteLine
		      
		      for y as integer = sheet.FirstRow to sheet.LastRow
		        for x as integer = sheet.FirstCol to sheet.LastCol
		          
		          if sheet.IsFormula(y,x) then
		            t.Write Sheet.ReadFormula(y,x)+": "
		          end if
		          
		          Select case sheet.CellType(y,x)
		          case sheet.CellTypeBlank
		            
		          case sheet.CellTypeBoolean
		            
		            dim b as Boolean = sheet.ReadBoolean(y,x)
		            
		            if b then
		              t.WriteUTF8 "true"
		            else
		              t.WriteUTF8 "false"
		            end if
		            
		          case sheet.CellTypeEmpty
		            
		          case sheet.CellTypeError
		            
		            dim e as integer = sheet.ReadError(y,x)
		            Select case e
		            case sheet.ErrorTypeDiv0
		              t.WriteUTF8 "Error: Div/0"
		            case sheet.ErrorTypeNA
		              t.WriteUTF8 "Error: N/A"
		            case sheet.ErrorTypeName
		              t.WriteUTF8 "Error: Name"
		            case sheet.ErrorTypeNull
		              t.WriteUTF8 "Error: Null"
		            case sheet.ErrorTypeNum
		              t.WriteUTF8 "Error: Num"
		            case sheet.ErrorTypeRef
		              t.WriteUTF8 "Error: Ref"
		            case sheet.ErrorTypeValue
		              t.WriteUTF8 "Error: Value"
		            end Select
		            
		          case sheet.CellTypeNumber
		            
		            dim d as Double = sheet.ReadNumber(y,x)
		            if sheet.IsDate(y,x) then
		              dim da as date = book.UnpackDate(d)
		              if da<>nil then
		                t.WriteUTF8 da.shortdate+" "+da.shortTime
		              else
		                t.WriteUTF8 str(d) 
		              end if
		            else
		              t.WriteUTF8 str(d) 
		            end if
		            
		          case sheet.CellTypeString
		            
		            t.WriteUTF8 sheet.ReadString(y,x)
		            
		          end Select
		          t.Write tab
		        next
		        
		        t.WriteLine 
		      next
		      
		    next
		    
		    t.Close
		    f.Launch
		    
		  else
		    MsgBox book.ErrorMessage
		  end if
		  
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub RegisterLibXL()
		  
		  // once you bought a LibXL license, you can put your license key here
		  
		  // see order links on our website
		  // http://www.monkeybreadsoftware.de/xojo/plugin-xls.shtml
		  
		  
		  #if TargetMacOS then
		    
		    XLBookMBS.SetKeyGlobal "your name", "your Mac LibXL license key"
		    
		  #elseif TargetWin32 then
		    
		    XLBookMBS.SetKeyGlobal "your name", "your Windows LibXL license key"
		    
		  #elseif TargetLinux then
		    
		    XLBookMBS.SetKeyGlobal "your name", "your Linux LibXL license key"
		    
		  #endif
		  
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
