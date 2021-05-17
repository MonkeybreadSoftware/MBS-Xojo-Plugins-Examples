#tag Report
Begin Report ListOfProducts
   Compatibility   =   ""
   Units           =   0
   Width           =   8.5
   Begin  PageHeader
      Type            =   1
      Height          =   1.0
      Begin ReportLabel Label1
         BackColor       =   &cFFFFFF00
         Bold            =   True
         HasBackColor    =   False
         Height          =   0.3800000000000000044409
         Italic          =   False
         Left            =   0.25
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "List Of Products"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "times New roman"
         TextSize        =   24.0
         TextUnit        =   0
         Top             =   0.1799999999999999933387
         Underline       =   False
         VerticalAlign   =   1
         Width           =   2.8799999999999998934186
         WordWrap        =   False
      End
      Begin ReportLabel Label2
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.1300000000000000044409
         Italic          =   False
         Left            =   0.25
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "Name"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.8000000000000000444089
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.5
         WordWrap        =   False
      End
      Begin ReportLabel Label3
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.1300000000000000044409
         Italic          =   False
         Left            =   2.3300000000000000710543
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "Price"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.8000000000000000444089
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.5
         WordWrap        =   False
      End
      Begin ReportLabel Label4
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.1300000000000000044409
         Italic          =   False
         Left            =   3.609999999999999875655
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "Part #"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.8000000000000000444089
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.5
         WordWrap        =   False
      End
   End
   Begin  Body
      Type            =   3
      Height          =   0.9300000000000000488498
      Begin ReportField Field1
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "Name"
         HasBackColor    =   False
         Height          =   0.1300000000000000044409
         Italic          =   False
         Left            =   0.25
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
         Top             =   0.0899999999999999966693
         Underline       =   False
         VerticalAlign   =   1
         Width           =   2.0
         WordWrap        =   False
      End
      Begin ReportField Field2
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "Price"
         HasBackColor    =   False
         Height          =   0.1300000000000000044409
         Italic          =   False
         Left            =   2.3399999999999998578915
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         OutputFormat    =   "\\$###,###.00"
         SummaryFunc     =   0
         SummaryType     =   0
         Text            =   "Untitled"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.0899999999999999966693
         Underline       =   False
         VerticalAlign   =   1
         Width           =   1.1299999999999998934186
         WordWrap        =   False
      End
      Begin ReportField Field3
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "PartNumber"
         HasBackColor    =   False
         Height          =   0.1300000000000000044409
         Italic          =   False
         Left            =   3.609999999999999875655
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
         Top             =   0.0800000000000000016653
         Underline       =   False
         VerticalAlign   =   1
         Width           =   1.1299999999999998934186
         WordWrap        =   False
      End
      Begin ReportPicture Picture1
         Alignment       =   1
         BackColor       =   &cFFFFFF00
         DataField       =   "Image"
         Height          =   0.75
         Image           =   0
         Left            =   4.8799999999999998934186
         LockedInPosition=   False
         Stretch         =   True
         Top             =   0.0800000000000000016653
         Width           =   0.75
      End
   End
   Begin  PageFooter
      Type            =   5
      Height          =   1.0
   End
End
#tag EndReport

#tag ReportCode
#tag EndReportCode

