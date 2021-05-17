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
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   621565567
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Zip Tests"
   Visible         =   True
   Width           =   600
   Begin Listbox Listbox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   302
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Courier"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin ProgressBar ProgressBar1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Indeterminate   =   False
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Maximum         =   100
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   328
      Transparent     =   True
      Value           =   0.0
      Visible         =   True
      Width           =   560
   End
   Begin ProgressBar ProgressBar2
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Indeterminate   =   False
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Maximum         =   100
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   360
      Transparent     =   True
      Value           =   0.0
      Visible         =   True
      Width           =   560
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  w=new work
		  w.run
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function CompareFiles(fi as FolderItem, fo as FolderItem) As integer
		  dim bi,bo as BinaryStream
		  
		  bi=fi.OpenAsBinaryFile(false)
		  bo=fo.OpenAsBinaryFile(false)
		  
		  dim si,so as string
		  
		  si=bi.Read(bi.Length)
		  so=bo.Read(bo.Length)
		  
		  return StrCompBytesMBS(si,so)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CompressFile(fi as folderitem, fo as folderitem, chunk as integer)
		  dim z as ZLibcompressMBS
		  dim o,i as String
		  dim bo,bi as BinaryStream
		  
		  z=new ZLibcompressMBS(chunk)
		  
		  bi=fi.OpenAsBinaryFile(false)
		  if bi=nil then
		    MsgBox "Can't open source file."
		    Return
		  end if
		  
		  bo=fo.CreateBinaryFile("application/x-compress")
		  if bo=nil then
		    MsgBox "Can't open destination file."
		    Return
		  end if
		  
		  bo.LittleEndian=false
		  bo.WriteInt64 bi.Length
		  
		  z.InitZip(9)
		  
		  ProgressBar1.Maximum=bi.Length/1024
		  
		  do
		    
		    if z.InputAvail=0 and not bi.eof then
		      if z.SetInput(bi.Read(chunk)) then
		        ProgressBar1.Value=bi.Position/1024
		        ProgressBar1.Refresh
		        UpdateNow
		      else
		        MsgBox "SetInput failed!"
		        Return
		      end if
		    end if
		    
		    z.ProcessZip(False)
		    
		    o=z.GetOutput
		    bo.Write o
		    
		  loop until (lenb(o)=0 and z.OutputSize=0 and z.InputAvail=0 and bi.eof) or UserCancelled
		  
		  // maybe flush is needed?
		  
		  do
		    z.ProcessZip(true)
		    
		    o=z.GetOutput
		    bo.Write o
		    
		  loop until (lenb(o)=0 and z.OutputSize=0 and z.InputAvail=0 and bi.eof) or UserCancelled
		  
		  
		  // finish
		  
		  z.EndZip
		  
		  o=z.GetOutput
		  if o<>"" then
		    bo.Write o
		  end if
		  
		  bi.Close
		  bo.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DecompressFile(fi as FolderItem, fo as FolderItem, chunk as integer)
		  // Decompress using the ZipCompressMBS class
		  
		  dim z as ZLibDecompressMBS
		  dim o,i as String
		  dim bo,bi as BinaryStream
		  dim s as String
		  dim l as Int64
		  
		  z=new ZLibDecompressMBS(chunk)
		  
		  bi=fi.OpenAsBinaryFile(false)
		  if bi=nil then
		    MsgBox "Can't open source file."
		    Return
		  end if
		  
		  bo=fo.CreateBinaryFile("special/any")
		  if bo=nil then
		    MsgBox "Can't open destination file."
		    Return
		  end if
		  
		  bi.LittleEndian=false
		  
		  l=bi.ReadInt64
		  
		  z.InitZip
		  
		  ProgressBar2.Maximum=bi.Length/1024
		  
		  do
		    
		    if z.InputAvail=0 and not bi.eof then
		      if z.SetInput(bi.Read(30000)) then
		        ProgressBar2.Value=bi.Position/1024
		        ProgressBar2.Refresh
		        UpdateNow
		      else
		        MsgBox "SetInput failed!"
		        Return
		      end if
		    end if
		    
		    z.ProcessZip(False)
		    
		    o=z.GetOutput
		    bo.Write o
		    
		    // end when no data was created, no output is pending and no input is waiting and the file ended
		  loop until (lenb(o)=0 and z.OutputSize=0 and z.InputAvail=0 and bi.eof) or UserCancelled
		  
		  do
		    z.ProcessZip(true)
		    
		    o=z.GetOutput
		    bo.Write o
		    
		    // end when no data was created, no output is pending and no input is waiting and the file ended
		  loop until (lenb(o)=0 and z.OutputSize=0 and z.InputAvail=0 and bi.eof) or UserCancelled
		  
		  z.EndZip
		  
		  o=z.getOutput
		  if o<>"" then
		    bo.Write o
		  end if
		  
		  bi.Close
		  bo.Close
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MakeTestData()
		  
		  // some random data
		  dim m as MemoryBlock=New MemoryBlock(1024)
		  dim i,c as integer
		  dim r as new Random
		  
		  c=m.Size-1
		  for i=0 to c
		    m.Byte(i)=r.InRange(0,255)
		  next
		  
		  dim t as string = m.StringValue(0,m.Size)
		  dim a(-1) as string
		  
		  for i=0 to 300
		    a.Append t
		  next
		  
		  
		  data=join(a)
		  
		  Listbox1.AddRow "Created test data: "+str(lenb(data))+" bytes"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PrepareFile(f as FolderItem, len as integer)
		  
		  dim stream as BinaryStream=f.CreateBinaryFile("")
		  dim d as string = leftb(data,len)
		  
		  stream.Write d
		  stream.Close
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Test()
		  MakeTestData
		  TestFunction
		  TestClass 1024
		  TestClass 10240
		  TestClass 102400
		  TestClass 1024000
		  TestClass 10240000
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestClass(chunk as integer)
		  for i as integer=1 to 10
		    Listbox1.AddRow "Test Compress class"
		    
		    ProgressBar2.Value=0
		    ProgressBar1.Value=0
		    
		    dim len as integer=rnd*len(data)+1
		    dim uncompressedfile as FolderItem=SpecialFolder.Desktop.Child("ZipTests uncompressed file")
		    dim compressedfile   as FolderItem=SpecialFolder.Desktop.Child("ZipTests compressed file")
		    dim decompressedfile as FolderItem=SpecialFolder.Desktop.Child("ZipTests decompressed file")
		    
		    PrepareFile uncompressedfile,len
		    
		    Listbox1.AddRow "   Uncompressed "+str(uncompressedfile.Length)+" bytes"
		    
		    CompressFile uncompressedfile,compressedfile,chunk
		    
		    Listbox1.AddRow "   Compressed   "+str(compressedfile.Length)+" bytes"
		    
		    DeCompressFile compressedfile,decompressedfile,chunk
		    
		    Listbox1.AddRow "   Decompressed "+str(decompressedfile.Length)+" bytes"
		    
		    if uncompressedfile.Length<>decompressedfile.Length then
		      Listbox1.AddRow "  Error! files do not match in length."
		      listbox1.CellBold(listbox1.LastIndex,0)=true
		    end if
		    
		    if CompareFiles(uncompressedfile, decompressedfile)<>0 then
		      Listbox1.AddRow "  Error! Strings do not match in content."
		      listbox1.CellBold(listbox1.LastIndex,0)=true
		    end if
		    
		    uncompressedfile.Delete
		      compressedfile.Delete
		    decompressedfile.Delete
		    
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestFunction()
		  
		  for i as integer=1 to 10
		    dim len as integer=rnd*len(data)+1
		    dim input as string = leftb(data,len)
		    
		    Listbox1.AddRow "Test Compress function"
		    Listbox1.AddRow "   Uncompressed "+str(lenb(input))+" bytes"
		    
		    dim compressed as string = CompressZLibMBS(input,9)
		    
		    Listbox1.AddRow "   Compressed   "+str(lenb(compressed))+" bytes"
		    
		    dim Decompressed as string = DecompressZLibMBS(compressed, len+1000)
		    
		    Listbox1.AddRow "   Decompressed "+str(lenb(decompressed))+" bytes"
		    
		    if lenb(input)<>lenb(Decompressed) then
		      Listbox1.AddRow "  Error! Strings do not match in length."
		      listbox1.CellBold(listbox1.LastIndex,0)=true
		    end if
		    
		    if StrCompBytesMBS(Decompressed,input)<>0 then
		      Listbox1.AddRow "  Error! Strings do not match in content."
		      listbox1.CellBold(listbox1.LastIndex,0)=true
		    end if
		    
		  next
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private data As string
	#tag EndProperty

	#tag Property, Flags = &h0
		w As work
	#tag EndProperty


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
