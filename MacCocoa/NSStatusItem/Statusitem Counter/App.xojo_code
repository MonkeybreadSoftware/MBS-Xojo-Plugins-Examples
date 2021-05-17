#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim f as FolderItem
		  
		  if TargetMachO=false then
		    MsgBox "This example needs a MachO target running on Mac OS X."
		    quit
		  end if
		  
		  s=new NSStatusItemMBS
		  
		  if not s.Available then
		    MsgBox "NSStatusItem not available."
		    quit
		  end if
		  
		  
		  CountItem= new NSMenuItemMBS
		  CountItem.CreateMenuItem "Counting..."
		  CountItem.Enabled = true
		  
		  m = new NSMenuMBS
		  m.addItem CountItem
		  
		  call s.CreateMenu
		  s.HighlightMode=false
		  s.Title="Click me"
		  s.HighlightMode=true
		  s.menu = m
		  
		  c=new clock
		  
		  c.Period=1000
		  c.mode=2
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub update()
		  count = count + 1
		  
		  CountItem.Title= str(count)
		  
		  // for console:
		  System.DebugLog str(count)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		c As clock
	#tag EndProperty

	#tag Property, Flags = &h0
		count As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CountItem As NSMenuItemMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		last As string
	#tag EndProperty

	#tag Property, Flags = &h0
		m As NSMenuMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		s As NSStatusItemMBS
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="last"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="count"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
