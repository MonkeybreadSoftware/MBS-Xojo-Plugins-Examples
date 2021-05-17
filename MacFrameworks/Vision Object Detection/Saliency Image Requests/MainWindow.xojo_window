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
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   734687231
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Saliency Image Requests"
   Visible         =   True
   Width           =   900
   Begin Canvas Canvas1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   400
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   300
   End
   Begin Canvas Canvas2
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   400
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   300
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   300
   End
   Begin Canvas Canvas3
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   400
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   600
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   300
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
		  Dim f As FolderItem = FindFile("card.jpg")
		  If f.Exists Then
		    Dim image As Picture = Picture.Open(f)
		    
		    performVisionRequest image
		  End If
		  
		  
		  Me.AcceptFileDrop "" // all
		  me.AcceptPictureDrop
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AttentionBasedSSaliencyImageCompleted(request as VNRequestMBS, error as NSErrorMBS, tag as Variant)
		  If error <> Nil Then
		    MsgBox error.LocalizedDescription
		  End If
		  
		  
		  Dim results() As VNObservationMBS = request.results
		  
		  If results.Ubound >= 0 Then
		    
		    Dim v As Variant = results(0)
		    
		    If v IsA VNSaliencyImageObservationMBS Then
		      Dim r As VNSaliencyImageObservationMBS = v
		      
		      Dim ci As CIImageMBS = r.CIImage
		      
		      pic3 = ci.RenderPicture
		      canvas3.Invalidate
		    Else
		      break
		    End If
		    
		  Else
		    Break
		  End If
		  
		  
		End Sub
	#tag EndMethod

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
		Sub ObjectnessBasedSaliencyImageCompleted(request as VNRequestMBS, error as NSErrorMBS, tag as Variant)
		  If error <> Nil Then
		    MsgBox error.LocalizedDescription
		  End If
		  
		  
		  Dim results() As VNObservationMBS = request.results
		  
		  If results.Ubound >= 0 Then
		    
		    Dim v As Variant = results(0)
		    
		    If v IsA VNSaliencyImageObservationMBS Then
		      Dim r As VNSaliencyImageObservationMBS = v
		      
		      Dim ci As CIImageMBS = r.CIImage
		      
		      pic2 = ci.RenderPicture
		      canvas2.Invalidate
		    Else
		      Break
		    End If
		    
		  Else
		    Break
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub performVisionRequest(pic as Picture)
		  
		  Self.pic1 = pic
		  canvas1.Invalidate
		  
		  Dim requests() As VNRequestMBS 
		  
		  requests.Append New VNGenerateObjectnessBasedSaliencyImageRequestMBS(WeakAddressOf ObjectnessBasedSaliencyImageCompleted)
		  requests.Append New VNGenerateAttentionBasedSaliencyImageRequestMBS (WeakAddressOf AttentionBasedSSaliencyImageCompleted)
		  
		  
		  Dim imageRequestHandler As VNImageRequestHandlerMBS = VNImageRequestHandlerMBS.RequestWithPicture(pic)
		  
		  
		  // sync
		  Dim error As NSErrorMBS
		  Dim result As Boolean = imageRequestHandler.performRequests(requests, error)
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		pic1 As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		pic2 As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		pic3 As Picture
	#tag EndProperty


#tag EndWindowCode

#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If pic1 <> Nil Then
		    
		    Dim faktor As Double = Min( g.height / Pic1.Height, g.Width / Pic1.Width)
		    
		    // Calculate new size
		    Dim w As Integer = Pic1.Width * faktor
		    Dim h As Integer = Pic1.Height * faktor
		    
		    Dim x As Integer = (g.width - w)/2
		    Dim y As Integer = (g.height - h)/2
		    
		    g.DrawPicture pic1, x, y, w, h, 0, 0, pic1.Width, pic1.Height
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas2
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If pic2 <> Nil Then
		    
		    Dim faktor As Double = Min( g.height / Pic2.Height, g.Width / Pic2.Width)
		    
		    // Calculate new size
		    Dim w As Integer = pic2.Width * faktor
		    Dim h As Integer = pic2.Height * faktor
		    
		    Dim x As Integer = (g.width - w)/2
		    Dim y As Integer = (g.height - h)/2
		    
		    g.DrawPicture pic2, x, y, w, h, 0, 0, pic2.Width, pic2.Height
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas3
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If pic3 <> Nil Then
		    
		    Dim faktor As Double = Min( g.height / Pic3.Height, g.Width / Pic3.Width)
		    
		    // Calculate new size
		    Dim w As Integer = pic3.Width * faktor
		    Dim h As Integer = pic3.Height * faktor
		    
		    Dim x As Integer = (g.width - w)/2
		    Dim y As Integer = (g.height - h)/2
		    
		    g.DrawPicture pic3, x, y, w, h, 0, 0, pic3.Width, pic3.Height
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
		Name="pic1"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="pic2"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="pic3"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
