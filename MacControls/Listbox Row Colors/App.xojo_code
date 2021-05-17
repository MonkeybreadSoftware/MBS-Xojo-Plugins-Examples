#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub AppearanceChanged()
		  QueryRowColors
		  
		  
		  // refresh windows
		  
		  For i As Integer = WindowCount-1 DownTo 0
		    window(i).Invalidate
		  Next
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  QueryRowColors
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Sub QueryRowColors()
		  // our defaults
		  RowColorEven = &cFFFFFF
		  RowcolorOdd = &cEEFFEE
		  
		  
		  #if TargetMacOS then
		    
		    dim colors() as NSColorMBS = NSColorMBS.alternatingContentBackgroundColors
		    if colors = nil then 
		      break
		      return // should not happen
		    end if
		    
		    if colors.Ubound = 1 then
		      // 2 colors
		      
		      RowColorEven = colors(0).colorValue
		      RowColorOdd  = colors(1).colorValue
		      
		    end if
		    
		  #endif
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Shared RowColorEven As color
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared RowColorOdd As color
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
