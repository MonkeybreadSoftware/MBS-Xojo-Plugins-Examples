#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   False
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   509
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   -1115129803
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Untitled"
   Visible         =   True
   Width           =   506
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Print"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   219
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   445
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin Canvas Canvas1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   200
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   153
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   39
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   200
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   151
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   24
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Compare what the text and rectangle shown above look like compiled for Carbon vs. Cocoa.\r\rThen compare the printed version in Carbon and Cocoa vs. what is shown here.\r\rYou get 4 different looks, depending on whether it's printed or drawn on screen and Cocoa vs. Carbon."
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   251
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   459
   End
   Begin CheckBox CheckFix
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Use Fix"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   348
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      State           =   1
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   445
      Transparent     =   True
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   100
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h1
		Protected Sub BeginPrinting(g as Graphics, pagesetup as PrinterSetup)
		  // We do all of our printing setup here.  In this
		  // case, we create a proper StyledTextPrinter object
		  // so that we can use it when doing all of our printing.
		  // This function gets called once at the beginning
		  // of each print job
		  'mStp = EditField1.StyledTextPrinter( g, pagesetup.Width )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DoPrinting(g as Graphics, pagesetup as PrinterSetup)
		  if pagesetup = nil or g = nil then return
		  
		  // We have to watch out for a few things because
		  // REALbasic doesn't take care of these issues for
		  // us.  1) Page ranges -- the user can specify a
		  // range of pages they want to print.  We want to
		  // eat any pages they didn't request.  2) Copies --
		  // the user may want multiple copies of the output,
		  // with the page range information applying to
		  // each copy.  3) You'd think we have to watch out
		  // for landscaping, but we really don't.  We just print
		  // based on the information given to us since the
		  // width and the height of the pagesetup object
		  // will automatically reflect the proper page information.
		  
		  // Print the proper number of copies by looping
		  // thru and passing the problem off to another
		  // function.
		  dim i, copies as Integer
		  copies = g.Copies
		  
		  for i = 0 to copies - 1
		    PrintOneCopy( g, pagesetup )
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub EndPrinting()
		  // This function gets called once at the end of
		  // each print job.  We just do general cleanup here.
		  mStp = nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PrintOneCopy(g as Graphics, pagesetup as PrinterSetup)
		  // We want to print one copy of the information.
		  // At this stage, we just need to worry about
		  // style (landscape vs portrait) and the page
		  // range we need to print for.
		  
		  // The basic idea is that we are given a graphics
		  // object that is X by Y pixels wide and a set
		  // of information (stored in our EditField) that
		  // needs to be printed.  We will figure out just 
		  // how much data can be printed on a single
		  // line and print that.  If the page is going to
		  // be eaten, then so be it.  We simply won't call
		  // Graphics.NextPage and instead call Graphics.ClearRect
		  // to wipe the page clean.  This way, only the proper
		  // pages that the user asked for get printed.
		  
		  // Before we get started, we want to initialize
		  // some information for the print worker
		  BeginPrinting( g, pagesetup )
		  
		  // We will pass the work off to one more level
		  // to actually do the printing to the Graphics
		  // object.  This level's job is to determine which
		  // pages get used and which ones get wiped.
		  dim currentPageNumber as Integer = 1
		  while PrintSomeInformation( g, pagesetup )
		    // If we printed something to the printer's
		    // graphics context, then we should check
		    // to see if it's one of the pages we
		    // care about.  We don't call NextPage if
		    // this was the LastPage because the Graphics
		    // object will print the page automatically when
		    // it gets set to nil
		    if currentPageNumber >= g.FirstPage and _
		      currentPageNumber < g.LastPage then
		      // This is a page we want to print, so let's
		      // shoot it off to the printer
		      g.NextPage
		    elseif currentPageNumber = g.LastPage then
		      // We're done printing, so we can exit
		      // without calling NextPage
		      exit
		    else
		      // This was a page we don't want to print, so
		      // we'll clear the Graphics context
		      g.ClearRect( 0, 0, g.Width, g.Height )
		    end
		    
		    // Advance the page number
		    currentPageNumber = currentPageNumber + 1
		  wend
		  
		  // We're done printing this copy of the information!
		  // Let's let the worker know that we're done
		  EndPrinting
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function PrintSomeInformation(g as Graphics, pagesetup as PrinterSetup) As Boolean
		  // Here is where the actual work of formatting
		  // and doing the printing happens.  The job of this
		  // function is to print as much information as it
		  // can to the page.  If more data need to be printed,
		  // then we return true.  If we're done printing
		  // then it should return false to signal the end of
		  // this copy
		  
		  // What's neat is that we don't need to do anything
		  // special to accomodate landscaped printing.  The
		  // printer already provides the functionality, we just
		  // need to account for the width and height of the
		  // page.
		  
		  // The StyledTextPrinter was setup during BeginPrinting
		  // so that we can just use it here as one single object
		  // instead of always needing to recreate it.
		  
		  dim Astr as string
		  
		  g.ForeColor=&c00000000
		  
		  g.DrawRect(1,1,g.Width-1,g.Width-1)
		  
		  g.DrawLine(g.Width/2,0,g.Width/2, g.Height)
		  
		  g.ForeColor=&c93939300
		  g.FillRect(0,0,g.width/2,g.Width/2)
		  
		  g.ForeColor=&c00000000
		  Astr="Printing Rotated Text"
		  
		  
		  dim y as integer = g.Width/2
		  dim x as integer = g.Width/2
		  
		  if CheckFix.Value then
		    
		    if TargetCocoa then
		      y = g.Height-y - pagesetup.PageTop*2 + g.TextHeight/2
		    elseif TargetCarbon then
		      y = g.Height-y 
		    end if
		    
		    
		    g.DrawRotatedTextMBS(0, Astr, x, y, True, 1.0, true)
		    
		  else
		    g.DrawRotatedTextMBS(0, Astr, x, y, True, 1.0, false)
		    
		  end if
		  
		  
		  x = g.Width *3 /4
		  y = g.Width *3 /4
		  
		  if CheckFix.Value then
		    
		    if TargetCocoa then
		      y = g.Height-y - pagesetup.PageTop*2 + g.TextHeight/2
		    elseif TargetCarbon then
		      y = g.Height-y
		    end if
		    
		    
		    g.DrawRotatedTextMBS(0, Astr, x, y, True, 1.0, true)
		    
		  else
		    g.DrawRotatedTextMBS(0, Astr, x, y, True, 1.0, false)
		    
		  end if
		  
		  
		  
		  
		  
		  
		  // If we're done printing, then we will return false,
		  // otherwise we'll return true so we can keep printing
		  // the next piece of information.
		  return false
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		#tag Note
			
			This property is used to render the editfield with
			all its style information directly to the printer
			context.
			
		#tag EndNote
		Protected mStp As StyledTextPrinter
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  // We have a lot of text sitting in the EditField
		  // that we want to print.  What we need to
		  // do now is let the user pick page setup information
		  // as well as printer information.
		  dim pagesetup as new PrinterSetup
		  if not pagesetup.PageSetupDialog( self ) then
		    // The user cancelled, so we should bail out
		    return
		  end
		  
		  // Get a Graphics object from the printer that
		  // the user chooses
		  dim printer as Graphics
		  printer = OpenPrinterDialog( pagesetup, self )
		  
		  // If the user cancelled that dialog, then we want
		  // to bail out.
		  if printer = nil then return
		  
		  // Good!  The user decided to print.  Let's get
		  // all the information we need from the printer
		  // and its setup object and pass it along to our
		  // print function
		  DoPrinting( printer, pagesetup )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  dim Astr as string
		  
		  g.ForeColor=&c00000000
		  
		  g.DrawRect(1,1,g.Width-1,g.Width-1)
		  
		  g.DrawLine(g.Width/2,0,g.Width/2, g.Height)
		  
		  g.ForeColor=&c93939300
		  g.FillRect(0,0,g.width/2,g.Width/2)
		  
		  g.ForeColor=&c00000000
		  Astr="Printing Rotated Text"
		  
		  dim y as integer = g.Width/2
		  dim x as integer = g.Width/2
		  
		  if CheckFix.Value then 
		    // calculate coordinates ourself
		    if TargetCocoa then
		      y = g.Height-y
		    elseif TargetCarbon then
		      y = self.Height-y-canvas1.top
		      x = x + canvas1.Left
		    end if
		    g.DrawRotatedTextMBS(0, Astr, x, y, True, 1.0, true)
		  else
		    // plugin auto mode is not always right due to missing information
		    g.DrawRotatedTextMBS(0, Astr, x, y, True, 1.0, false)
		  end if
		  
		  
		  
		  y = g.Width*3/4
		  x = g.Width*3/4
		  
		  if CheckFix.Value then
		    if TargetCocoa then
		      y = g.Height-y
		    elseif TargetCarbon then
		      y = self.Height-y-canvas1.top
		      x = x + canvas1.Left
		    end if
		    
		    
		    g.DrawRotatedTextMBS(0, Astr, x, y, True, 1.0, true)
		    
		    
		  else
		    g.DrawRotatedTextMBS(0, Astr, x, y, True, 1.0, false)
		    
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckFix
	#tag Event
		Sub Action()
		  canvas1.Invalidate
		  
		End Sub
	#tag EndEvent
#tag EndEvents
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
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="300"
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
		InitialValue="False"
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
#tag EndViewBehavior
