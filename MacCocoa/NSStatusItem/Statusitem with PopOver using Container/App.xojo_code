#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Close()
		  if s<>nil then
		    s.Close
		    DelayMBS 0.2 // wait for events to flush
		    s=nil
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  if TargetCocoa = false then
		    MsgBox "This example is only for Cocoa target."
		  end if
		  
		  if NSPopoverMBS.available = false then
		    MsgBox "Please update to Mac OS X 10.7 (Lion)"
		    Return
		  end if
		  
		  
		  
		  s=new MyNSStatusItemMBS
		  
		  // Create statusitem
		  call s.CreateMenu
		  s.HighlightMode=true
		  s.Title="Click me"
		  s.conMain = Window1.ContainerControl11
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  quit
		  Return true
		End Function
	#tag EndEvent


	#tag Property, Flags = &h1
		Protected m As NSmenumBS
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected s As MyNSStatusItemMBS
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
