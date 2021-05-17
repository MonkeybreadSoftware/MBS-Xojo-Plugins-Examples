#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
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
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   -1183270226
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Soft Declare Test"
   Visible         =   True
   Width           =   300
   Begin ListBox ListBox1
      AllowAutoHideScrollbars=   True
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DisabledBalloonHelp=   ""
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      FontUnit        =   0
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasBorder       =   True
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   287
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   -1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      ScrollBarHorizontal=   False
      ScrollBarVertical=   True
      ScrollPosition  =   "0"
      ScrollPositionX =   "0"
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   -1
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   302
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  TestConstant
		  TestDYLIB
		  TestFramework
		  TestLinux
		  TestSpeech
		  TestWindows
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub TestConstant()
		  if TargetCarbon then
		    dim c as SoftDeclareMBS
		    dim s as CFStringMBS
		    dim m as MemoryBlock
		    
		    // Test Mac OS X
		    // Load the constant kABFirstNameProperty from the Addressbook framework
		    
		    w "Testing constant loading with Mac OS X Framework"
		    
		    c=new SoftDeclareMBS
		    
		    if c.loadlibrary("Addressbook.framework") then
		      w "Loaded "+c.libname+" to "+format(c.libhandle,"-0")+"."
		      if c.LoadConstant("kABFirstNameProperty") then
		        w "Loaded constant "+c.ConstantName+" to "+format(c.ConstantPointer,"-0")+"."
		        
		        m=NewMemoryBlockFromPtrMBS(c.ConstantPointer) // I hope it's not nil!
		        s=new CFStringMBS
		        s.Handle=m.Long(0)
		        s.RetainObject
		        
		        if s=nil then
		          w "The constant is not a CFString!?"
		        else
		          w "Got value: "+s.str
		        end if
		        s=nil
		        m=nil
		      else
		        w "Loading of constant "+c.ConstantName+" failed."
		      end if
		    else
		      w "Loading of "+c.libname+" failed."
		    end if
		    c=nil
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestDYLIB()
		  dim s as SoftDeclareMBS
		  dim m as MemoryBlock
		  
		  w "Testing dylib loading on Mac OS X"
		  
		  s=new SoftDeclareMBS
		  
		  // void *malloc(size_t size);
		  
		  if s.LoadDylib("/usr/lib/libc.dylib") then
		    if s.LoadFunction("malloc") then
		      m=NewMemoryBlock(4)
		      m.Long(0)=100000000 // you see this 100 MB allocation in Activity Monitor
		      if s.CallFunction(1,m) then
		        w "Success on malloc: "+hex(s.Result)
		      else
		        w "Failed on calling function."
		      end if
		    else
		      w "Failed on loading function."
		    end if
		  else
		    w "Failed on loading library."
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestFramework()
		  dim c as SoftDeclareMBS
		  
		  w "Testing framework loading on Mac OS X"
		  
		  // Test Mac OS X
		  c=new SoftDeclareMBS
		  if c.LoadFramework("AppleShareClient.framework") then
		    w "Loaded "+c.libname+" to "+format(c.libhandle,"-0")+"."
		    if c.loadfunction("AFPLibraryVersion") then
		      w "Loaded function "+c.FunctionName+" to "+format(c.functionPointer,"-0")+"."
		      
		      if c.CallFunction(0,nil) then
		        w "Calling returned "+hex(c.result)
		        
		      else
		        w "Failed to call function."
		      end if
		    else
		      w "Loading of function "+c.FunctionName+" failed."
		    end if
		  else
		    w "Loading of "+c.libname+" failed."
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestLinux()
		  dim s as SoftDeclareMBS
		  dim m as MemoryBlock
		  
		  w "Testing lib loading on Linux"
		  
		  s=new SoftDeclareMBS
		  
		  // void *malloc(size_t size);
		  
		  if s.LoadLibrary("libc.so.6") then
		    if s.LoadFunction("malloc") then
		      m=NewMemoryBlock(4)
		      m.Long(0)=100000000 // you see this 100 MB allocation in Activity Monitor
		      if s.CallFunction(1,m) then
		        w "Success on malloc: "+hex(s.Result)
		      else
		        w "Failed on calling function."
		      end if
		    else
		      w "Failed on loading function. "
		    end if
		  else
		    w "Failed on loading library. "+s.Liberror
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestSpeech()
		  dim p,m as MemoryBlock
		  dim name as string
		  dim c as SoftDeclareMBS
		  
		  c=new SoftDeclareMBS
		  
		  w "Testing carbon library loading on Mac OS"
		  
		  // make the string for the first parameter
		  p=newmemoryBlock(256)
		  p.pstring(0)="Hello World!"
		  
		  // make the memoryblock for the parameters
		  m=newmemoryBlock(4)
		  m.long(0)=p.AddressMBS(0) // set the first parameter to the address of the string buffer
		  
		  // Which library to call?
		  if Targetcarbon then
		    if RunningOnCarbonXMBS then
		      name="Carbon.framework" 
		    else
		      name="CarbonLib" // for Carbon inside Classic
		    end if
		  else
		    name="SpeechLib"
		  end if
		  
		  // Load librarys
		  if c.loadlibrary(name) then
		    w "Loaded "+c.libname+" to "+format(c.libhandle,"-0")+"."
		    // Load function
		    if c.loadfunction("SpeakString") then
		      w "Loaded function "+c.FunctionName+" to "+format(c.functionPointer,"-0")+"."
		      
		      // Call function
		      if c.CallFunction(1,m) then
		        w "Calling returned "+hex(c.result) // result doesn't matter, but here is it.
		      else
		        w "Failed to call function."
		      end if
		    else
		      w "Loading of function "+c.FunctionName+" failed."
		    end if
		  else
		    w "Loading of "+c.libname+" failed."
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestWindows()
		  if TargetWin32 then
		    dim f as FolderItem
		    dim p,m,b as MemoryBlock
		    dim c as SoftDeclareMBS
		    dim path as string
		    
		    // For Windows, we try GetShortPathName which can't be hard declared because it's not available on Windows NT 4 SP 6
		    // (This was a bug to hard link it to MBS Plugin 2.5, so I fixed this for MBS Plugin 2.6)
		    
		    // DWORD GetShortPathNameA(IN LPCSTR lpszLongPath,OUT LPSTR  lpszShortPath, IN DWORD    cchBuffer);
		    
		    w "Testing DLL loading on Windows"
		    
		    c=new SoftDeclareMBS
		    
		    f=ApplicationsFolderMBS(-32766) // get a folder...
		    
		    path=f.NativePath
		    
		    b=newmemoryBlock(1024)
		    b.long(0)=0 // make emptry C string
		    
		    p=newmemoryBlock(lenb(path)+10)
		    p.cstring(0)=path
		    
		    m=newmemoryBlock(12+10)
		    m.long(0)=p.AddressMBS(0)
		    m.long(4)=b.AddressMBS(0)
		    m.long(8)=b.size-1
		    
		    if c.loadlibrary("KERNEL32") then
		      w "Loaded "+c.libname+" to "+format(c.libhandle,"-0")+"."
		      if c.loadfunction("GetShortPathNameA") then
		        w "Loaded function "+c.FunctionName+" to "+format(c.functionPointer,"-0")+"."
		        
		        if c.CallFunction(3,m) then
		          w "Calling returned "+hex(c.result)
		          w "Short path is: "+b.cstring(0)
		        else
		          w "Failed to call function."
		        end if
		      else
		        w "Loading of function "+c.FunctionName+" failed."
		      end if
		    else
		      w "Loading of "+c.libname+" failed."
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub w(s as string)
		  listBox1.addrow s
		End Sub
	#tag EndMethod


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
