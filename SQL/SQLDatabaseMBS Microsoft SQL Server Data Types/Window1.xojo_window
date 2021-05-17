#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   510
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   515827711
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "SQLDatabaseMBS Microsoft SQL Server Data Types"
   Visible         =   True
   Width           =   816
   Begin PushButton pbSQLdbMBS
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "SQLDatabaseMBS"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   478
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   16
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin PushButton pbSQLConMBS
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "SQLConnectionMBS"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   478
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   50
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin Label lbStatus
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
      Left            =   12
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   470
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   784
   End
   Begin PushButton pbXojoRS
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Xojo ODBC"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   478
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   84
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin TextField tfHost
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
      Italic          =   False
      Left            =   716
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "0"
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "localhost"
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   16
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   79
   End
   Begin TextField tfDb
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
      Italic          =   False
      Left            =   716
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "0"
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "test"
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   50
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin TextField tfUser
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
      Italic          =   False
      Left            =   717
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "0"
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   83
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   76
   End
   Begin TextField tfPass
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
      InitialParent   =   ""
      Italic          =   False
      Left            =   716
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "0"
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   116
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin Label Label1
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
      Left            =   664
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Host"
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   18
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   40
   End
   Begin Label Label2
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
      Left            =   640
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Database"
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   64
   End
   Begin Label Label3
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
      Left            =   664
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "User"
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   84
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   41
   End
   Begin Label Label4
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
      Left            =   664
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Pass"
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   118
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   38
   End
   Begin Listbox list
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   4
      ColumnsResizable=   False
      ColumnWidths    =   "25%,25%,25%,25%"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   307
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Connection Type	FieldName	DataType	Value\r\n"
      Italic          =   False
      Left            =   12
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   151
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   784
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Label Label5
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
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "SQL"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   82
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   28
   End
   Begin TextArea taSql
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
      Height          =   89
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   12
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "select cast(1 as int) as F1int, cast('V2' as varchar(5)) as F2varchar5, cast(3.2 as numeric(3,2)) as F3N32 , getdate() as F4Date,cast(123.45 as	money) as F5Money\r"
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   16
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   443
   End
   Begin Label Label6
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
      Left            =   12
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Xojo and SQLAPI use different data type values."
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   117
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   334
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function GetColumnTypeAsText(t as integer) As String
		  Select Case t
		  Case 0
		    Return "null"
		  Case 1
		    Return "byte"
		  Case 2
		    Return "SmallInt"
		  Case 3
		    Return "Integer"
		  Case 4
		    Return "Text"
		  Case 5
		    Return "Text"
		  Case 6
		    Return "Float"
		  Case 7
		    Return "Double"
		  Case 8
		    Return "Date"
		  Case 9
		    Return "Time"
		  Case 10
		    Return "TimeStamp"
		  Case 11
		    Return "Currency"
		  Case 12
		    Return "Boolean"
		  Case 13
		    Return "Float"
		  Case 14
		    Return "Binary"
		  Case 15
		    Return "Text"
		  Case 16
		    Return "Blob"
		  Case 17
		    Return "Blob"
		  Case 18
		    Return "Text"
		  Case 19
		    Return "Int64"
		  Case 255
		    Return "unknown" // Unknown
		  Case Else
		    Return "unknown" // Unknown
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetMBSColumnTypeAsText(t as integer) As String
		  
		  select case t
		  case SQLFieldMBS.kDataTypeUnknown
		    return "unknown"     
		  case SQLFieldMBS.kDataTypeBool
		    return "bool"
		  case SQLFieldMBS.kDataTypeShort
		    return "SmallInt"
		  case SQLFieldMBS.kDataTypeUShort
		    return "ushort"
		  case SQLFieldMBS.kDataTypeLong
		    return "long"
		  case SQLFieldMBS.kDataTypeULong
		    return "ulong"
		  case SQLFieldMBS.kDataTypeDouble
		    return "double"
		  case SQLFieldMBS.kDataTypeNumeric
		    return "Numeric" // double, int64 or similar
		  case SQLFieldMBS.kDataTypeDateTime
		    return "datetime"
		  case SQLFieldMBS.kDataTypeInterval
		    return "interval"
		  case SQLFieldMBS.kDataTypeString, SQLFieldMBS.kDataTypeLongChar,SQLFieldMBS.kDataTypeCLob
		    return "text"
		  case SQLFieldMBS.kDataTypeBytes, SQLFieldMBS.kDataTypeLongBinary, SQLFieldMBS.kDataTypeBLob
		    return "blob"
		  case SQLFieldMBS.kDataTypeCursor
		    return "cursor"
		  case SQLFieldMBS.kDataTypeSpecificToDBMS
		    return "specific"
		  else
		    return "?"
		    
		  end Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetMicrosoftODBCTypeAsText(t as integer) As string
		  Select Case t
		  Case 0
		    Return "Null"
		  Case 1
		    Return "Char"
		  Case 2
		    Return "Numeric"
		  Case 3
		    Return "Decimal"
		  Case 4
		    Return "Integer"
		  Case 5
		    Return "SmallInt"
		  Case 6
		    Return "Float"
		  Case 7
		    Return "Double"
		  Case 8
		    Return "Double"
		  Case 9
		    Return "Date"
		  Case 10
		    Return "Interval"
		  Case 11
		    Return "TimeStamp"
		  Case 12
		    Return "Text"
		    
		    
		  Case 91
		    Return "Date"
		  Case 92
		    Return "Time"
		  Case 93
		    Return "TimeStamp"
		    
		  Case 99
		    Return "Default"
		    
		  Case -7
		    Return "Bit"
		  Case -6
		    Return "TinyInt"
		  Case -5
		    Return "BigInt"
		  Case -4
		    Return "BLOB" // long varbinary
		  Case -3 
		    Return "BLOB" // varbinary
		  Case -2
		    Return "BLOB" // binary
		  Case -1
		    Return "Text"
		  Case -11
		    Return "GUID"
		  Case -8
		    Return "Text" // WCHAR
		  Case -9
		    Return "Text" // WVARCHAR
		  Case -10
		    Return "Text" // WLONGVARCHAR 
		    
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function now() As String
		  dim d as new date
		  
		  return d.SQLDateTime
		End Function
	#tag EndMethod


	#tag Constant, Name = HasODBCPlugin, Type = Boolean, Dynamic = False, Default = \"false", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events pbSQLdbMBS
	#tag Event
		Sub Action()
		  if list.ListCount  >0 then list.AddRow
		  
		  
		  dim db as new SQLDatabaseMBS // where is the library?
		  
		  db.DatabaseName="SQLserver:"+tfHost.text+"@" +tfDb.text
		  db.UserName=tfUser.Text
		  db.Password=tfPass.Text
		  
		  if not db.Connect then
		    lbStatus.text = db.ErrorMessage + EndOfLine
		  else
		    
		    dim rs as recordset = db.SQLSelect (taSql.Text)
		    
		    for col as integer = 1 to rs.FieldCount 
		      
		      dim f as DatabaseField = rs.IdxField(col)
		      dim type as integer = rs.ColumnType(col-1)
		      
		      list.AddRow "SQLDatabaseMBS"
		      list.Cell(list.LastIndex,1) = f.name
		      list.Cell(list.LastIndex,2) = str(type) +  ": " + GetColumnTypeAsText(type)
		      list.Cell(list.LastIndex,3) = f.StringValue
		      
		    next
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbSQLConMBS
	#tag Event
		Sub Action()
		  if list.ListCount  > 0 then list.AddRow
		  
		  
		  dim con as SQLConnectionMBS = new SQLConnectionMBS
		  dim cs as string = "DRIVER={SQL Server};Server="+tfHost.text+";UId="+tfUser.Text +";PWD="+ tfPass.text+";Database=" + tfDb.Text
		  
		  con.Option("UseAPI") = "ODBC"
		  con.Connect(cs,"","",SQLConnectionMBS.kODBCClient)
		  
		  if con.isConnected then
		    lbStatus.text =  "connected"
		  else
		    lbStatus.text =  "Err : " + con.ErrorMessage
		  end if
		  
		  dim cmd as new SQLCommandMBS
		  cmd.Connection = con
		  cmd.setCommandText  taSql.Text
		  
		  cmd.Execute
		  
		  if cmd.isResultSet then
		    
		    if cmd.FetchNext then
		      
		      for col as integer = 1 to cmd.FieldCount 
		        dim f as SQLFieldMBS = cmd.Field(col)
		        dim type as integer = f.DataType
		        dim nativetype as integer = f.NativeType
		        
		        list.AddRow "SQLConnectionMBS"
		        list.Cell(list.LastIndex,1) = f.name
		        list.Cell(list.LastIndex,2) = str(type) +  ": " + GetMBSColumnTypeAsText(type)+" ("+str(nativetype) +  ": " + GetMicrosoftODBCTypeAsText(nativetype)+")"
		        list.Cell(list.LastIndex,3) = f.asStringValue
		        
		      next
		    end if
		  end if
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbXojoRS
	#tag Event
		Sub Action()
		  if list.ListCount >0 then list.AddRow
		  
		  #if HasODBCPlugin then
		    
		    
		    
		    dim db as new ODBCDatabase
		    db.DataSource = "Driver=SQL Server;Server="+tfHost.Text+";Database="+tfDb.text+"; Uid="+tfUser.Text+";Pwd="+ tfPass.text
		    
		    
		    if not db.Connect then
		      lbStatus.Text = db.ErrorMessage + EndOfLine
		    else
		      
		      dim sql as string =  taSql.text
		      dim rs as recordset = db.SQLSelect (sql)
		      
		      rs.MoveFirst
		      
		      for col as integer = 1 to rs.FieldCount 
		        list.AddRow "XOJO odbc"
		        
		        // field 1 based
		        // columntype 0 based
		        
		        dim f as DatabaseField =  rs.IdxField(col)
		        dim type as integer = rs.ColumnType(col-1)
		        
		        list.Cell(list.LastIndex,1) = f.name
		        list.Cell(list.LastIndex,2) = str(type) +  ": " + GetColumnTypeAsText(type)
		        list.Cell(list.LastIndex,3) = f.StringValue
		      next
		      
		      
		    end if
		    
		    
		  #else
		    
		    MsgBox "Xojo ODBC Plugin installed? Check HasODBCPlugin constant, please."
		    
		  #endif
		  
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
#tag EndViewBehavior
