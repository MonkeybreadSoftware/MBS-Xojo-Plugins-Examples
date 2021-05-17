#tag Window
Begin Window flights
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   768
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1611169791
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "SAP RFC Beispiel"
   Visible         =   True
   Width           =   1024
   Begin GroupBox GrpLogOn
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Anmeldedaten"
      Enabled         =   True
      Height          =   192
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
      Width           =   332
      Begin Label Label_ashost
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GrpLogOn"
         Italic          =   False
         Left            =   40
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   56
         Transparent     =   False
         Underline       =   False
         Value           =   "Anwendungsserver"
         Visible         =   True
         Width           =   120
      End
      Begin TextField logon_ashost
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GrpLogOn"
         Italic          =   False
         Left            =   172
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   55
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Value           =   ""
         Visible         =   True
         Width           =   160
      End
      Begin Label Label_sysnr
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GrpLogOn"
         Italic          =   False
         Left            =   40
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   79
         Transparent     =   False
         Underline       =   False
         Value           =   "Instanz-Nr."
         Visible         =   True
         Width           =   120
      End
      Begin TextField logon_sysnr
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GrpLogOn"
         Italic          =   False
         Left            =   172
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   78
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Value           =   ""
         Visible         =   True
         Width           =   40
      End
      Begin Label Label_client
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GrpLogOn"
         Italic          =   False
         Left            =   40
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   102
         Transparent     =   False
         Underline       =   False
         Value           =   "Mandant"
         Visible         =   True
         Width           =   120
      End
      Begin TextField logon_client
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GrpLogOn"
         Italic          =   False
         Left            =   172
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   101
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Value           =   ""
         Visible         =   True
         Width           =   40
      End
      Begin TextField logon_user
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GrpLogOn"
         Italic          =   False
         Left            =   172
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   124
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Value           =   ""
         Visible         =   True
         Width           =   100
      End
      Begin Label Label_user
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GrpLogOn"
         Italic          =   False
         Left            =   40
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   125
         Transparent     =   False
         Underline       =   False
         Value           =   "Benutzer"
         Visible         =   True
         Width           =   120
      End
      Begin Label Label_passwd
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GrpLogOn"
         Italic          =   False
         Left            =   40
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   148
         Transparent     =   False
         Underline       =   False
         Value           =   "Passwort"
         Visible         =   True
         Width           =   120
      End
      Begin TextField logon_passwd
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GrpLogOn"
         Italic          =   False
         Left            =   172
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   True
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   9
         TabPanelIndex   =   0
         TabStop         =   True
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   147
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Value           =   ""
         Visible         =   True
         Width           =   100
      End
      Begin TextField logon_lang
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GrpLogOn"
         Italic          =   False
         Left            =   172
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   10
         TabPanelIndex   =   0
         TabStop         =   True
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   170
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Value           =   ""
         Visible         =   True
         Width           =   40
      End
      Begin Label Label_lang
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GrpLogOn"
         Italic          =   False
         Left            =   40
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   11
         TabPanelIndex   =   0
         TabStop         =   True
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   171
         Transparent     =   False
         Underline       =   False
         Value           =   "Sprache"
         Visible         =   True
         Width           =   120
      End
   End
   Begin Label Label_airline
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
      Left            =   20
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
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   231
      Transparent     =   False
      Underline       =   False
      Value           =   "Fluggesellschaft"
      Visible         =   True
      Width           =   120
   End
   Begin PopupMenu PopupSCARR
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   152
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   231
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   297
   End
   Begin Listbox ListboxSFLIGHT
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   13
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   485
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
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
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   263
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   984
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton PushButtonConnect
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "OK"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   364
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   37
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   182
   End
   Begin Label LabelConnectionState
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   364
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   78
      Transparent     =   False
      Underline       =   False
      Value           =   "Untitled"
      Visible         =   True
      Width           =   182
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Select case key.asc
		  case 13 // Enter-Taste
		    ConnectSAPSever()
		  case 27
		    me.close
		  end select
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  BildschirmFelderSperren(true)            
		  
		  self.Title = gc_TitleFlights
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub BildschirmFelderSperren(iv_sperren as boolean, iv_Scope as string = "all")
		  // --------------------------------------------------------------------------------
		  // - BildschirmFelderSperren
		  // --------------------------------------------------------------------------------
		  // - Sperren und entsperren von Bildschirmfeldern. Gesperrte Felder werden
		  // - ausgegraut, entsperrte Felder werden weiß eingefärbt. Checkboxen und 
		  // - Radioknöpfe werden nur aktiviert oder deaktiviert.
		  // --------------------------------------------------------------------------------
		  // - --> iv_sperren - Sperre an oder aus
		  // - --> iv_Scope   - Bildschirmbereich
		  // --------------------------------------------------------------------------------
		  
		  var lv_sperren        as Boolean
		  var lv_enabled        as Boolean
		  var lv_BackColor      as Color
		  var lv_ColorProtected as color = FillColor // grau &cCCCCCC
		  var lv_ColorOpen      as color = &cFFFFFF  // weiß &cFFFFFF  
		  
		  // Das Programm hat einen Anzeige- und einen Änderungsmodus.
		  // Im Anzeigemodus kann nichts verändert oder gespeichert werden.
		  // Alle folgenden existierenden Felder in Abhängigkeit von APP.MyModus
		  // auf ReadOnly = true oder false gesetzt.
		  'if app.MyModus = app.gc_ModusAnzeige then
		  'lv_sperren = true
		  'lv_enabled = false
		  'else
		  lv_sperren = iv_sperren
		  if iv_sperren then
		    lv_enabled = false
		  else
		    lv_enabled = true
		  end if
		  'end if
		  if lv_sperren then
		    lv_BackColor = lv_ColorProtected
		  else
		    lv_BackColor = lv_ColorOpen 
		  end if
		  
		  if iv_Scope = "all" then
		    
		    PopupSCARR.Enabled        = lv_enabled
		    'if not lv_enabled then
		    'PopupSCARR.SelectedRowIndex = -1
		    'end if
		    ListboxSFLIGHT.Enabled    = lv_enabled
		    
		  end if //iv_Scope = "alles" oder "AutoDoc"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Call_ZXOJO_GET_SCARR()
		  // -------------------------------------------------------------------------------
		  // - Method Call_ZXOJO_GET_SCRARR           
		  // -------------------------------------------------------------------------------
		  // - This method reads SAP table SCARR which contains all airlines of the example
		  // - and fills the PopupSCARR to enable any selections
		  // -------------------------------------------------------------------------------
		  
		  PopupSCARR.RemoveAllRows
		  
		  
		  var fd As RFCFunctionDescriptionMBS = app.ConnectionToSAP.FunctionDescription("ZXOJO_GET_SCARR")
		  
		  var f As RFCFunctionMBS = fd.CreateFunction
		  
		  f.Invoke
		  
		  var SCARR as RFCTableMBS  = f.TableValue("ET_SCARR")
		  
		  // something found in SAP table SCARR?
		  if SCARR.RowCount < 1 then
		    MessageBox(gc_message_NoCarrier)
		    return
		  end if
		  
		  var carrier as string
		  
		  SCARR.MoveToFirstRow
		  for iRow as integer = 1 to SCARR.RowCount
		    
		    carrier = SCARR.StringValue("CARRID")+" "+SCARR.StringValue("CARRNAME")
		    
		    PopupSCARR.AddRow(carrier)
		    
		    if irow < SCARR.RowCount then
		      SCARR.MoveToNextRow
		    end if
		    
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Call_ZXOJO_GET_SFLIGHT(iv_CarrID as string)
		  // -------------------------------------------------------------------------------
		  // - Method Call_ZXOJO_GET_SFLIGHT          
		  // -------------------------------------------------------------------------------
		  // - This method reads SAP table SFLIGHT which contains all flights of the example
		  // - and fills the ListboxSFLIGHT
		  // -------------------------------------------------------------------------------
		  
		  ListboxSFLIGHT.RemoveAllRows
		  
		  var fd As RFCFunctionDescriptionMBS = app.ConnectionToSAP.FunctionDescription("ZXOJO_GET_SFLIGHT")
		  
		  var f As RFCFunctionMBS = fd.CreateFunction
		  
		  f.StringValue("IV_CARRID")  = iv_CarrID
		  f.Invoke
		  
		  var SFLIGHT as RFCTableMBS  = f.TableValue("ET_SFLIGHT")
		  
		  // something found in SAP table SFLIGHT?
		  if SFLIGHT.RowCount < 1 then
		    
		    var s As RFCStructureMBS = f.StructureValue("ES_MESSAGE")
		    MessageBox( s.StringValue("MESSAGE") )
		    
		    return
		    
		  end if
		  
		  var fldate as string
		  
		  SFLIGHT.MoveToFirstRow
		  for iRow as integer = 1 to SFLIGHT.RowCount
		    
		    fldate = SFLIGHT.StringValue("FLDATE")
		    select case logon_lang.Value 
		    case "DE"
		      fldate = fldate.Middle(6,2)+"."+fldate.Middle(4,2)+"."+fldate.left(4)
		    case "EN"
		      fldate = fldate.Middle(4,2)+"-"+fldate.Middle(6,2)+"-"+fldate.left(4)
		    end select
		    
		    ListboxSFLIGHT.AddRow(SFLIGHT.StringValue("CARRID") _
		    , SFLIGHT.StringValue("CONNID") _
		    , fldate _
		    , SFLIGHT.StringValue("PRICE") _
		    , SFLIGHT.StringValue("CURRENCY") _
		    , SFLIGHT.StringValue("PLANETYPE") _
		    , SFLIGHT.StringValue("SEATSMAX") _
		    , SFLIGHT.StringValue("SEATSOCC") _
		    , SFLIGHT.StringValue("PAYMENTSUM") _
		    , SFLIGHT.StringValue("SEATSMAX_B") _
		    , SFLIGHT.StringValue("SEATSOCC_B") _
		    , SFLIGHT.StringValue("SEATSMAX_F") _
		    , SFLIGHT.StringValue("SEATSOCC_F"))
		    
		    if irow < SFLIGHT.RowCount then
		      SFLIGHT.MoveToNextRow
		    end if
		    
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ConnectSAPSever()
		  if logon_ashost.Value = "" or logon_client.value = "" or logon_sysnr.Value = "" or _
		    logon_user.Value = "" or logon_passwd.Value = "" or logon_lang.Value = "" then
		    MessageBox("Logon parameter incomplete")
		    return
		  end if
		  
		  
		  #If TargetWin32
		    var LibFile as string = "sapnwrfc.dll"
		  #Else
		    
		    // get the actual folder
		    var MacOsFolder as folderitem = app.ExecutableFile.Parent
		    
		    System.EnvironmentVariable("DYLD_LIBRARY_PATH") = MacOsFolder.NativePath
		    
		    If System.EnvironmentVariable("DYLD_LIBRARY_PATH") = "" Then
		      MessageBox("DYLD_LIBRARY_PATH variable not set")
		      return
		    end if
		    
		    var LibFile as FolderItem = MacOsFolder.Child("libsapnwrfc.dylib")
		    var LibPath As String = LibFile.parent.NativePath
		    
		    Call RFCModuleMBS.SetCurrentWorkingDirectory(libPath)
		    
		  #EndIf
		  
		  If not RFCModuleMBS.LoadLibrary(LibFile) Then
		    MessageBox("Failed to load library")
		    MessageBox RFCModuleMBS.LibraryLoadErrorMessage
		    return
		  End If
		  
		  'msgbox RFCModuleMBS.Version
		  'fz.message(gc_msgty_i, RFCModuleMBS.Version)
		  'Break
		  
		  var loginParams As New Dictionary
		  loginParams.Value("ashost") = logon_ashost.Value
		  loginParams.Value("sysnr")  = logon_sysnr.Value
		  loginParams.Value("client") = logon_client.Value
		  loginParams.Value("user")   = logon_user.Value
		  loginParams.Value("passwd") = logon_passwd.Value
		  loginParams.Value("lang")   = logon_lang.Value
		  
		  app.ConnectionToSAP = New RFCConnectionMBS(loginParams)
		  
		  LabelConnectionState.Value = gc_ConnectionStateOn
		  
		  Call_ZXOJO_GET_SCARR()
		  
		  BildschirmFelderSperren(false)
		  
		  Exception r As RFCErrorExceptionMBS
		    LabelConnectionState.Value = gc_ConnectionStateOff
		    MessageBox r.message
		    
		End Sub
	#tag EndMethod


	#tag Note, Name = Bemerkungen / Remarks
		Capacity BC means maximum capacity in business class
		Capacity FC means maximum capacity in first class
		
	#tag EndNote


	#tag Constant, Name = gc_CARRID, Type = String, Dynamic = True, Default = \"ID", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"ID"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"ID"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"ID"
	#tag EndConstant

	#tag Constant, Name = gc_Carrier, Type = String, Dynamic = True, Default = \"Fluggesellschaft", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Fluggesellschaft"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Carrier"
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Carrier"
	#tag EndConstant

	#tag Constant, Name = gc_client, Type = String, Dynamic = True, Default = \"Mandant", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Mandant"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Client"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"Client"
	#tag EndConstant

	#tag Constant, Name = gc_ConnectionStateOff, Type = String, Dynamic = True, Default = \"nicht verbunden", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"nicht verbunden"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"not connected"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"not connected"
	#tag EndConstant

	#tag Constant, Name = gc_ConnectionStateOn, Type = String, Dynamic = True, Default = \"verbunden", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"verbunden"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"connected"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"connected"
	#tag EndConstant

	#tag Constant, Name = gc_ConnectToSAP, Type = String, Dynamic = True, Default = \"mit SAP-System verbinden", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"mit SAP-System verbinden"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"connect to SAP system"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"connect to SAP system"
	#tag EndConstant

	#tag Constant, Name = gc_CONNID, Type = String, Dynamic = True, Default = \"Nr.", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Nr."
		#Tag Instance, Platform = Any, Language = en, Definition  = \"No."
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"No."
	#tag EndConstant

	#tag Constant, Name = gc_CURRENCY, Type = String, Dynamic = True, Default = \"W\xC3\xA4hrung", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"W\xC3\xA4hrung"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Currency"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"Currency"
	#tag EndConstant

	#tag Constant, Name = gc_FLDATE, Type = String, Dynamic = True, Default = \"Flugdatum", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Flugdatum"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Flight date"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \""
	#tag EndConstant

	#tag Constant, Name = gc_GrpLogOnData, Type = String, Dynamic = True, Default = \"SAP Anmeldedaten", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"SAP Anmeldedaten"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"SAP Log on data"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"SAP Log on data"
	#tag EndConstant

	#tag Constant, Name = gc_host, Type = String, Dynamic = True, Default = \"Anwendungsserver", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Anwendungsserver"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Application server"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"Application server"
	#tag EndConstant

	#tag Constant, Name = gc_language, Type = String, Dynamic = True, Default = \"Sprache", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Sprache"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Language"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"Language"
	#tag EndConstant

	#tag Constant, Name = gc_message_NoCarrier, Type = String, Dynamic = True, Default = \"Keine Fluggesellschaft gefunden", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Keine Fluggesellschaft gefunden"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"No carrier found"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"No carrier found"
	#tag EndConstant

	#tag Constant, Name = gc_password, Type = String, Dynamic = True, Default = \"Passwort", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Passwort"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Password"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"Password"
	#tag EndConstant

	#tag Constant, Name = gc_PAYMENTSUM, Type = String, Dynamic = True, Default = \"Akt. Buchungssumme", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Akt. Buchungssumme"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Booking total"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"Booking total"
	#tag EndConstant

	#tag Constant, Name = gc_PLANTYPE, Type = String, Dynamic = True, Default = \"Flugzeugtyp", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Flugzeugtyp"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Plane type"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"Plane type"
	#tag EndConstant

	#tag Constant, Name = gc_PRICE, Type = String, Dynamic = True, Default = \"Flugpreis", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Flugpreis"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Airfare"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"Airfare"
	#tag EndConstant

	#tag Constant, Name = gc_SEATSMAX, Type = String, Dynamic = True, Default = \"Kapazit\xC3\xA4t", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Kapazit\xC3\xA4t"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Capacity"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"Capacity"
	#tag EndConstant

	#tag Constant, Name = gc_SEATSMAX_B, Type = String, Dynamic = True, Default = \"Kapazit\xC3\xA4t BC", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Kapazit\xC3\xA4t BC"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Capacity BC"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"Capacity BC"
	#tag EndConstant

	#tag Constant, Name = gc_SEATSMAX_F, Type = String, Dynamic = True, Default = \"Kapazit\xC3\xA4t FC", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Kapazit\xC3\xA4t FC"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Capacity FC"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"Capacity FC"
	#tag EndConstant

	#tag Constant, Name = gc_SEATSOCC, Type = String, Dynamic = True, Default = \"Belegt", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Belegt"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Occupied"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"Occupied"
	#tag EndConstant

	#tag Constant, Name = gc_SEATSOCC_B, Type = String, Dynamic = True, Default = \"Belegt BC", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Belegt BC"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Occupied BC"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"Occupied BC"
	#tag EndConstant

	#tag Constant, Name = gc_SEATSOCC_F, Type = String, Dynamic = True, Default = \"Belegt FC", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Belegt FC"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Occupied FC"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"Occupied FC"
	#tag EndConstant

	#tag Constant, Name = gc_SystemNumber, Type = String, Dynamic = True, Default = \"Instanz-Nr.", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Instanz-Nr."
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Instance no."
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"Instance no."
	#tag EndConstant

	#tag Constant, Name = gc_TitleFlights, Type = String, Dynamic = True, Default = \"SAP RFC Beispiel", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"SAP RFC Beispiel"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"SAP RFC example"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"SAP RFC example"
	#tag EndConstant

	#tag Constant, Name = gc_user, Type = String, Dynamic = True, Default = \"Benutzer", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Benutzer"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"User"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"User"
	#tag EndConstant


