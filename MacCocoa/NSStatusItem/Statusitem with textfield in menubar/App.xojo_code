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
		  
		  myview = new NSViewMBS(0,0,150,20)
		  
		  mytext = new MyNSTextFieldMBS(20, 0, 110, 20)
		  mytext.StringValue = "He" 
		  
		  myview.addSubview mytext
		  
		  
		  
		  s=new NSStatusItemMBS
		  
		  // Create statusitem
		  call s.CreateMenu
		  s.HighlightMode=true
		  s.Title="Click me"
		  
		  // create a menu to attach to the statusitem
		  m=new NSMenuMBS
		  
		  
		  // Create menu items
		  VisitWebsiteMenu=new MyCocoamenuitem
		  VisitWebsiteMenu.CreateMenuItem "Visit website"
		  VisitWebsiteMenu.ID=2
		  m.AddItem VisitWebsiteMenu
		  
		  dim d as new NSMenuItemMBS
		  d.CreateSeparator
		  m.AddItem d
		  
		  DisplayMenu=new MyCocoamenuitem
		  DisplayMenu.CreateMenuItem ""
		  DisplayMenu.view = myview
		  DisplayMenu.id=10
		  
		  m.AddItem DisplayMenu
		  
		  d=new NSMenuItemMBS
		  d.CreateSeparator
		  m.AddItem d
		  
		  QuitMenu=new MyCocoamenuitem
		  QuitMenu.CreateMenuItem "Quit"
		  QuitMenu.ID=1
		  m.AddItem QuitMenu
		  
		  // attach menu
		  s.Menu=m
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  quit
		  Return true
		End Function
	#tag EndEvent


	#tag Property, Flags = &h21
		Private DisplayMenu As myCocoamenuitem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected m As NSmenumBS
	#tag EndProperty

	#tag Property, Flags = &h0
		mylabel As NSTextViewMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		mytext As MyNSTextFieldMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		myview As NSViewMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		QuitMenu As MyCocoamenuitem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected s As NSStatusItemMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		UpdateMenu As mycocoamenuitem
	#tag EndProperty

	#tag Property, Flags = &h0
		VisitWebsiteMenu As mycocoamenuitem
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
