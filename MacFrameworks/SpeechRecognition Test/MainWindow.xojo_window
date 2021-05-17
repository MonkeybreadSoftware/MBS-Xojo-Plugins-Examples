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
   MenuBar         =   280399871
   MenuBarVisible  =   True
   MinHeight       =   400
   MinimizeButton  =   True
   MinWidth        =   600
   Placement       =   0
   Resizeable      =   True
   Title           =   "SpeechRecognition Test"
   Visible         =   True
   Width           =   600
   Begin PushButton RequestButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Request Permissions"
      Default         =   False
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   153
   End
   Begin Label AuthStatus
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
      Left            =   185
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   False
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
      Height          =   328
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Key	Value"
      Italic          =   False
      Left            =   20
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton OpenButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Recognize File..."
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   427
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   153
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  CheckStatus
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CheckStatus()
		  Dim status As Integer = SFSpeechRecognizerMBS.authorizationStatus
		  
		  Select Case status
		    
		  Case SFSpeechRecognizerMBS.kAuthorizationStatusAuthorized
		    
		    RequestButton.Enabled = False
		    AuthStatus.Text = "Authorized"
		    
		    
		    list.DeleteAllRows
		    
		    Dim supportedLocales() As NSLocaleMBS = SFSpeechRecognizerMBS.supportedLocales
		    
		    For Each locale As NSLocaleMBS In supportedLocales
		      List.AddRow locale.Identifier, locale.displayName(NSLocaleMBS.NSLocaleIdentifier, locale.Identifier)
		      List.RowTag(List.LastIndex) = locale
		    Next
		    
		  Case SFSpeechRecognizerMBS.kAuthorizationStatusDenied
		    
		    RequestButton.Enabled = False
		    AuthStatus.Text = "Denied"
		    
		  Case SFSpeechRecognizerMBS.kAuthorizationStatusNotDetermined
		    
		    RequestButton.Enabled = True
		    AuthStatus.Text = "Not Determined"
		    
		  Case SFSpeechRecognizerMBS.kAuthorizationStatusRestricted
		    
		    RequestButton.Enabled = False
		    AuthStatus.Text = "Restricted"
		    
		  Else
		    Break
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub recognitionTaskWithRequestCompleted(request as SFSpeechRecognitionRequestMBS, result as SFSpeechRecognitionResultMBS, error as NSErrorMBS, tag as Variant)
		  If error <> Nil Then
		    MsgBox error.LocalizedDescription
		  End If
		  
		  List.AddItem "request", request
		  List.AddItem "result", result
		  List.AddItem "error", error
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub requestAuthorizationCompletedMBS(status as integer, tag as Variant)
		  CheckStatus
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		recognizer As MySFSpeechRecognizer
	#tag EndProperty

	#tag Property, Flags = &h0
		request As SFSpeechURLRecognitionRequestMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events RequestButton
	#tag Event
		Sub Action()
		  SFSpeechRecognizerMBS.requestAuthorization AddressOf requestAuthorizationCompletedMBS
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events List
	#tag Event
		Sub ExpandRow(row As Integer)
		  Dim v As Variant = Me.RowTag(row)
		  
		  If v <> Nil Then
		    
		    If v IsA SFTranscriptionMBS Then
		      
		      Dim r As SFTranscriptionMBS = v
		      
		      List.AddRow "averagePauseDuration", Str(r.averagePauseDuration)
		      List.AddRow "formattedString", r.formattedString
		      List.AddRow "speakingRate", Str(r.speakingRate)
		      
		      Dim segments() As SFTranscriptionSegmentMBS = r.segments
		      
		      Dim u As Integer = segments.Ubound
		      For i As Integer = 0 To u
		        Dim segment As SFTranscriptionSegmentMBS = segments(i)
		        
		        List.AddItem "Segment "+Str(i), segment
		        
		      Next
		      
		    End If
		    
		    
		    If v IsA SFTranscriptionSegmentMBS Then
		      
		      Dim r As SFTranscriptionSegmentMBS = v
		      
		      List.AddRow "timestamp", Str(r.timestamp)
		      List.AddRow "duration", Str(r.duration)
		      List.AddRow "substring", r.substring
		      List.AddRow "substringRange", r.substringRange.String
		      List.AddRow "confidence", Str(r.confidence)
		      List.AddRow "alternativeSubstrings", Join(r.alternativeSubstrings, ", ")
		      List.Additem "voiceAnalytics", r.voiceAnalytics
		      
		    End If
		    
		    If v IsA SFVoiceAnalyticsMBS Then
		      
		      Dim r As SFVoiceAnalyticsMBS = v
		      
		      List.AddItem "jitter", r.jitter
		      List.AddItem "pitch", r.pitch
		      List.AddItem "shimmer", r.shimmer
		      List.AddItem "voicing", r.voicing
		      
		    End If
		    
		    
		    If v IsA SFAcousticFeatureMBS Then
		      
		      Dim r As SFAcousticFeatureMBS = v
		      
		      List.AddItem "frameDuration", r.frameDuration
		      
		      Dim values() As String
		      Dim numbers() As Double = r.acousticFeatureValuePerFrame
		      For Each number As Double In numbers
		        values.Append Str(number)
		      next
		      
		      List.AddItem "acousticFeatureValuePerFrame", Join(values, ", ")
		      
		    End If
		    
		    
		    If v IsA SFSpeechRecognitionResultMBS Then
		      
		      Dim r As SFSpeechRecognitionResultMBS = v
		      
		      List.AddRow "final", Str(r.final)
		      List.AddItem "bestTranscription", r.bestTranscription
		      
		      Dim Transcriptions() As SFTranscriptionMBS = r.transcriptions
		      
		      Dim u As Integer = Transcriptions.Ubound
		      For i As Integer = 0 To u
		        Dim Transcription As SFTranscriptionMBS = Transcriptions(i)
		        
		        List.AddItem "Transcription "+Str(i), Transcription
		        
		      Next
		      
		    End If
		    
		    
		    
		    If v IsA SFSpeechRecognitionRequestMBS Then
		      
		      Dim r As SFSpeechRecognitionRequestMBS = v
		      
		      List.AddRow "interactionIdentifier", r.interactionIdentifier
		      List.AddRow "requiresOnDeviceRecognition", Str(r.requiresOnDeviceRecognition)
		      List.AddRow "shouldReportPartialResults", Str(r.shouldReportPartialResults)
		      List.AddRow "contextualStrings", Join(r.contextualStrings, ", ")
		      List.AddRow "taskHint", Str(r.taskHint)
		      
		      If v IsA SFSpeechURLRecognitionRequestMBS Then
		        
		        Dim u As SFSpeechURLRecognitionRequestMBS = v
		        
		        List.AddRow "URL", u.URL
		        
		      End If
		      
		    End If
		    
		    
		    
		    If v IsA NSErrorMBS Then
		      
		      Dim e As NSErrorMBS = v
		      
		      List.AddRow "Description", e.Description
		      List.AddRow "Code", Str(e.Code)
		      List.AddRow "Domain", e.Domain
		      
		      List.AddRow "LocalizedDescription", e.LocalizedDescription
		      List.AddRow "LocalizedFailureReason", e.LocalizedFailureReason
		      List.AddRow "LocalizedRecoverySuggestion", e.LocalizedRecoverySuggestion
		      
		      
		    End If
		    
		    
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events OpenButton
	#tag Event
		Sub Action()
		  
		  If List.ListIndex >= 0 Then
		    Dim v As Variant = List.RowTag(List.ListIndex)
		    
		    if v isa NSLocaleMBS then
		      Dim locale As NSLocaleMBS = v
		      
		      // use this Localization
		      recognizer = New MySFSpeechRecognizer(locale)
		    Else
		      // use user's default Localization
		      recognizer = New MySFSpeechRecognizer
		    End If
		  Else
		    recognizer = New MySFSpeechRecognizer
		  End If
		  
		  If recognizer.available = False Then
		    MsgBox "Recognizer not available"
		  end if
		  
		  'dim supportsOnDeviceRecognition as Boolean = recognizer.supportsOnDeviceRecognition
		  
		  
		  Dim file As FolderItem = GetOpenFolderItem(AudioFileTypes.All)
		  
		  If file = Nil Then Return
		  
		  
		  List.DeleteAllRows
		  
		  request = New SFSpeechURLRecognitionRequestMBS(file)
		  
		  request.shouldReportPartialResults = False
		  
		  
		  Dim task As SFSpeechRecognitionTaskMBS = recognizer.recognitionTaskWithRequest(request, AddressOf recognitionTaskWithRequestCompleted)
		  
		  // now wait for callback
		  
		  
		  
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
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