#tag EndWindowCode

#tag Events GrpLogOn
	#tag Event
		Sub Open()
		  me.Caption = gc_GrpLogOnData
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Label_ashost
	#tag Event
		Sub Open()
		  me.Value = gc_host
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Label_sysnr
	#tag Event
		Sub Open()
		  me.Value = gc_SystemNumber
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Label_client
	#tag Event
		Sub Open()
		  me.Value = gc_client
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Label_user
	#tag Event
		Sub Open()
		  me.value = gc_user
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Label_passwd
	#tag Event
		Sub Open()
		  me.Value = gc_password
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events logon_lang
	#tag Event
		Sub Open()
		  var lv_Locale  as xojo.core.locale = xojo.core.locale.current                           
		  me.value = lv_Locale.Identifier.Left(2).Uppercase               
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Label_lang
	#tag Event
		Sub Open()
		  me.Value = gc_language
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Label_airline
	#tag Event
		Sub Open()
		  me.Value = gc_Carrier
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupSCARR
	#tag Event
		Sub Change()
		  var carrier(-1) as string = split(PopupSCARR.SelectedRowValue," ")
		  if carrier.Ubound > -1 then
		    
		    Call_ZXOJO_GET_SFLIGHT(carrier(0))
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ListboxSFLIGHT
	#tag Event
		Sub Open()
		  me.HeaderAt(00) = gc_CARRID
		  me.HeaderAt(01) = gc_CONNID
		  me.HeaderAt(02) = gc_FLDATE
		  me.HeaderAt(03) = gc_PRICE
		  me.HeaderAt(04) = gc_CURRENCY
		  me.HeaderAt(05) = gc_PLANTYPE
		  me.HeaderAt(06) = gc_SEATSMAX
		  me.HeaderAt(07) = gc_SEATSOCC
		  me.HeaderAt(08) = gc_PAYMENTSUM
		  me.HeaderAt(09) = gc_SEATSMAX_B
		  me.HeaderAt(10) = gc_SEATSOCC_B
		  me.HeaderAt(11) = gc_SEATSMAX_F
		  me.HeaderAt(12) = gc_SEATSOCC_F
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  If row Mod 2 = 0 Then
		    g.ForeColor = FillColor
		    g.FillRectangle(0, 0, g.Width, g.Height)
		  End If
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events PushButtonConnect
	#tag Event
		Sub Open()
		  me.Caption = gc_ConnectToSAP
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  ConnectSAPSever()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LabelConnectionState
	#tag Event
		Sub Open()
		  me.Value = gc_ConnectionStateOff
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
