#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  test1
		  test2
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Fill(w as window1, a() as TextInputSourceMBS)
		  dim list as listbox = w.List
		  
		  for each t as TextInputSourceMBS in a
		    dim s,e as string
		    
		    if t.IsEnabled then
		      e = "yes"
		    else
		      e = "no"
		    end if
		    
		    if t.IsSelected then
		      s = "yes"
		    else
		      s = "no"
		    end if
		    
		    dim c as string
		    Select case t.Category
		    case t.kTISCategoryInkInputSource
		      c = "Ink"
		    case t.kTISCategoryKeyboardInputSource
		      c = "Keyboard"
		    case t.kTISCategoryPaletteInputSource
		      c = "Palette"
		    else // unknown
		      c = t.Category
		    end Select
		    
		    dim lang as string = join(t.SourceLanguages, ", ")
		    
		    list.AddRow "", t.LocalizedName, c, e, s, lang
		    
		    dim icon as IconMBS = t.Icon
		    
		    if icon<>Nil then
		      // icon object
		      
		      dim p as new Picture(16,16,32)
		      dim b as CGBitmapContextMBS = CGBitmapContextMBS.CreateWithPicture(p)
		      icon.DrawIconCGContext(b.Handle, 0, 0, p.Width, p.Height, 0, 0, 0, &cFFFFFF)
		      list.RowPicture(list.LastIndex) = p
		      
		    else
		      // icon file
		      dim f as FolderItem = t.IconImageFile
		      if f<>Nil then
		        dim p as Picture = Picture.Open(f)
		        if p<>Nil then
		          list.RowPicture(list.LastIndex) = p
		        end if
		      end if
		    end if
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub test1()
		  dim a() as TextInputSourceMBS = TextInputSourceMBS.CreateASCIICapableInputSourceList
		  
		  dim w as new window1
		  w.Title = "Input List"
		  
		  fill w, a
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub test2()
		  dim a() as TextInputSourceMBS = TextInputSourceMBS.CreateInputSourceList(nil, true)
		  
		  dim w as new window1
		  w.Title = "All"
		  
		  fill w, a
		  
		  
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
