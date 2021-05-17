#tag Report
Begin Report BreakingListofOrders
   Compatibility   =   ""
   Units           =   0
   Width           =   8.5
   Begin  PageHeader
      Type            =   1
      GroupByField    =   ""
      Height          =   0.4099999999999999755751
      Begin ReportLabel Label1
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.25
         Italic          =   False
         Left            =   0.1199999999999999955591
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "Orders by company"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.0899999999999999966693
         Underline       =   False
         VerticalAlign   =   1
         Width           =   1.8799999999999998934186
         WordWrap        =   False
      End
   End
   Begin  GroupHeader2
      Type            =   2
      GroupByField    =   ""
      Height          =   0.0700000000000000066613
   End
   Begin  GroupHeader1
      Type            =   2
      GroupByField    =   "company"
      Height          =   0.3699999999999999955591
      Begin ReportField Field2
         BackColor       =   &cFFFFFF00
         Bold            =   True
         DataField       =   "company"
         HasBackColor    =   False
         Height          =   0.2600000000000000088818
         Italic          =   False
         Left            =   0.1199999999999999955591
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         OutputFormat    =   ""
         SummaryFunc     =   0
         SummaryType     =   0
         Text            =   "Untitled"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "times New roman"
         TextSize        =   24.0
         TextUnit        =   0
         Top             =   0.0400000000000000008327
         Underline       =   False
         VerticalAlign   =   1
         Width           =   3.7200000000000001953993
         WordWrap        =   False
      End
   End
   Begin  Body
      Type            =   3
      GroupByField    =   ""
      Height          =   0.3499999999999999777955
      Begin ReportField Field1
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "OrderNumber"
         HasBackColor    =   False
         Height          =   0.2000000000000000111022
         Italic          =   False
         Left            =   2.109999999999999875655
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
         Top             =   0.0599999999999999977796
         Underline       =   False
         VerticalAlign   =   1
         Width           =   1.0
         WordWrap        =   False
      End
      Begin ReportLabel Label2
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.2000000000000000111022
         Italic          =   False
         Left            =   1.2900000000000000355271
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "Order #"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.0599999999999999977796
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.6300000000000000044409
         WordWrap        =   False
      End
      Begin ReportField Field3
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "Total"
         HasBackColor    =   False
         Height          =   0.2000000000000000111022
         Italic          =   False
         Left            =   4.8099999999999996092015
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
         Top             =   0.0599999999999999977796
         Underline       =   False
         VerticalAlign   =   1
         Width           =   1.0
         WordWrap        =   False
      End
      Begin ReportLabel Label4
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.2000000000000000111022
         Italic          =   False
         Left            =   4.2099999999999999644729
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "Total"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.0599999999999999977796
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.5
         WordWrap        =   False
      End
   End
   Begin  GroupFooter1
      Type            =   6
      GroupByField    =   ""
      Height          =   0.4099999999999999755751
      StartNewPageAtEndOfGroup=   "False"
      Begin ReportLabel Label5
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.2000000000000000111022
         Italic          =   False
         Left            =   3.2400000000000002131628
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "Total for company"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.0899999999999999966693
         Underline       =   False
         VerticalAlign   =   1
         Width           =   1.4699999999999999733546
         WordWrap        =   False
      End
      Begin ReportField Field4
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "Total"
         HasBackColor    =   False
         Height          =   0.2000000000000000111022
         Italic          =   False
         Left            =   4.8099999999999996092015
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         OutputFormat    =   "$###,###.00"
         SummaryFunc     =   0
         SummaryType     =   3
         Text            =   "Untitled"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.0899999999999999966693
         Underline       =   False
         VerticalAlign   =   1
         Width           =   1.0
         WordWrap        =   False
      End
   End
   Begin  GroupFooter2
      Type            =   6
      GroupByField    =   ""
      Height          =   0.3300000000000000155431
      StartNewPageAtEndOfGroup=   "False"
      Begin ReportLabel Label6
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.2000000000000000111022
         Italic          =   False
         Left            =   3.75
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "Grand Total"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.0500000000000000027756
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.9599999999999999644729
         WordWrap        =   False
      End
      Begin ReportField Field5
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "Total"
         HasBackColor    =   False
         Height          =   0.2000000000000000111022
         Italic          =   False
         Left            =   4.8099999999999996092015
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         OutputFormat    =   "$###,###.00"
         SummaryFunc     =   0
         SummaryType     =   3
         Text            =   "Untitled"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.0500000000000000027756
         Underline       =   False
         VerticalAlign   =   1
         Width           =   1.0
         WordWrap        =   False
      End
   End
   Begin  PageFooter
      Type            =   5
      GroupByField    =   ""
      Height          =   0.2700000000000000177636
   End
End
#tag EndReport

#tag ReportCode
#tag EndReportCode

