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
   Height          =   170
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1003567487
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Orders by Company"
   Visible         =   True
   Width           =   374
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   87
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   28
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "This example runs a SQL query and then sends the resulting report to be printed. The report uses Groups to bands to display the data by company."
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   319
   End
   Begin PushButton RunReportButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Run Report"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   220
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   130
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   134
   End
   Begin PushButton RunReportButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "PDF"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   133
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   130
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   75
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Function GetDBFile() As FolderItem
		  Dim rscDB As Xojo.IO.FolderItem = Xojo.IO.SpecialFolder.GetResource("Orders.sqlite")
		  
		  Dim dbFile As New FolderItem(rscDB.Path, FolderItem.PathTypeNative)
		  
		  Return dbFile
		End Function
	#tag EndMethod


#tag EndWindowCode

#tag Events RunReportButton
	#tag Event
		Sub Action()
		  Dim ordersDB As New SQLiteDatabase
		  
		  // Set Database File
		  ordersDB.DatabaseFile = GetDBFile
		  
		  // Connect to the database
		  If ordersDB.DatabaseFile.Exists Then
		    // The database file already exists, so we want to connect to it.
		    If Not ordersDB.Connect Then
		      
		      // there was an error connecting to the database
		      MsgBox("Database Error: " + Str(ordersDB.ErrorCode) + EndOfLine + EndOfLine + OrdersDB.ErrorMessage)
		      
		      Return
		    End If
		  Else
		    MsgBox("Database not found.")
		    Return
		  End If
		  
		  // Build the SQL statement that will be used to select the records
		  Dim sql As String = "SELECT O.OrderNumber, C.ID, C.Company, C.LastName, O.DateOrdered, O.Total" + _
		  " FROM Orders O, Customers C WHERE O.CustomerID = C.ID ORDER BY C.Company, O.OrderNumber"
		  Dim rpt As New BreakingListofOrders
		  
		  // Now we select the records from the database and add them to the list.
		  Dim orders As RecordSet
		  orders = ordersDB.SqlSelect(sql)
		  If orders = Nil Then
		    Beep
		    MsgBox("No records found to print.")
		  Else
		    Dim ps As New PrinterSetup
		    
		    // set the resolution to 300 DPI for printing
		    ps.MaxHorizontalResolution = 300
		    ps.MaxVerticalResolution = 300
		    
		    If ps.PageSetupDialog Then
		      Dim g As Graphics
		      g = OpenPrinterDialog(ps, Nil)
		      If g <> Nil Then
		        
		        // if the report runs successfully
		        If rpt.Run(orders, ps) Then
		          rpt.Document.Print(g)
		        End If
		      End If
		      
		    End If
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RunReportButton1
	#tag Event
		Sub Action()
		  Dim ordersDB As New SQLiteDatabase
		  
		  // Set Database File
		  ordersDB.DatabaseFile = GetDBFile
		  
		  // Connect to the database
		  If ordersDB.DatabaseFile.Exists Then
		    // The database file already exists, so we want to connect to it.
		    If Not ordersDB.Connect Then
		      
		      // there was an error connecting to the database
		      MsgBox("Database Error: " + Str(ordersDB.ErrorCode) + EndOfLine + EndOfLine + OrdersDB.ErrorMessage)
		      
		      Return
		    End If
		  Else
		    MsgBox("Database not found.")
		    Return
		  End If
		  
		  // Build the SQL statement that will be used to select the records
		  Dim sql As String = "SELECT O.OrderNumber, C.ID, C.Company, C.LastName, O.DateOrdered, O.Total" + _
		  " FROM Orders O, Customers C WHERE O.CustomerID = C.ID ORDER BY C.Company, O.OrderNumber"
		  Dim rpt As New BreakingListofOrders
		  
		  // Now we select the records from the database and add them to the list.
		  Dim orders As RecordSet
		  orders = ordersDB.SqlSelect(sql)
		  If orders = Nil Then
		    Beep
		    MsgBox("No records found to print.")
		  Else
		    Dim ps As New PrinterSetup
		    
		    Dim pdf As New MyDynapdfMBS
		    Dim f1 As FolderItem = SpecialFolder.Desktop.Child("DynaPDF Graphics.pdf")
		    Dim f2 As FolderItem = SpecialFolder.Desktop.Child("DynaPDF Graphics.png")
		    Dim f3 As FolderItem = SpecialFolder.Desktop.Child("DynaPDF Graphics Rendered.png")
		    
		    'pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		    
		    If Not pdf.CreateNewPDF(f1) Then
		      Return
		    End If
		    
		    Call pdf.Append
		    
		    Dim g As Graphics = pdf.PageGraphics
		    
		    
		    
		    // if the report runs successfully
		    If rpt.Run(orders, ps) Then
		      rpt.Document.Print(g)
		    End If
		    
		    
		    // for debugging, show temp picture
		    Dim p As Picture = pdf.PageGraphicsPicture
		    p.Save(f2, p.SaveAsPNG)
		    
		    Call pdf.EndPage
		    
		    Call pdf.RenderPageToImage(1, f3, 150, 0, 0, pdf.krfDefault, pdf.kpxfRGB, pdf.kcfFlate, pdf.kifmPNG)
		    
		    Call pdf.CloseFile
		    
		    
		    f1.Launch True
		    
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
#tag EndViewBehavior
