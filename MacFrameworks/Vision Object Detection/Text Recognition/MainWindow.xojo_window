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
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1160974335
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Text Recognition"
   Visible         =   True
   Width           =   600
   Begin Canvas PicCanvas
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   291
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   600
   End
   Begin TextArea Output
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
      Height          =   110
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   0
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   0.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   290
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   600
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  
		  Do
		    
		    If obj.FolderItemAvailable Then
		      Dim image As Picture = Picture.Open(obj.FolderItem)
		      
		      performVisionRequest image
		      return
		    End If
		    
		    If obj.PictureAvailable Then
		      Dim image As Picture = obj.Picture
		      
		      performVisionRequest image
		      Return
		    End If
		    
		  Loop Until Not obj.NextItem
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Dim f As FolderItem = FindFile("phototest.tif")
		  If f.Exists Then
		    Dim image As Picture = Picture.Open(f)
		    
		    performVisionRequest image
		  End If
		  
		  
		  Me.AcceptFileDrop "" // all
		  me.AcceptPictureDrop
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub performVisionRequest(pic as Picture)
		  If pic = Nil Then Return
		  Self.pic = pic
		  
		  // lets check for text
		  Dim requests() As VNRequestMBS
		  
		  // Tell Vision to report bounding box around each character.
		  
		  If VNRecognizeTextRequestMBS.available Then
		    // on MacOS 10.15 we can get texts
		    Dim textDetectRequest As New VNRecognizeTextRequestMBS
		    'textDetectRequest.recognitionLevel = textDetectRequest.RecognitionLevelAccurate
		    requests.Append textDetectRequest
		  Else
		    // on MacOS 10.13 or 10.14 we can get text rectangles
		    Dim textDetectRequest As New VNDetectTextRectanglesRequestMBS
		    requests.Append textDetectRequest
		  End If
		  
		  Dim imageRequestHandler As VNImageRequestHandlerMBS = VNImageRequestHandlerMBS.RequestWithPicture(pic)
		  
		  
		  Dim error As NSErrorMBS
		  If imageRequestHandler.performRequests(requests, error) Then
		    
		    // okay
		    
		    
		    Dim w As Integer = pic.Width
		    Dim h As Integer = pic.Height
		    
		    Dim p As New Picture(w, h)
		    Dim g As Graphics = p.Graphics
		    
		    Dim x As Integer = 0
		    Dim y As Integer = 0
		    
		    g.DrawPicture pic, x, y, w, h, 0, 0, w, h
		    
		    Dim parts() As String
		    
		    For Each request As VNRequestMBS In requests
		      
		      Dim results() As VNObservationMBS = request.results
		      
		      For Each result As Variant In results
		        
		        If result IsA VNTextObservationMBS Then
		          
		          Dim r As VNTextObservationMBS = result
		          g.ForeColor = &c0000FF
		          
		          Dim points(0) As Double
		          
		          points.Append x +     (w * r.topLeft.X)
		          points.Append y + h - (h * r.topLeft.Y)
		          points.Append x +     (w * r.topRight.X)
		          points.Append y + h - (h * r.topRight.Y)
		          points.Append x +     (w * r.bottomRight.X)
		          points.Append y + h - (h * r.bottomRight.Y)
		          points.Append x +     (w * r.bottomLeft.X)
		          points.Append y + h - (h * r.bottomLeft.Y)
		          
		          g.DrawPolygon points
		          
		          
		        Elseif result IsA VNRecognizedTextObservationMBS Then
		          
		          Dim r As VNRecognizedTextObservationMBS = result
		          g.ForeColor = &c0000FF
		          
		          Dim points(0) As Double
		          
		          points.Append x +     (w * r.topLeft.X)
		          points.Append y + h - (h * r.topLeft.Y)
		          points.Append x +     (w * r.topRight.X)
		          points.Append y + h - (h * r.topRight.Y)
		          points.Append x +     (w * r.bottomRight.X)
		          points.Append y + h - (h * r.bottomRight.Y)
		          points.Append x +     (w * r.bottomLeft.X)
		          points.Append y + h - (h * r.bottomLeft.Y)
		          
		          g.DrawPolygon points
		          
		          // try to guess a good text size
		          Dim th As Integer = Abs(r.topLeft.Y - r.bottomLeft.Y)*h
		          g.TextSize = th
		          
		          Dim px As Integer = x +     (w * (r.topLeft.X))
		          Dim py As Integer = y + h - (h * (r.topLeft.Y+r.bottomRight.Y)/2)
		          
		          Dim s As String = r.String
		          
		          g.DrawString s, px, py+th/2
		          parts.Append s
		          
		        End If
		      Next
		    Next
		    
		    self.pic = p
		    output.Text = Join(parts, EndOfLine)
		    
		  Else
		    
		    MsgBox error.LocalizedDescription
		  End If
		  
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		pic As Picture
	#tag EndProperty


#tag EndWindowCode

#tag Events PicCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If pic <> Nil Then
		    
		    Dim faktor As Double = Min( g.height / Pic.Height, g.Width / Pic.Width)
		    
		    // Calculate new size
		    Dim w As Integer = Pic.Width * faktor
		    Dim h As Integer = Pic.Height * faktor
		    
		    Dim x As Integer = (g.width - w)/2
		    Dim y As Integer = (g.height - h)/2
		    
		    g.DrawPicture pic, x, y, w, h, 0, 0, pic.Width, pic.Height
		  End If
		  
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
		Name="pic"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
