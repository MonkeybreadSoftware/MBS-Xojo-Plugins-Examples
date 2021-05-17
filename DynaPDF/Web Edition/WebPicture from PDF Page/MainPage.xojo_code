#tag WebPage
Begin WebPage MainPage
   AllowTabOrderWrap=   True
   Compatibility   =   ""
   ControlID       =   ""
   Enabled         =   True
   Height          =   400
   ImplicitInstance=   True
   Index           =   0
   Indicator       =   0
   IsImplicitInstance=   False
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   LockVertical    =   False
   MinimumHeight   =   400
   MinimumWidth    =   600
   TabIndex        =   0
   Title           =   "PDF"
   Top             =   0
   Visible         =   True
   Width           =   600
   _ImplicitInstance=   False
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mName          =   ""
   _mPanelIndex    =   -1
   Begin WebImageViewer ImageView1
      ControlID       =   ""
      Enabled         =   True
      Height          =   366
      HorizontalAlignment=   2
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Picture         =   0
      Scope           =   0
      SVGData         =   ""
      TabIndex        =   0
      Tooltip         =   ""
      Top             =   14
      URL             =   ""
      VerticalAlignment=   2
      Visible         =   True
      Width           =   560
      _mPanelIndex    =   -1
      _ProtectImage   =   False
   End
   Begin WebTimer Timer1
      ControlID       =   ""
      Enabled         =   True
      Index           =   -2147483648
      Left            =   0.0
      Location        =   "Locations.Browser"
      LockedInPosition=   False
      Period          =   1000
      RunMode         =   1
      Scope           =   0
      Top             =   0.0
      _mPanelIndex    =   -1
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RenderPDFWebPicture(file as FolderItem, pageIndex as integer, width as integer, height as integer) As WebPicture
		  Dim pdf As New DynaPDFMBS
		  
		  // create PDF environment and setup
		  If pdf.CreateNewPDF(Nil) Then
		    if pdf.SetImportFlags(pdf.kifImportAsPage + pdf.kifImportAll) then
		      
		      // open source file
		      If pdf.OpenImportFile(file) >= 0 Then
		        
		        // import file
		        if pdf.Append then
		          If pdf.ImportPageEx(PageIndex, 1.0, 1.0) >= 0 Then
		            if pdf.EndPage then
		              
		              // make a jpeg
		              If pdf.SetJPEGQuality(80) Then
		                
		                // render 1x
		                If pdf.RenderPageToImage(pageIndex, Nil, 72, width, height, pdf.krfDefault, pdf.kpxfRGB, pdf.kcfJPEG, pdf.kifmJPEG) Then
		                  Dim LowData As String = pdf.GetImageBuffer
		                  
		                  // render 2x
		                  If pdf.RenderPageToImage(pageIndex, Nil, 144, width, height, pdf.krfDefault, pdf.kpxfRGB, pdf.kcfJPEG, pdf.kifmJPEG) Then
		                    Dim HighData As String = pdf.GetImageBuffer
		                    
		                    // now build 1x picture
		                    Dim w As New WebPicture(LowData, "page.jpg")
		                    
		                    // and put in 2x data
		                    w.data = HighData
		                    
		                    // and return with HiDPI content
		                    Return w
		                  end if
		                end if
		              end if
		            end if
		          end if
		        end if
		      end if
		    end if
		  End If
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RenderPDFWebPicture(PDFData as String, pageIndex as integer, width as integer, height as integer) As WebPicture
		  Dim pdf As New DynaPDFMBS
		  
		  // create PDF environment and setup
		  If pdf.CreateNewPDF(Nil) Then
		    if pdf.SetImportFlags(pdf.kifImportAsPage + pdf.kifImportAll) then
		      
		      // open source file
		      If pdf.OpenImportBuffer(PDFData) >= 0 Then
		        
		        // import file
		        if pdf.Append then
		          If pdf.ImportPageEx(PageIndex, 1.0, 1.0) >= 0 Then
		            if pdf.EndPage then
		              
		              // make a jpeg
		              If pdf.SetJPEGQuality(80) Then
		                
		                // render 1x
		                If pdf.RenderPageToImage(pageIndex, Nil, 72, width, height, pdf.krfDefault, pdf.kpxfRGB, pdf.kcfJPEG, pdf.kifmJPEG) Then
		                  Dim LowData As String = pdf.GetImageBuffer
		                  
		                  // render 2x
		                  If pdf.RenderPageToImage(pageIndex, Nil, 144, width, height, pdf.krfDefault, pdf.kpxfRGB, pdf.kcfJPEG, pdf.kifmJPEG) Then
		                    Dim HighData As String = pdf.GetImageBuffer
		                    
		                    // now build 1x picture
		                    Dim w As New WebPicture(LowData, "page.jpg")
		                    
		                    // and put in 2x data
		                    w.data = HighData
		                    
		                    // and return with HiDPI content
		                    Return w
		                  end if
		                end if
		              end if
		            end if
		          end if
		        end if
		      end if
		    end if
		  End If
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start()
		  
		  // quickly render one PDF with given page
		  
		  dim w as integer = ImageView1.Width
		  dim h as integer = ImageView1.Height
		  
		  dim file as Folderitem = FindFile("license.pdf")
		  
		  if file = nil or file.Exists = false then
		    MsgBox "Please change path to test file."
		  else
		    dim wp as WebPicture = RenderPDFWebPicture(file, 1, w, h)
		    
		    ImageView1.Picture = wp
		  end if
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Timer1
	#tag Event
		Sub Run()
		  start
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="_mPanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue="-1"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutType"
		Visible=true
		Group="Behavior"
		InitialValue="LayoutTypes.Fixed"
		Type="LayoutTypes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Fixed"
			"1 - Flex"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Behavior"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignHeight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignWidth"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mName"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabOrderWrap"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Visual Controls"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Indicator"
		Visible=false
		Group="Visual Controls"
		InitialValue=""
		Type="WebUIControl.Indicators"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Primary"
			"2 - Secondary"
			"3 - Success"
			"4 - Danger"
			"5 - Warning"
			"6 - Info"
			"7 - Light"
			"8 - Dark"
			"9 - Link"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutDirection"
		Visible=true
		Group="WebView"
		InitialValue="LayoutDirections.LeftToRight"
		Type="LayoutDirections"
		EditorType="Enum"
		#tag EnumValues
			"0 - LeftToRight"
			"1 - RightToLeft"
			"2 - TopToBottom"
			"3 - BottomToTop"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Index"
		Visible=false
		Group="ID"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="IsImplicitInstance"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockHorizontal"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockVertical"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
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
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Behavior"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_ImplicitInstance"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
