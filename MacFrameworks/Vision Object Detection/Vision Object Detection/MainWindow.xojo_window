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
   MenuBar         =   513933311
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Vision Object Detection"
   Visible         =   True
   Width           =   910
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   True
      ColumnWidths    =   "30%"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   402
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Key	Value"
      Italic          =   False
      Left            =   -1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   -1
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   462
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Canvas Output
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   401
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   461
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   -1
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   449
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

	#tag Event
		Sub Resized()
		  redraw
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddObjectRow(title as string, info as string, v as Variant)
		  List.AddFolder title
		  List.cell(List.LastIndex,1) = info
		  List.RowTag(List.LastIndex) = v
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function createVisionRequests() As VNRequestMBS()
		  Dim requests() As VNRequestMBS
		  
		  requests.append New VNDetectFaceRectanglesRequestMBS(WeakAddressOf RequestCompleted)
		  requests.append New VNDetectFaceLandmarksRequestMBS(WeakAddressOf RequestCompleted)
		  Requests.Append New VNDetectHumanRectanglesRequestMBS(WeakAddressOf RequestCompleted)
		  
		  
		  Dim barcodeDetectRequest As New VNDetectBarcodesRequestMBS(WeakAddressOf RequestCompleted)
		  
		  
		  // Restrict detection to most common symbologies.
		  Dim symbologies() As String
		  symbologies.append VNBarcodeObservationMBS.VNBarcodeSymbologyQR
		  symbologies.append VNBarcodeObservationMBS.VNBarcodeSymbologyAztec
		  symbologies.append VNBarcodeObservationMBS.VNBarcodeSymbologyUPCE
		  
		  barcodeDetectRequest.setSymbologies symbologies
		  requests.append barcodeDetectRequest
		  
		  
		  
		  Dim rectDetectRequest As New VNDetectRectanglesRequestMBS(WeakAddressOf RequestCompleted)
		  // Customize & configure the request to detect only certain rectangles.
		  rectDetectRequest.maximumObservations = 8 // Vision currently supports up to 16.
		  rectDetectRequest.minimumConfidence = 0.6 // Be confident.
		  rectDetectRequest.minimumAspectRatio = 0.3 // height / width
		  requests.append rectDetectRequest
		  
		  
		  // text
		  
		  If VNRecognizeTextRequestMBS.available Then
		    
		    // text for 10.15
		    Dim textDetectRequest As New VNRecognizeTextRequestMBS(WeakAddressOf RequestCompleted)
		    requests.append textDetectRequest
		    
		  else
		    
		    // just text rectangles for 10.13/10.14
		    Dim textDetectRequest As New VNDetectTextRectanglesRequestMBS(WeakAddressOf RequestCompleted)
		    requests.append textDetectRequest
		  End If
		  
		  
		  // classify
		  
		  If VNClassifyImageRequestMBS.available Then
		    
		    Requests.Append New VNClassifyImageRequestMBS(WeakAddressOf RequestCompleted)
		  End If
		  
		  
		  
		  If VNRecognizeAnimalsRequestMBS.available Then
		    
		    Requests.Append New VNRecognizeAnimalsRequestMBS(WeakAddressOf RequestCompleted)
		  End If
		  
		  Return requests
		  
		End Function
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
		Function ListPoints(n as VNFaceLandmarkRegion2DMBS) As string
		  If n = Nil Then
		    Return "n/a"
		  End If
		  
		  
		  
		  
		  Dim points() As CGPointMBS
		  
		  If pic <> Nil Then
		    // coordinates in picture space
		    points = n.pointsInImageOfSize(New CGSizeMBS(pic.Width, pic.Height))
		    
		  Else
		    // 0.0 to 1.0 normalized coordinates
		    'points = n.normalizedPoints
		    
		  end if
		  
		  Dim result() As String
		  
		  For Each point As CGPointMBS In points
		    
		    result.Append Str(point.x) + "/" + Str(point.y)
		    
		  Next
		  
		  
		  Return Join(result, ", ")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub performRequestsCompleted(Requests() as VNRequestMBS, result as boolean, error as NSErrorMBS, tag as Variant)
		  
		  If result Then
		    list.AddRow "performRequests succeeded."
		  Else
		    list.AddRow "performRequests failed."
		  End If
		  
		  If error <> Nil Then
		    List.AddRow "Error", error.LocalizedDescription
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub performVisionRequest(pic as Picture)
		  
		  Self.pic = pic
		  
		  Dim requests() As VNRequestMBS = createVisionRequests
		  Dim imageRequestHandler As VNImageRequestHandlerMBS = VNImageRequestHandlerMBS.RequestWithPicture(pic)
		  
		  list.DeleteAllRows
		  Redim Observations(-1)
		  
		  Dim error As NSErrorMBS
		  list.AddRow "performRequests..."
		  
		  If False Then
		    // run async on background thread
		    
		    imageRequestHandler.performRequestsAsync(requests, WeakAddressOf performRequestsCompleted)
		    
		    
		  else
		    // sync
		    Dim result As Boolean = imageRequestHandler.performRequests(requests, error)
		    
		    
		    If result Then
		      list.AddRow "performRequests succeeded."
		    Else
		      list.AddRow "performRequests failed."
		    End If
		    
		    If error <> Nil Then
		      List.AddRow "Error", error.LocalizedDescription
		    End If
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Redraw()
		  If pic <> Nil Then
		    
		    Dim OutputWidth As Integer = output.Width
		    Dim OutputHeight As Integer = output.Height
		    
		    Dim p As New Picture(outputWidth, outputHeight)
		    
		    Dim faktor As Double = Min( OutputHeight / Pic.Height, OutputWidth / Pic.Width)
		    
		    // Calculate new size
		    Dim w As Integer = Pic.Width * faktor
		    Dim h As Integer = Pic.Height * faktor
		    
		    Dim g As Graphics = p.Graphics
		    Dim x As Integer = (g.width - w)/2
		    Dim y As Integer = (g.height - h)/2
		    
		    g.DrawPicture pic, x, y, w, h, 0, 0, pic.Width, pic.Height
		    
		    g.PenWidth = 3
		    g.PenHeight = 3
		    
		    For Each Observation As Variant In Observations
		      
		      If Observation IsA VNRectangleObservationMBS Then
		        
		        // show rectangles
		        Dim r As VNRectangleObservationMBS = Observation
		        If Observation IsA VNBarcodeObservationMBS Then
		          
		          // draw in blue
		          g.ForeColor = &c0000FF
		        Elseif Observation IsA VNTextObservationMBS Then
		          // draw in violett
		          g.ForeColor = &cFF00FF
		        Else
		          // normal rectangle
		          g.ForeColor = &cFF0000
		        End If
		        
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
		        
		      End If
		      
		      If Observation IsA VNFaceObservationMBS Then
		        Dim r As VNFaceObservationMBS = Observation
		        
		        // show eyes for a face
		        Dim vf As Variant = r.landmarks
		        If vf IsA VNFaceLandmarks2DMBS Then
		          
		          Dim size As New CGSizeMBS(w,h)
		          
		          g.PenWidth = 1
		          g.PenHeight = 1
		          
		          Dim l As VNFaceLandmarks2DMBS = vf
		          Dim LeftEye As VNFaceLandmarkRegion2DMBS = l.leftEye
		          If leftEye <> Nil Then
		            Dim LeftEyePoints() As CGPointMBS = leftEye.pointsInImageOfSize(size)
		            
		            For Each pp As CGPointMBS In LeftEyePoints
		              g.ForeColor = &cFF0000
		              
		              Dim px As Double = x +     (pp.X)
		              Dim py As Double = y + h - (pp.Y)
		              
		              g.DrawOval px-2, py-2, 5, 5
		              
		            Next
		            
		          End If
		          
		          Dim rightEye As VNFaceLandmarkRegion2DMBS = l.rightEye
		          If rightEye <> Nil Then
		            Dim rightEyePoints() As CGPointMBS = rightEye.pointsInImageOfSize(size)
		            
		            For Each pp As CGPointMBS In rightEyePoints
		              g.ForeColor = &c0000FF
		              
		              Dim px As Double = x +     (pp.X)
		              Dim py As Double = y + h - (pp.Y)
		              
		              g.DrawOval px-2, py-2, 5, 5
		              
		            Next
		            
		          End If
		        End If
		      End If
		      
		    Next
		    
		    output.Backdrop = p
		    
		  Else
		    output.Backdrop = Nil
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestCompleted(request as VNRequestMBS, error as NSErrorMBS, tag as Variant)
		  If error <> Nil Then
		    List.AddRow request.className+" failed"
		    AddObjectRow "Error", error.LocalizedDescription, error
		  Else
		    List.AddRow request.className+" succeeded"
		    
		  End If
		  
		  Dim results() As VNObservationMBS = request.results
		  
		  If results.Ubound >= 0 Then
		    For Each result As VNObservationMBS In results
		      
		      If result.Confidence > 0.5 Then
		        
		        AddObjectRow result.classname, result.UUID, result
		        
		        Observations.Append result
		      Else
		        // ignore bad things like low level classifications
		      End If
		    Next
		    
		    Redraw
		  End If
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Observations() As VNObservationMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		Pic As Picture
	#tag EndProperty


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub ExpandRow(row As Integer)
		  Dim v As Variant = Me.RowTag(row)
		  
		  If v <> Nil Then
		    
		    If v IsA VNObservationMBS Then
		      
		      Dim o As VNObservationMBS = v
		      List.AddRow "Confidence", Str(o.Confidence)
		      
		    End If
		    
		    If v IsA VNClassificationObservationMBS Then
		      
		      Dim o As VNClassificationObservationMBS = v
		      List.AddRow "identifier", o.identifier
		      
		    end if
		    
		    If v IsA VNRecognizedObjectObservationMBS Then
		      
		      Dim o As VNRecognizedObjectObservationMBS = v
		      Dim labels() As VNClassificationObservationMBS = o.labels
		      
		      List.AddRow "recognized objects", Str(labels.Ubound+1)+" classifications"
		      
		      For Each label As VNClassificationObservationMBS In o.labels
		        If label.Confidence > 0.5 Then
		          List.AddRow "identifier", label.identifier
		        Else
		          // skip all others
		        End If
		      Next
		    End If
		    
		    
		    
		    If v IsA VNRectangleObservationMBS Then
		      
		      Dim r As VNRectangleObservationMBS = v
		      
		      List.AddRow "topLeft", Str(r.topLeft.X)+"/"+Str(r.topLeft.Y)
		      List.AddRow "topRight", Str(r.topRight.X)+"/"+Str(r.topRight.Y)
		      List.AddRow "bottomLeft", Str(r.bottomLeft.X)+"/"+Str(r.bottomLeft.Y)
		      List.AddRow "bottomRight", Str(r.bottomRight.X)+"/"+Str(r.bottomRight.Y)
		      
		    End If
		    
		    
		    If v IsA VNBarcodeObservationMBS Then
		      
		      Dim r As VNBarcodeObservationMBS = v
		      
		      List.AddRow "symbology", r.symbology
		      List.AddRow "payloadStringValue", r.payloadStringValue
		      
		    End If
		    
		    If v IsA VNRecognizedTextObservationMBS Then
		      
		      Dim r As VNRecognizedTextObservationMBS = v
		      
		      List.AddRow "String", r.String
		      
		      'Dim canditates() As VNRecognizedTextMBS = r.topCandidates(1)
		      'If canditates.Ubound >= 0 Then
		      'List.AddRow "String", canditates(0).String
		      'End If
		      
		    End If
		    
		    If v IsA VNFaceObservationMBS then
		      Dim r As VNFaceObservationMBS = v
		      
		      Dim landmarks As Variant = r.landmarks
		      If landmarks IsA VNFaceLandmarks2DMBS Then
		        Dim landmarks2D As VNFaceLandmarks2DMBS = landmarks
		        
		        List.AddRow "allPoints", ListPoints(landmarks2D.allPoints)
		        List.AddRow "faceContour", ListPoints(landmarks2D.faceContour)
		        List.AddRow "innerLips", ListPoints(landmarks2D.innerLips)
		        List.AddRow "leftEye", ListPoints(landmarks2D.leftEye)
		        List.AddRow "leftEyebrow", ListPoints(landmarks2D.leftEyebrow)
		        List.AddRow "leftPupil", ListPoints(landmarks2D.leftPupil)
		        List.AddRow "medianLine", ListPoints(landmarks2D.medianLine)
		        List.AddRow "nose", ListPoints(landmarks2D.nose)
		        List.AddRow "noseCrest", ListPoints(landmarks2D.noseCrest)
		        List.AddRow "outerLips", ListPoints(landmarks2D.outerLips)
		        List.AddRow "rightEye", ListPoints(landmarks2D.rightEye)
		        List.AddRow "rightEyebrow", ListPoints(landmarks2D.rightEyebrow)
		        List.AddRow "rightPupil", ListPoints(landmarks2D.rightPupil)
		        
		        
		      End If
		      
		    End If
		    
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
		Name="Pic"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
