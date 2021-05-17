#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   800
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   863182847
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Text Positions"
   Visible         =   True
   Width           =   600
   Begin CheckBox CheckSplit
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Split text chunks"
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
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   151
   End
   Begin Canvas Canvas1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   754
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   46
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   600
   End
   Begin CheckBox CheckShowPDF
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Show PDF content"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   183
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   1
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   151
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  
		  dim p as new MyDynapdfMBS
		  p.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  call p.CreateNewPDF(Nil)
		  
		  // Skip anything that is not required
		  call p.SetImportFlags p.kifImportAll+p.kifImportAsPage
		  
		  // From which PDF file do you want to extract the images?
		  call p.OpenImportFile(self.file, p.kptOpen, "")
		  
		  // Comment this out if you want to extract the images from specific pages only
		  call p.ImportPDFFile(1, 1.0, 1.0)
		  call p.CloseImportFile
		  
		  dim parser as new MyDynaPDFParseInterfaceMBS(p)
		  
		  'If you want to create a multipage TIFF then create the output image here
		  'and call AddImage() only in the callback function. After the loop
		  'returns call CloseImage() to close the image file.
		  
		  call p.EditPage 1
		  call p.ParseContent(parser, p.kpfNone)
		  call p.EndPage
		  
		  self.texts = parser.Texts
		  self.pdf = p
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function CalcDistance(x1 as double, y1 as Double, x2 as Double, y2 as Double) As Double
		  // Distance between two points
		  
		  dim dx as double = x2-x1
		  dim dy as double = y2-y1
		  
		  return sqrt(dx*dx + dy*dy)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(file as FolderItem)
		  
		  Self.file = file
		  Self.Title = file.DisplayName
		  
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetScaleX(m As DynapdfMatrixMBS) As Double
		  Dim x1 As double= 0.0
		  Dim y1 As double= 0.0
		  Dim x2 As double= 1.0
		  Dim y2 As double= 0.0
		  Transform(m, x1, y1)
		  Transform(m, x2, y2)
		  if (y1 > y2) then
		    return -CalcDistance(x1, y1, x2, y2)
		  else
		    return CalcDistance(x1, y1, x2, y2)
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetScaleY(m As DynapdfMatrixMBS) As Double
		  Dim x1 As double= 0.0
		  Dim y1 As double= 0.0
		  Dim x2 As double= 0.0
		  Dim y2 As double= 1.0
		  Transform(m, x1, y1)
		  Transform(m, x2, y2)
		  if (y1 > y2) then
		    return -CalcDistance(x1, y1, x2, y2)
		  else
		    return CalcDistance(x1, y1, x2, y2)
		  end if
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		file As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		pdf As MyDynaPDFMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		ShowPDF As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h0
		split As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		texts() As PDFText
	#tag EndProperty


#tag EndWindowCode

