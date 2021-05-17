#tag Report
Begin Report BreakingListofOrders
   Compatibility   =   ""
   Units           =   0
   Width           =   8.5
   Begin  PageHeader
      Type            =   1
      GroupByField    =   ""
      Height          =   0.4060000000000000275335
      Begin ReportLabel Label1
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.25
         Italic          =   False
         Left            =   0.125
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "Orders by company"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.0859999999999999931166
         Underline       =   False
         VerticalAlign   =   1
         Width           =   1.875
         WordWrap        =   False
      End
   End
   Begin  GroupHeader2
      Type            =   2
      GroupByField    =   ""
      Height          =   0.0650000000000000022204
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
         Height          =   0.2570000000000000062172
         Italic          =   False
         Left            =   0.1239999999999999991118
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
         Top             =   0.0429999999999999965583
         Underline       =   False
         VerticalAlign   =   1
         Width           =   3.7200000000000001953993
         WordWrap        =   False
      End
   End
   Begin  Body
      Type            =   3
      GroupByField    =   ""
      Height          =   0.3519999999999999795719
      Begin ReportField Field1
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "OrderNumber"
         HasBackColor    =   False
         Height          =   0.2000000000000000111022
         Italic          =   False
         Left            =   2.1070000000000002060574
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
         Top             =   0.0560000000000000011657
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
         Left            =   1.2880000000000000337508
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "Order #"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.0560000000000000011657
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.6340000000000000079936
         WordWrap        =   False
      End
      Begin ReportField Field3
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "Total"
         HasBackColor    =   False
         Height          =   0.2000000000000000111022
         Italic          =   False
         Left            =   4.8109999999999999431566
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
         Top             =   0.0560000000000000011657
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
         Left            =   4.2110000000000002984279
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "Total"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.0560000000000000011657
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.5
         WordWrap        =   False
      End
   End
   Begin  GroupFooter1
      Type            =   6
      GroupByField    =   ""
      Height          =   0.4069999999999999729106
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
         Top             =   0.0850000000000000061062
         Underline       =   False
         VerticalAlign   =   1
         Width           =   1.4710000000000000852651
         WordWrap        =   False
      End
      Begin ReportField Field4
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "Total"
         HasBackColor    =   False
         Height          =   0.2000000000000000111022
         Italic          =   False
         Left            =   4.8109999999999999431566
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
         Top             =   0.0850000000000000061062
         Underline       =   False
         VerticalAlign   =   1
         Width           =   1.0
         WordWrap        =   False
      End
   End
   Begin  GroupFooter2
      Type            =   6
      GroupByField    =   ""
      Height          =   0.3250000000000000111022
      StartNewPageAtEndOfGroup=   "False"
      Begin ReportLabel Label6
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.2000000000000000111022
         Italic          =   False
         Left            =   3.7469999999999998863132
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "Grand Total"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.047000000000000000111
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.9639999999999999680256
         WordWrap        =   False
      End
      Begin ReportField Field5
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "Total"
         HasBackColor    =   False
         Height          =   0.2000000000000000111022
         Italic          =   False
         Left            =   4.8140000000000000568434
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
         Top             =   0.047000000000000000111
         Underline       =   False
         VerticalAlign   =   1
         Width           =   1.0
         WordWrap        =   False
      End
   End
   Begin  PageFooter
      Type            =   5
      GroupByField    =   ""
      Height          =   0.2710000000000000186517
   End
End
#tag EndReport

#tag ReportCode
#tag EndReportCode

