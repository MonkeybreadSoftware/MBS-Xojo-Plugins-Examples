#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   969
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   118995918
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Wiki to PDF"
   Visible         =   True
   Width           =   891
   Begin HTMLViewer web
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   907
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Renderer        =   0
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   42
      Transparent     =   True
      Visible         =   True
      Width           =   851
   End
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   1000
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
   Begin CheckBox CheckBox1
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Quit soon"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      State           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   10
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   100
   End
   Begin Label StaticText1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   456
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "© 2010 by Monkeybread Software. Requires Mac OS X."
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   10
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   415
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  System.DebugLog "Start..."
		  
		  URLsTodo = new StringHashSetMBS
		  URLsDone = new StringHashSetMBS
		  
		  // read redirects
		  System.DebugLog "Read Redirects..."
		  ReadRedirects
		  LoadRedirects
		  
		  
		  // make webpages smaller
		  web.setPageSizeMultiplierMBS 0.7
		  
		  // start here always
		  System.DebugLog "AddURL..."
		  AddURL "http://docs.realsoftware.com/index.php/Main_Page"
		  
		  // load processed urls from existing PDF files
		  // so you can quit this app and continue later
		  
		  // 1. URLs we already downloaded
		  dim folder as FolderItem = SpecialFolder.Desktop.Child("pdf files")
		  folder.CreateAsFolder
		  
		  System.DebugLog "Read URLs..."
		  
		  dim c as integer = folder.Count
		  for i as integer = 1 to c
		    dim file as FolderItem = folder.TrueItem(i)
		    
		    if file<>Nil then
		      if Right(file.Name,4)=".txt" then
		        dim t as TextInputStream = file.OpenAsTextFile
		        
		        if t<>Nil then
		          dim url as string = t.ReadLine(encodings.UTF8)
		          URLsDone.insert url
		        end if
		      end if
		      
		    end if
		  next
		  
		  
		  System.DebugLog "Read URLs from PDF files..."
		  
		  // than find URLs we need to download
		  for i as integer = 1 to c
		    dim file as FolderItem = folder.TrueItem(i)
		    
		    if file<>Nil then
		      if Right(file.Name,4)=".pdf" then
		        LoadURLs file
		      end if
		      
		    end if
		  next
		  
		  
		  WriteURLsDone
		  WriteURLsTodo
		  
		  System.DebugLog "Loading websites..."
		  timer1.Mode=2
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddURL(s as string)
		  s = NthField(S,"#",1) // remove right part of URLs
		  
		  // must be part of wiki
		  const k1 = "http://docs.realsoftware.com/index.php/"
		  if left(s,len(k1))<>k1 then
		    Return 
		  end if
		  
		  // no file pages
		  const k2 = "http://docs.realsoftware.com/index.php/File:"
		  if left(s, len(k2)) = k2 then
		    Return
		  end if
		  
		  // no user pages
		  const k3 = "http://docs.realsoftware.com/index.php/User:"
		  if left(s, len(k3)) = k3 then
		    Return
		  end if
		  
		  // no help pages
		  const k6 = "http://docs.realsoftware.com/index.php/Help:"
		  if left(s, len(k6)) = k6 then
		    Return
		  end if
		  
		  // no template pages
		  const k4 = "http://docs.realsoftware.com/index.php/Template:"
		  if left(s, len(k4)) = k4 then
		    Return
		  end if
		  
		  // no wiki help pages
		  const k5 = "http://docs.realsoftware.com/index.php/MediaWiki:"
		  if left(s, len(k5)) = k5 then
		    Return
		  end if
		  
		  // if not already in one of the lists
		  if URLsDone.find(s).isEqual(URLsDone.last) then
		    if URLsTodo.find(s).isEqual(URLsTodo.last) then
		      
		      // add it to todo list
		      URLsTodo.insert s
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFileForURL(url as string) As FolderItem
		  
		  dim name as string = GetFileNameForURL(url) + ".pdf"
		  
		  dim folder as FolderItem = SpecialFolder.Desktop.Child("pdf files")
		  dim file as FolderItem = folder.Child(name)
		  
		  
		  Return file
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFileNameForURL(url as string) As string
		  dim name as string = url
		  
		  if left(name,7)="http://" then
		    name = mid(name,8)
		  end if
		  
		  
		  name = ReplaceAll(name,"/", " ")
		  name = ReplaceAll(name,":", " ")
		  
		  Return name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadRedirects()
		  // Read duplicates list to avoid duplicates in PDFs
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("redirect")
		  dim t as TextInputStream = f.OpenAsTextFile
		  
		  if t = nil then Return
		  
		  dim tab as string = encodings.ASCII.Chr(9)
		  
		  while not t.EOF
		    dim line as string = t.ReadLine(encodings.ASCII)
		    
		    dim l as string = NthField(line, tab, 1)
		    dim r as string = NthField(line, tab, 2)
		    
		    if len(r)>0 then
		      URLsDone.insert "http://docs.realsoftware.com/index.php/"+l
		      
		      'addurl "http://docs.realsoftware.com/index.php/"+r
		    end if
		    
		  wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadURLs(file as FolderItem)
		  dim pdf as new MyDynapdfMBS
		  
		  ' pdf.SetLicenseKey "Lite" // Add your license key here
		  
		  call pdf.CreateNewPDF nil
		  
		  dim template1 as integer = pdf.OpenImportFile(file, 0, "")
		  call pdf.ImportPDFFile(1, 1.0, 1.0)
		  
		  
		  
		  dim c as integer = pdf.GetAnnotCount
		  
		  for i as integer = 0 to c-1
		    dim a as DynaPDFAnnotationExMBS = pdf.GetAnnotEx(i)
		    dim URL as string = a.DestFile
		    
		    AddURL url
		  next
		  
		  call pdf.CloseImportFile
		  call pdf.CloseFile
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReadRedirects()
		  // Read duplicates list to avoid duplicates in PDFs
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("redirect")
		  dim t as TextOutputStream = f.CreateTextFile
		  dim HTTPSocket as new HTTPSocket
		  dim s as string = HTTPSocket.get("http://docs.realsoftware.com/index.php?title=Special:ListRedirects&limit=999&offset=0", 30)
		  
		  const k1 = "<ol start='1' class='special'>"
		  dim pos1 as integer = instr(s,k1)
		  const k2 = "</ol>"
		  dim pos2 as integer = instr(pos1, s,k2)
		  
		  s = mid(s, pos1, pos2-pos1)
		  
		  dim lines(-1) as string = split(s,"<li>")
		  
		  for each line as string in lines
		    
		    // <li><a href="/index.php?title=UsersGuide:Chapter14:Microsoft_Office_Automation&amp;redirect=no" class="mw-redirect"
		    // title="UsersGuide:Chapter14:Microsoft Office Automation">UsersGuide:Chapter14:Microsoft Office Automation</a> →‎
		    // <a href="/index.php/UsersGuide:Chapter_14:Microsoft_Office_Automation" 
		    // title="UsersGuide:Chapter 14:Microsoft Office Automation">UsersGuide:Chapter 14:Microsoft Office Automation</a></li>
		    
		    const k3 = "href="""
		    const k4 = "&amp;redirect=no"
		    const k5 = "href="""
		    const k6 = """"
		    
		    dim p1 as integer = instr(line, k3)
		    dim p2 as integer = instr(p1+len(k3),line, k4)
		    dim p3 as integer = instr(p2+1,line, k5)
		    dim p4 as integer = instr(p3+len(k5),line, k6)
		    
		    if p1>0 and p2>p1 and p3>p2 and p4>p3 then
		      
		      dim s1 as string = mid(line, p1+len(k3), p2-p1-len(k3))
		      dim s2 as string = mid(line, p3+len(k5), p4-p3-len(k5))
		      
		      const k7 = "/index.php?title="
		      const k8 = "/index.php/"
		      
		      if left(s1,len(k7))=k7 then
		        s1 = mid(S1, len(k7)+1)
		      elseif left(s1,len(k8))=k8 then
		        s1 = mid(S1, len(k8)+1)
		      end if
		      
		      if left(s2,len(k7))=k7 then
		        s2 = mid(S2, len(k7)+1)
		      elseif left(s2,len(k8))=k8 then
		        s2 = mid(S2, len(k8)+1)
		      end if
		      
		      'redirectFrom.append s1
		      'redirectTo.append s2
		      
		      t.WriteLine ConvertEncoding(s1+chr(9)+s2, encodings.UTF8)
		      
		      'URLsDone.Append "http://docs.realsoftware.com/index.php/"+s1
		      
		    end if
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteURL(url as string)
		  
		  dim name as string = GetFileNameForURL(url) + ".txt"
		  
		  dim folder as FolderItem = SpecialFolder.Desktop.Child("pdf files")
		  folder.CreateAsFolder
		  dim file as FolderItem = folder.Child(name)
		  
		  dim t as TextOutputStream = file.CreateTextFile
		  
		  if t = nil then
		    t = file.CreateTextFile
		  end if
		  
		  if t = nil then
		    MsgBox "If you come here, please quit app and restart again."
		    quit
		  else
		    t.Writeline ConvertEncoding(url,encodings.UTF8)
		    t.close
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteURLsDone()
		  // for debbuging...
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("URLs Done")
		  dim t as TextOutputStream = f.CreateTextFile
		  
		  for each url as string in URLsDone.Keys
		    t.WriteLine url
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteURLsTodo()
		  // for debbuging...
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("URLs Todo")
		  dim t as TextOutputStream = f.CreateTextFile
		  
		  for each url as string in URLsTodo.Keys
		    t.WriteLine url
		  next
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		count As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		currentURL As string
	#tag EndProperty

	#tag Property, Flags = &h0
		mode As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		URLsDone As StringHashSetMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		URLsTodo As StringHashSetMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events web
	#tag Event
		Sub DocumentComplete(url as String)
		  // if the page is all white, we had an error and try again
		  
		  dim p as Picture = self.ScreenshotWindowRectMBS(me.left, me.top, me.Width, me.Height)
		  
		  if p<>nil then
		    dim c as integer = p.CountColorMBS(&cFFFFFF)
		    System.DebugLog "CountColorMBS: "+str(c)
		    
		    if c > p.Width*p.Height*0.95 then
		      
		      mode = 6
		      Return
		      
		    end if
		    
		  else
		    System.DebugLog "Picture is nil."
		  end if
		  
		  if mode = 1 then // everything okay
		    mode = 2
		  end if
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  Select case mode
		  case 0
		    // next run?
		    
		    if CheckBox1.Value then
		      me.Mode = 0
		      quit
		    end if
		    
		    if URLsTodo.Count = 0 then
		      me.Mode = 0
		      beep
		      MsgBox "Done."
		      Return
		    end if
		    
		    // download next page
		    mode = 1
		    
		    dim it as StringHashSetIteratorMBS = URLsTodo.first
		    currentURL = it.Key
		    URLsTodo.Remove it
		    
		    System.DebugLog currentURL
		    web.LoadURL currentURL
		    
		  case 1
		    // waiting
		    
		  case 2
		    
		    // write URL file and PDF file
		    CurrentFile = GetFileForURL(currentURL)
		    
		    WriteURL currentURL
		    
		    call web.PrintToPDFFileMBS(CurrentFile)
		    
		    URLsDone.insert currentURL
		    mode = 3
		    
		  case 3
		    
		    // process PDF file
		    LoadURLs CurrentFile
		    
		    mode = 0
		    
		  case 6
		    
		    // this is for the case the web page was blank and we try again
		    mode = 1
		    web.LoadURL currentURL
		    
		  end Select
		  
		  
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
		Name="mode"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="currentURL"
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
