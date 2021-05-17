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
		  dim f as FolderItem
		  dim period as integer
		  dim d as NSMenuItemMBS
		  
		  pref.Load
		  
		  s=new NSStatusItemMBS
		  
		  // Create statusitem
		  call s.CreateMenu
		  s.HighlightMode=true
		  s.Title="?"
		  
		  // create a menu to attach to the statusitem
		  m=new NSMenuMBS
		  
		  
		  // Create menu items
		  VisitWebsiteMenu=new MyCocoamenuitem
		  VisitWebsiteMenu.CreateMenuItem "Visit website"
		  VisitWebsiteMenu.ID=2
		  m.AddItem VisitWebsiteMenu
		  
		  d=new NSMenuItemMBS
		  d.CreateSeparator
		  m.AddItem d
		  
		  UpdateMenu=new MyCocoamenuitem
		  UpdateMenu.CreateMenuItem "Update now"
		  UpdateMenu.ID=3
		  m.AddItem UpdateMenu
		  
		  DisplayMenu=new MyCocoamenuitem
		  DisplayMenu.CreateMenuItem "Short Name"
		  DisplayMenu.id=10
		  if pref.ShortName then
		    DisplayMenu.State=1
		  else
		    DisplayMenu.State=0
		  end if
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
		  
		  update
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  quit
		  Return true
		End Function
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Function GetLongName() As string
		  Return systeminformationMBS.username
		  
		  Exception
		    
		    Return "?"
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetShortName() As string
		  Return systeminformationMBS.ShortUsername
		  
		  Exception
		    
		    Return "?"
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub update()
		  if s<>nil then
		    if pref.ShortName then
		      s.Title=NewCFStringMBS(GetShortName)
		    else
		      s.Title=NewCFStringMBS(GetLongName)
		    end if
		  end if
		  
		  Exception
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private DisplayMenu As myCocoamenuitem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected m As NSmenumBS
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
