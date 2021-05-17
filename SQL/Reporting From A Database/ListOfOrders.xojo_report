#tag Report
Begin Report ListOfOrders
   Compatibility   =   ""
   Units           =   0
   Width           =   8.5
   Begin  PageHeader
      Type            =   1
      GroupByField    =   ""
      Height          =   0.7119999999999999662492
      Begin ReportRectangleShape RectangleShape1
         BorderColor     =   &c00000000
         BorderWidth     =   1.0
         FillColor       =   &cFFFFFF00
         Height          =   0.2419999999999999928946
         Left            =   0.1980000000000000093259
         LockedInPosition=   False
         Top             =   0.414999999999999980016
         Width           =   6.0
      End
      Begin ReportLabel Label1
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.1610000000000000042188
         Italic          =   False
         Left            =   0.1970000000000000084377
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "List of Orders"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.1199999999999999955591
         Underline       =   False
         VerticalAlign   =   1
         Width           =   1.8819999999999998951949
         WordWrap        =   False
      End
      Begin ReportLabel Label2
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.125
         Italic          =   False
         Left            =   0.2409999999999999920064
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "Order #"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.4729999999999999760192
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.625
         WordWrap        =   False
      End
      Begin ReportLabel Label3
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.125
         Italic          =   False
         Left            =   1.1459999999999999076294
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "Company"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.4729999999999999760192
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.75
         WordWrap        =   False
      End
      Begin ReportLabel Label4
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.1320000000000000062172
         Italic          =   False
         Left            =   5.5720000000000000639488
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "Total"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.4729999999999999760192
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.5
         WordWrap        =   False
      End
      Begin ReportLineShape LineShape1
         LineColor       =   &c00000000
         LineStyle       =   0
         LockedInPosition=   False
         X1              =   0.2079999999999999904521
         X2              =   3.8420000000000000817124
         Y1              =   0.3679999999999999937828
         Y2              =   0.3679999999999999937828
      End
   End
   Begin  Body
      Type            =   3
      GroupByField    =   ""
      Height          =   0.2979999999999999871214
      Begin ReportField Field1
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "OrderNumber"
         HasBackColor    =   False
         Height          =   0.2399999999999999911182
         Italic          =   False
         Left            =   0.2399999999999999911182
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         OutputFormat    =   ""
         SummaryFunc     =   0
         SummaryType     =   0
         Text            =   "Untitled"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.0379999999999999990563
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.75
         WordWrap        =   False
      End
      Begin ReportField Field2
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "company"
         HasBackColor    =   False
         Height          =   0.2399999999999999911182
         Italic          =   False
         Left            =   1.1470000000000000195399
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         OutputFormat    =   ""
         SummaryFunc     =   0
         SummaryType     =   0
         Text            =   "Untitled"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.0400000000000000008327
         Underline       =   False
         VerticalAlign   =   1
         Width           =   2.25
         WordWrap        =   False
      End
      Begin ReportField Field3
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "Total"
         HasBackColor    =   False
         Height          =   0.2399999999999999911182
         Italic          =   False
         Left            =   5.137999999999999900524
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         OutputFormat    =   "$###,###.00"
         SummaryFunc     =   0
         SummaryType     =   0
         Text            =   "Untitled"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.0379999999999999990563
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.9320000000000000506262
         WordWrap        =   False
      End
   End
   Begin  PageFooter
      Type            =   5
      GroupByField    =   ""
      Height          =   0.4929999999999999937828
   End
End
#tag EndReport

#tag ReportCode
#tag EndReportCode

