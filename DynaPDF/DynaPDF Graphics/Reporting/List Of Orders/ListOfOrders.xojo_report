#tag Report
Begin Report ListOfOrders
   Compatibility   =   ""
   Units           =   0
   Width           =   8.5
   Begin  PageHeader
      Type            =   1
      GroupByField    =   ""
      Height          =   0.7099999999999999644729
      Begin ReportRectangleShape RectangleShape1
         BorderColor     =   &c00000000
         BorderWidth     =   1.0
         FillColor       =   &cFFFFFF00
         Height          =   0.2399999999999999911182
         Left            =   0.2000000000000000111022
         LockedInPosition=   False
         Top             =   0.4099999999999999755751
         Width           =   6.0
      End
      Begin ReportLabel Label1
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.1600000000000000033307
         Italic          =   False
         Left            =   0.2000000000000000111022
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
         Width           =   1.8799999999999998934186
         WordWrap        =   False
      End
      Begin ReportLabel Label2
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.1199999999999999955591
         Italic          =   False
         Left            =   0.2399999999999999911182
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "Order #"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.4699999999999999733546
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.6199999999999999955591
         WordWrap        =   False
      End
      Begin ReportLabel Label3
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.1199999999999999955591
         Italic          =   False
         Left            =   1.1499999999999999111822
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "Company"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.4699999999999999733546
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.75
         WordWrap        =   False
      End
      Begin ReportLabel Label4
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.1300000000000000044409
         Italic          =   False
         Left            =   5.5700000000000002842171
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "Total"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.4699999999999999733546
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.5
         WordWrap        =   False
      End
      Begin ReportLineShape LineShape1
         LineColor       =   &c00000000
         LineStyle       =   0
         LockedInPosition=   False
         X1              =   0.2099999999999999922284
         X2              =   3.8399999999999998578915
         Y1              =   0.3699999999999999955591
         Y2              =   0.3699999999999999955591
      End
   End
   Begin  Body
      Type            =   3
      GroupByField    =   ""
      Height          =   0.2999999999999999888978
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
         Top             =   0.0400000000000000008327
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
         Left            =   1.1499999999999999111822
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
         Left            =   5.1399999999999996802558
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
         Top             =   0.0400000000000000008327
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.9300000000000000488498
         WordWrap        =   False
      End
   End
   Begin  PageFooter
      Type            =   5
      GroupByField    =   ""
      Height          =   0.4899999999999999911182
   End
End
#tag EndReport

#tag ReportCode
#tag EndReportCode

