#tag Report
Begin Report GasPricesReport
   Compatibility   =   ""
   Units           =   0
   Width           =   8.5
   Begin  PageHeader
      Type            =   1
      GroupByField    =   ""
      Height          =   0.6500000000000000222045
      Begin ReportLabel Label1
         BackColor       =   &cFFFFFF00
         Bold            =   True
         HasBackColor    =   False
         Height          =   0.25
         Italic          =   False
         Left            =   0.6400000000000000133227
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "Historical Gas Prices"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   16.0
         TextUnit        =   0
         Top             =   0.2099999999999999922284
         Underline       =   False
         VerticalAlign   =   1
         Width           =   4.0
         WordWrap        =   False
      End
      Begin ReportPicture Picture1
         Alignment       =   1
         BackColor       =   &cFFFFFF00
         DataField       =   ""
         Height          =   0.5
         Image           =   2003318848
         Left            =   0.0700000000000000066613
         LockedInPosition=   False
         Stretch         =   True
         Top             =   0.0800000000000000016653
         Width           =   0.5
      End
   End
   Begin  GroupHeader1
      Type            =   2
      GroupByField    =   "Year"
      Height          =   0.4000000000000000222045
      Begin ReportLabel Label2
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.2600000000000000088818
         Italic          =   False
         Left            =   0.5699999999999999511502
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "Year:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.0800000000000000016653
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.5
         WordWrap        =   False
      End
      Begin ReportField Field1
         BackColor       =   &cFFFFFF00
         Bold            =   True
         DataField       =   "Year"
         HasBackColor    =   False
         Height          =   0.2700000000000000177636
         Italic          =   False
         Left            =   1.1399999999999999023004
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         OutputFormat    =   ""
         SummaryFunc     =   0
         SummaryType     =   0
         Text            =   "YYYY"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.0800000000000000016653
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.8800000000000000044409
         WordWrap        =   False
      End
   End
   Begin  Body
      Type            =   3
      GroupByField    =   ""
      Height          =   1.25
      Begin ReportRectangleShape RectangleShape1
         BorderColor     =   &c00000000
         BorderWidth     =   2.0
         FillColor       =   &cFFFFFF00
         Height          =   1.1200000000000001065814
         Left            =   0.3300000000000000155431
         LockedInPosition=   False
         Top             =   0.0500000000000000027756
         Width           =   6.75
      End
      Begin ReportLabel Label3
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.1700000000000000122125
         Italic          =   False
         Left            =   0.7900000000000000355271
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "January "
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.1400000000000000133227
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.670000000000000039968
         WordWrap        =   False
      End
      Begin ReportField Field2
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "Jan"
         HasBackColor    =   False
         Height          =   0.1700000000000000122125
         Italic          =   False
         Left            =   1.5300000000000000266454
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         OutputFormat    =   "#0.000"
         SummaryFunc     =   0
         SummaryType     =   0
         Text            =   "Price"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.1400000000000000133227
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.8800000000000000044409
         WordWrap        =   False
      End
      Begin ReportLabel Label4
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.1700000000000000122125
         Italic          =   False
         Left            =   0.5
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "February "
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.3900000000000000133227
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.9599999999999999644729
         WordWrap        =   False
      End
      Begin ReportField Field3
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "Feb"
         HasBackColor    =   False
         Height          =   0.1700000000000000122125
         Italic          =   False
         Left            =   1.5300000000000000266454
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         OutputFormat    =   "#0.000"
         SummaryFunc     =   0
         SummaryType     =   0
         Text            =   "Price"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.3900000000000000133227
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.8800000000000000044409
         WordWrap        =   False
      End
      Begin ReportLabel Label5
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.1700000000000000122125
         Italic          =   False
         Left            =   0.7900000000000000355271
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "March "
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.6199999999999999955591
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.670000000000000039968
         WordWrap        =   False
      End
      Begin ReportField Field4
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "Mar"
         HasBackColor    =   False
         Height          =   0.1700000000000000122125
         Italic          =   False
         Left            =   1.5300000000000000266454
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         OutputFormat    =   "#0.000"
         SummaryFunc     =   0
         SummaryType     =   0
         Text            =   "Price"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.6199999999999999955591
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.8800000000000000044409
         WordWrap        =   False
      End
      Begin ReportLabel Label6
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.1700000000000000122125
         Italic          =   False
         Left            =   0.7900000000000000355271
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "April "
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.8800000000000000044409
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.670000000000000039968
         WordWrap        =   False
      End
      Begin ReportField Field5
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "Apr"
         HasBackColor    =   False
         Height          =   0.1700000000000000122125
         Italic          =   False
         Left            =   1.5300000000000000266454
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         OutputFormat    =   "#0.000"
         SummaryFunc     =   0
         SummaryType     =   0
         Text            =   "Price"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.8900000000000000133227
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.8800000000000000044409
         WordWrap        =   False
      End
      Begin ReportLabel Label7
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.1700000000000000122125
         Italic          =   False
         Left            =   2.9100000000000001421085
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "May "
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.1199999999999999955591
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.670000000000000039968
         WordWrap        =   False
      End
      Begin ReportField Field6
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "May"
         HasBackColor    =   False
         Height          =   0.1700000000000000122125
         Italic          =   False
         Left            =   3.6499999999999999111822
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         OutputFormat    =   "#0.000"
         SummaryFunc     =   0
         SummaryType     =   0
         Text            =   "Price"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.1300000000000000044409
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.8800000000000000044409
         WordWrap        =   False
      End
      Begin ReportLabel Label8
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.1700000000000000122125
         Italic          =   False
         Left            =   2.9100000000000001421085
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "June "
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.3800000000000000044409
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.670000000000000039968
         WordWrap        =   False
      End
      Begin ReportField Field7
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "Jun"
         HasBackColor    =   False
         Height          =   0.1700000000000000122125
         Italic          =   False
         Left            =   3.6499999999999999111822
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         OutputFormat    =   "#0.000"
         SummaryFunc     =   0
         SummaryType     =   0
         Text            =   "Price"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.3800000000000000044409
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.8800000000000000044409
         WordWrap        =   False
      End
      Begin ReportLabel Label9
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.1700000000000000122125
         Italic          =   False
         Left            =   2.8999999999999999111822
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "July "
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.6199999999999999955591
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.670000000000000039968
         WordWrap        =   False
      End
      Begin ReportField Field8
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "Jul"
         HasBackColor    =   False
         Height          =   0.1700000000000000122125
         Italic          =   False
         Left            =   3.6499999999999999111822
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         OutputFormat    =   "#0.000"
         SummaryFunc     =   0
         SummaryType     =   0
         Text            =   "Price"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.6199999999999999955591
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.8800000000000000044409
         WordWrap        =   False
      End
      Begin ReportLabel Label10
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.1700000000000000122125
         Italic          =   False
         Left            =   2.8999999999999999111822
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "August "
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.8699999999999999955591
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.670000000000000039968
         WordWrap        =   False
      End
      Begin ReportField Field9
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "Aug"
         HasBackColor    =   False
         Height          =   0.1700000000000000122125
         Italic          =   False
         Left            =   3.6499999999999999111822
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         OutputFormat    =   "#0.000"
         SummaryFunc     =   0
         SummaryType     =   0
         Text            =   "Price"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.8900000000000000133227
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.8800000000000000044409
         WordWrap        =   False
      End
      Begin ReportLabel Label11
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.1799999999999999933387
         Italic          =   False
         Left            =   4.8799999999999998934186
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "September "
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.1199999999999999955591
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.920000000000000039968
         WordWrap        =   False
      End
      Begin ReportField Field10
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "Sep"
         HasBackColor    =   False
         Height          =   0.1700000000000000122125
         Italic          =   False
         Left            =   5.8600000000000003197442
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         OutputFormat    =   "#0.000"
         SummaryFunc     =   0
         SummaryType     =   0
         Text            =   "Price"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.1300000000000000044409
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.8800000000000000044409
         WordWrap        =   False
      End
      Begin ReportLabel Label12
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.1799999999999999933387
         Italic          =   False
         Left            =   4.8799999999999998934186
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "October "
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.3800000000000000044409
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.920000000000000039968
         WordWrap        =   False
      End
      Begin ReportField Field11
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "Oct"
         HasBackColor    =   False
         Height          =   0.1700000000000000122125
         Italic          =   False
         Left            =   5.8600000000000003197442
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         OutputFormat    =   "#0.000"
         SummaryFunc     =   0
         SummaryType     =   0
         Text            =   "Price"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.3800000000000000044409
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.8800000000000000044409
         WordWrap        =   False
      End
      Begin ReportLabel Label13
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.1799999999999999933387
         Italic          =   False
         Left            =   4.8799999999999998934186
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "November "
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.6199999999999999955591
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.920000000000000039968
         WordWrap        =   False
      End
      Begin ReportField Field12
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "Nov"
         HasBackColor    =   False
         Height          =   0.1700000000000000122125
         Italic          =   False
         Left            =   5.8600000000000003197442
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         OutputFormat    =   "#0.000"
         SummaryFunc     =   0
         SummaryType     =   0
         Text            =   "Price"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.6199999999999999955591
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.8800000000000000044409
         WordWrap        =   False
      End
      Begin ReportLabel Label14
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.1799999999999999933387
         Italic          =   False
         Left            =   4.8799999999999998934186
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "December "
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.8800000000000000044409
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.920000000000000039968
         WordWrap        =   False
      End
      Begin ReportField Field13
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "Dec"
         HasBackColor    =   False
         Height          =   0.1700000000000000122125
         Italic          =   False
         Left            =   5.8600000000000003197442
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         OutputFormat    =   "#0.000"
         SummaryFunc     =   0
         SummaryType     =   0
         Text            =   "Price"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.8800000000000000044409
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.8800000000000000044409
         WordWrap        =   False
      End
      Begin ReportLineShape LineShape1
         LineColor       =   &c00000000
         LineStyle       =   0
         LockedInPosition=   False
         X1              =   2.7099999999999999644729
         X2              =   2.7099999999999999644729
         Y1              =   0.0500000000000000027756
         Y2              =   1.1200000000000001065814
      End
      Begin ReportLineShape LineShape2
         LineColor       =   &c00000000
         LineStyle       =   0
         LockedInPosition=   False
         X1              =   4.71999999999999975131
         X2              =   4.71999999999999975131
         Y1              =   0.0500000000000000027756
         Y2              =   1.1200000000000001065814
      End
   End
   Begin  GroupFooter1
      Type            =   6
      GroupByField    =   ""
      Height          =   0.0599999999999999977796
      StartNewPageAtEndOfGroup=   "False"
   End
   Begin  PageFooter
      Type            =   5
      GroupByField    =   ""
      Height          =   0.25
   End
End
#tag EndReport

#tag ReportCode
#tag EndReportCode

