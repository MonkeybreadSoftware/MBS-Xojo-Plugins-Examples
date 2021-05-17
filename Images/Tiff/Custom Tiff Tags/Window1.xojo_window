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
   Height          =   300
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   677277183
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Untitled"
   Visible         =   True
   Width           =   300
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  const TIFFTAG_ASCIITAG = 40666
		  const TIFFTAG_LONGTAG = 40667
		  const TIFFTAG_SHORTTAG = 40668
		  const TIFFTAG_RATIONALTAG = 40669
		  const TIFFTAG_FLOATTAG = 40670
		  const TIFFTAG_DOUBLETAG = 40671
		  const TIFFTAG_BYTE = 40672
		  
		  const TIFFTAG_SOFTWARE=305
		  
		  const TIFF_BYTE=1
		  const TIFF_ASCII=2
		  const TIFF_SHORT=3 // integer 16 bit signed
		  const TIFF_LONG=4 // integer 32 bit
		  const TIFF_FLOAT=11
		  const TIFF_DOUBLE=12
		  
		  const FIELD_CUSTOM = 65 
		  
		  dim ofile,file as FolderItem
		  dim value as string
		  dim m as MemoryBlock
		  dim count as integer
		  
		  // you can destroy your tiff much too easy, so we copy it from a template
		  
		  file=SpecialFolder.Desktop.Child("test.tif")
		  file.Delete
		  file=SpecialFolder.Desktop.Child("test.tif")
		  
		  ofile=SpecialFolder.Desktop.Child("testTemplate.tif") 
		  ofile.CopyFileTo file
		  
		  file=SpecialFolder.Desktop.Child("test.tif")
		  
		  dim t as new TiffPictureMBS
		  
		  if t.Open(file, "r+") then
		    
		    if t.GetFieldString(TIFFTAG_SOFTWARE, value) then
		      MsgBox value
		    else
		      MsgBox "Failed to read string."
		    end if
		    
		    // register fields
		    if not t.AddCustomTag(TIFFTAG_ASCIITAG, -1, -1, TIFF_ASCII, FIELD_CUSTOM, 1, 0, "MyString") then
		      MsgBox "AddCustomTag failed1."
		    end if
		    
		    if not t.AddCustomTag(TIFFTAG_LONGTAG, 1, 1, TIFF_LONG, FIELD_CUSTOM, 0, 1, "MyInteger") then
		      MsgBox "AddCustomTag failed2."
		    end if
		    
		    // set fields
		    if t.SetFieldString(TIFFTAG_ASCIITAG, "Tag contents")=false then
		      MsgBox "SetFieldString failed."
		    end if
		    
		    m=NewMemoryBlock(4)
		    m.Long(0)=2008
		    if t.SetFieldMemory(TIFFTAG_LONGTAG,1, m)=false then
		      MsgBox "SetFieldInteger failed."
		    end if
		    
		    call t.RewriteDirectory
		    t.Close
		  else
		    MsgBox "Failed to open tiff 1" 
		  end if
		  
		  t = new TiffPictureMBS
		  if t.Open(file, "r") then
		    
		    // read generic field (unknown to tiff lib)
		    m=t.GetFieldMemory(TIFFTAG_ASCIITAG, count)
		    MsgBox str(count)+" bytes in string"
		    if m=nil then
		      MsgBox "Failed to read data"
		    else
		      MsgBox m.cstring(0)
		    end if
		    
		    // read generic field (unknown to tiff lib)
		    m=t.GetFieldMemory(TIFFTAG_LONGTAG, count)
		    MsgBox str(count)+" integer value found."
		    
		    if m=nil or count=0 then
		      MsgBox "Failed to read data"
		    else
		      MsgBox str(m.long(0))
		    end if
		    
		    t.Close
		  else
		    MsgBox "Failed to open tiff 2"
		  end if
		  
		  
		  
		  
		End Sub
	#tag EndEvent


#tag EndWindowCode

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
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="300"
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
		InitialValue="False"
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
