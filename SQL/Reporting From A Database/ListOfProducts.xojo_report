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
         Height          =   0.375
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
         Top             =   0.1779999999999999915623
         Underline       =   False
         VerticalAlign   =   1
         Width           =   2.875
         WordWrap        =   False
      End
      Begin ReportLabel Label2
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.1330000000000000071054
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
         Top             =   0.8040000000000000479616
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.5
         WordWrap        =   False
      End
      Begin ReportLabel Label3
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.1330000000000000071054
         Italic          =   False
         Left            =   2.3330000000000001847411
         LineSpacing     =   0.0
         LockedInPosition=   False
         Multiline       =   False
         Text            =   "Price"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "Helvetica"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   0.7980000000000000426326
         Underline       =   False
         VerticalAlign   =   1
         Width           =   0.5
         WordWrap        =   False
      End
      Begin ReportLabel Label4
         BackColor       =   &cFFFFFF00
         Bold            =   False
         HasBackColor    =   False
         Height          =   0.1330000000000000071054
         Italic          =   False
         Left            =   3.612000000000000099476
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
      Height          =   0.9270000000000000461853
      Begin ReportField Field1
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "Name"
         HasBackColor    =   False
         Height          =   0.1330000000000000071054
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
         Top             =   0.0889999999999999957812
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
         Height          =   0.1330000000000000071054
         Italic          =   False
         Left            =   2.3389999999999999680256
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
         Top             =   0.0889999999999999957812
         Underline       =   False
         VerticalAlign   =   1
         Width           =   1.1330000000000000071054
         WordWrap        =   False
      End
      Begin ReportField Field3
         BackColor       =   &cFFFFFF00
         Bold            =   False
         DataField       =   "PartNumber"
         HasBackColor    =   False
         Height          =   0.1330000000000000071054
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
         Top             =   0.0830000000000000043299
         Underline       =   False
         VerticalAlign   =   1
         Width           =   1.1330000000000000071054
         WordWrap        =   False
      End
      Begin ReportPicture Picture1
         Alignment       =   1
         BackColor       =   &cFFFFFF00
         DataField       =   "Image"
         Height          =   0.75
         Image           =   0
         Left            =   4.875
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