#tag Events CheckSplit
	#tag Event
		Sub Action()
		  split = me.Value
		  canvas1.Invalidate
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  Const factor = 2.0
		  
		  dim lines() as string
		  dim Page as DynaPDFPageMBS = pdf.GetPage(1)
		  dim bbox as DynaPDFRectMBS = page.BBox(page.kpbMediaBox)
		  dim PageWidth  as integer = bbox.Width
		  Dim PageHeight As Integer = bbox.top - bbox.Bottom
		  
		  if ShowPDF then
		    // we draw pdf as background
		    dim pic as Picture = pdf.RenderPagePicture(1, PageWidth*factor, PageHeight*factor, 2, nil)
		    g.DrawPicture pic, 0, 0
		  end if
		  
		  // now draw text blocks
		  for each t as PDFText in texts
		    
		    dim m as DynaPDFMatrixMBS = t.EffectiveMatrix
		    
		    //XY Axis
		    g.TextSize = GetScaleY(m) * t.State.FontSize * factor
		    
		    If t.KerningA <> Nil Then
		      Dim TextPos As Double = 0
		      For Each k As DynaPDFTextRecordAMBS In t.KerningA
		        // translate native encoding to Unicode
		        Dim decoded As Boolean
		        Dim ktext As String = k.Text
		        
		        TextPos = TextPos - k.Advance
		        
		        Dim TextPosStart As Double = TextPos
		        Dim i As Integer = 0
		        Dim l As Integer = ktext.LenB
		        Dim TextWidth As Double = 0
		        while i < l
		          
		          Dim OldTextPos As Double = TextPos
		          TextWidth = 0
		          dim ProcessedBytes as integer = 0
		          Dim OneText As String = DynaPDFMBS.TranslateRawCode(t.state.FontHandle, kText, i, TextWidth, decoded, t.state.CharSpacing, t.state.WordSpacing, t.State.TextScale, ProcessedBytes)
		          
		          lines.append OneText+": "+Str(width)
		          if width <= 0.0 then
		            Break // something broken?
		          end if
		          
		          If ProcessedBytes <= 0 Then
		            Break // should not happen
		            ProcessedBytes = 1
		          End If
		          
		          TextPos = TextPos + TextWidth
		          
		          // drawing here will not match what DynaPDF draws as we do not take style and spacing in account
		          
		          g.ForeColor = &c00FF00
		          g.PenWidth = 1
		          
		          
		          // calculate all 4 points
		          // top left
		          Dim x1 As Double = OldTextPos
		          Dim y1 As Double = 0.0
		          
		          m.Transform(x1,y1)
		          
		          // bottom left
		          Dim x2 As Double = OldTextPos
		          Dim y2 As Double = t.State.FontSize 
		          
		          m.Transform(x2,y2)
		          
		          // bottom right
		          Dim x3 As Double = TextPos
		          Dim y3 As Double = t.State.FontSize 
		          
		          m.Transform(x3,y3)
		          
		          // top right
		          Dim x4 As Double = TextPos
		          Dim y4 As Double = 0
		          
		          m.Transform(x4,y4)
		          
		          If Split Then
		            
		            // draw rectangle (could be rotated or skewed)
		            g.DrawLine x1*factor, (PageHeight-y1)*factor, x2*factor, (PageHeight-y2)*factor
		            g.DrawLine x2*factor, (PageHeight-y2)*factor, x3*factor, (PageHeight-y3)*factor
		            g.DrawLine x3*factor, (PageHeight-y3)*factor, x4*factor, (PageHeight-y4)*factor
		            g.DrawLine x4*factor, (PageHeight-y4)*factor, x1*factor, (PageHeight-y1)*factor
		          End If
		          
		          
		          g.ForeColor = &c0000FF
		          g.TextSize = CalcDistance(x1,y1,x2,y2)*factor
		          
		          Dim y As Double = Min(y1,y2) // on the bottom side we draw text.
		          Dim x As Double = (x3+x1) / 2.0 // middle of the text block for our text
		          Dim tw As Double = g.StringWidth(OneText)
		          
		          g.DrawString OneText, x * factor - tw/2, (PageHeight-y)*factor
		          
		          i = i + ProcessedBytes
		        wend
		        
		        
		        
		        if not split then
		          // box around
		          g.PenWidth = 1
		          g.ForeColor = &cFF0000
		          
		          // calculate all 4 points
		          // top left
		          Dim x1 As Double = TextPosStart
		          Dim y1 As Double = 0.0
		          
		          m.Transform(x1,y1)
		          
		          // bottom left
		          Dim x2 As Double = TextPosStart
		          Dim y2 As Double = t.State.FontSize 
		          
		          m.Transform(x2,y2)
		          
		          // bottom right
		          Dim x3 As Double = TextPos
		          Dim y3 As Double = t.State.FontSize 
		          
		          m.Transform(x3,y3)
		          
		          // top right
		          Dim x4 As Double = TextPos
		          Dim y4 As Double = 0
		          
		          m.Transform(x4,y4)
		          
		          
		          g.DrawLine x1*factor, (PageHeight-y1)*factor, x2*factor, (PageHeight-y2)*factor
		          g.DrawLine x2*factor, (PageHeight-y2)*factor, x3*factor, (PageHeight-y3)*factor
		          g.DrawLine x3*factor, (PageHeight-y3)*factor, x4*factor, (PageHeight-y4)*factor
		          g.DrawLine x4*factor, (PageHeight-y4)*factor, x1*factor, (PageHeight-y1)*factor
		          
		          
		        end if
		        
		        
		      next
		    end if
		  next
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckShowPDF
	#tag Event
		Sub Action()
		  ShowPDF = me.Value
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
		Name="split"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ShowPDF"
		Visible=false
		Group="Behavior"
		InitialValue="true"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
