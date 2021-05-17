#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   500
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   -1179729131
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Spellchecking"
   Visible         =   True
   Width           =   600
   Begin TextArea Doc
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   487
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   -1
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   0.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "REALbasic 4.5.1 Now Available!\r\rThe powerful, easy-to-use tool for creating your own software for Macintosh, Mac OS X, and Windows.\r\r• Creates compiled, native applications for Macintosh, Mac OS X, and Windows! Since they all use the same code and layout, you only need to design your application once. \r• Allows you to make your computer do what you need it to. Everyone has unique problems they need to solve, and REALbasic allows you create your own solution! \r• It is easy to use and learn. Build a working application in less than 5 minutes! Hobbyists and professionals experience profound productivity. \r• Encourages experimentation and learning. Since you can run your application at any time, you build things step-by-step, and get instant results. \r• It's Professional-strength! REALbasic uses a sophisticated version of Object-Oriented BASIC, provides access to the Mac Toolbox, SQL, AppleEvents, and more! \r• It's FUN!"
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   -1
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   602
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  ' have to save ignorewordlist...
		End Sub
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  dim b as Boolean
		  
		  b=spell.Tag<>0 // init worked
		  
		  EditCheckspelling.Enabled=b
		  EditSpelling.Enabled=b
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  spell=new MyNSSpellCheckerMBS
		  spell.t=self
		  
		  // For the demo the bundle should be inside the application folder
		  if spell.Tag<>0 then // available?
		    'ok
		  else
		    msgBox "Can't load or find the Cocoa Spellchecking stuff."
		  end if
		  
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function EditCheckspelling() As Boolean Handles EditCheckspelling.Action
			StartSpelling
			Return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditSpelling() As Boolean Handles EditSpelling.Action
			p=spell.spellingPanel
			p.Show
			Return true
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub ContinueCheck()
		  dim s as string
		  dim wc as integer
		  dim pos as integer
		  dim r as NSRangeMBS
		  
		  ' The easier way is possible, but doesn't do IgnoreLists.
		  
		  r=spell.checkSpellingOfString(doc.text,doc.selstart+doc.sellength,"",false,wc)
		  
		  if r.length>0 then
		    doc.selstart=r.Location
		    doc.sellength=r.length
		    
		    pos=doc.lineNumAtCharPos(doc.selstart)
		    doc.scrollposition=pos-5
		    
		    s=mid(doc.text,spell.Location+1,spell.length)
		    
		    spell.updateSpellingPanelWithMisspelledWord s
		    
		  else
		    doc.sellength=0
		    doc.selstart=0
		    
		    spell.updateSpellingPanelWithMisspelledWord ""
		    spell.WordFieldValue = ""
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CorrectWord()
		  doc.seltext=spell.WordFieldValue
		  MoveToNextWord
		  ContinueCheck
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub FindNext()
		  MoveToNextWord
		  ContinueCheck
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IgnoreWord()
		  MoveToNextWord
		  spell.ignoreWord spell.WordFieldValue
		  ContinueCheck
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub MoveToNextWord()
		  dim s as integer
		  
		  s=doc.SelStart+doc.SelLength
		  doc.SelLength=0
		  doc.SelStart=s
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartSpelling()
		  p=spell.spellingPanel
		  p.Show
		  
		  doc.sellength=0
		  doc.selstart=0
		  
		  ContinueCheck
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected currentword As string
	#tag EndProperty

	#tag Property, Flags = &h0
		offset As integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected p As NSPanelMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		spell As myNSSpellCheckerMBS
	#tag EndProperty


#tag EndWindowCode

#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="offset"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
