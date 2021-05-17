#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   444
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1569038536
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Using Summary Service"
   Visible         =   True
   Width           =   600
   Begin TextArea EditField1
      AcceptTabs      =   False
      Alignment       =   0
      AllowSpellChecking=   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   199
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      Password        =   ""
      ReadOnly        =   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "DynaPDF 2.5 Features\r\rThis document describes improvements and new features which were added in DynaPDF 2.5. Changes which affect backward compatibility are described in the file compatibility_notes.pdf.\r\rColor spaces\rAll PDF color spaces can now also be used with images. Most color spaces were already available in DynaPDF 2.0 but the corresponding handling for images was not implemented.\rIt is also possible to import the image color space as is. This can be very useful if the image is defined in a device independent color space such as Lab or any ICC based color space. See SetGStateFlags() for further information. The section ""Color Spaces"" in the help file provides detailed information about color spaces and the corresponding image handling.\r\rContent Parser\rThe function ParseContent() is now fully documented (as well as all other functions) and easier to understand examples were added to the package. It is now also allowed to write contents to the page while the parser is executed.\r\rEMF Conversion\rSpool fonts are now automatically loaded when converting spool EMF files. It is no longer required to add the user's temp directory to the list of font search paths. Existing applications should be changed to avoid unnecessary calls of AddFontSearchPath() / ClearHostFonts(). AddFontSearchPath() does no longer consider fonts with the extension tmp.\rThe EMF converter produces a warning if a spool font cannot be loaded.\r\rReverse mapping for glyph indexes\rDynaPDF applies now a reverse mapping when glyph indexes are used to output text. This enables the extraction of human readable text from the resulting PDF file. Note that\r\rEncryption\rThe new encryption flag rsEmbFilesOnly can be used to encrypt embedded files only. This flag can be used in combination with 128 or 256 bit AES encryption.\r\rExternal Signatures\rPDF files can now be signed with an external signature handler like the Windows CryptAPI. This enables also the usage of hardware or software certificates of the system's certificate store. The signature handler must only be able to create DER encoded PKCS# 7 objects because CER encoded PKCS# 7 objects are not supported by Adobe's Acrobat or Reader. See CloseAndSignFileExt() in the help file for further information.\r\rFont handling\rDynaPDF supports now OpenType fonts with Postscript outlines as well as external CMaps. External CMaps are very important when creating PDF files for Asian locales because this technology enables the usage of non-embedded OpenType or TrueType based CID fonts in combination with arbitrary CJK encodings. Due to the large number of characters which are typically used in Asian scripts it is often not possible or wished to embed all fonts in the PDF file. The usage of non-embedded CID fonts can greatly reduce the size of the resulting PDF file.\rSupport for external CMaps is also required to extract human readable text from such documents. See SetCIDFont(), SetCMapDir(), GetPageText(), and ParseContent() for further information.\r\rFont Selection\rThe font selection algorithm has been improved to enable the selection of arbitrary font weights from 100 (Thin) through 1000 (UltraBlack) in combination with the family name. Prior versions supported the font weights regular and bold only and due to this limitation it was impossible to select other weights with the family name if more weights were installed.\rIt is now possible to select all font weights from 100 through 1000. If a specific font weight is not available, DynaPDF selects the next thinner weight end emulates the missing weight if necessary (the emulation can also be disabled with SetFontWeight()).\rIn addition, one font can be installed in up to three different formats (OpenType, TrueType, or Type1) and all these formats are selectable. It is also possible to explicitly disable certain font formats from selection (see SetFontSearchOrder() for further information).\rThe default font search order has been changed to TrueType, OpenType, Type1, StdFonts. The 14 PDF standard fonts had the highest search priority in prior versions. Also if a standard font was installed on the system it was impossible to select it unless standard fonts were explicitly disabled. This handling was not optimal. System fonts should have a higher priority than standard fonts.\r\rMissing Glyphs\rAll functions to output text produce now a warning if one or more glyphs could not be found. The warning is passed to the error callback function if set. The return value of the used text function is still true in such a case. This is required to preserve backward compatibility. If no error callback function is used the application can call pdfGetMissingGlyphs() or GetErrorMessage() to determine whether certain glyphs are absent.\r\rInteractive Forms\rThe new function GetFieldEx() offers much easier access to practically all field properties. It is now also possible to access the children of a group field or radio button directly. The creation of field appearances has been revoked to archive identical results in comparison to Acrobat 9.\r\rTemplate handling\rPlacing an imported page on a destination page could be rather difficult with DynaPDF 2.0 especially if the original page was rotated and if it contained a non-normalized media or crop box.\rThe new function PlaceTemplateEx() considers all the painful things like a maybe existing crop box, original page orientation, clipping, and so on automatically when placing an imported page on a destination page. This function simplifies the handling of such templates a lot."
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
   End
   Begin TextArea EditField2
      AcceptTabs      =   False
      Alignment       =   0
      AllowSpellChecking=   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   167
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Mask            =   ""
      Multiline       =   True
      Password        =   ""
      ReadOnly        =   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   257
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Summarize"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   484
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   225
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   96
   End
   Begin Slider Slider1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   347
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Maximum         =   100
      Minimum         =   1
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   229
      Transparent     =   True
      Value           =   10
      Visible         =   True
      Width           =   125
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  run
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub run()
		  Dim a as new AppleScriptMBS
		  Dim lines(-1)as string
		  
		  lines.append "property InText : """""
		  lines.append "property OutText : """""
		  Lines.append "set OutText to summarize InText in "+str(Slider1.Value)
		  
		  a.compile join(lines, EndOfLine.Macintosh)
		  
		  dim t as string = EditField1.text
		  
		  t = ReplaceLineEndings(t, EndOfLine.Macintosh)
		  t = ConvertEncoding(t, encodings.MacRoman)
		  
		  a.ScriptPropertyValue("InText")=t
		  
		  a.Execute
		  
		  EditField2.text = a.ScriptPropertyValue("OutText")
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  run
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Slider1
	#tag Event
		Sub ValueChanged()
		  run
		  
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
