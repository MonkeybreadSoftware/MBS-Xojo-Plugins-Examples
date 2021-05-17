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
   MenuBar         =   737446376
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "CPUID"
   Visible         =   True
   Width           =   600
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
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
      Height          =   387
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
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   -1
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   602
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Listbox FeatureDescriptions
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
      Height          =   100
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Floating point unit\rVirtual mode extension\rDebugging extension\rPage size extension\rTime-stamp counter\rModel-specific regsisters, RDMSR/WRMSR supported\rPhysical address extension\rMachine check exception\rCMPXCHG8B instruction supported\rAPIC support\rMemory type range registers\rSYSENTER / SYSEXIT instructions supported\rPage global enable\rMachine check architecture\rCMOVxx instructions supported\rPage attribute table\r36-bit page address extension\rProcessor serial # implemented (Intel P3 only)\rCLFLUSH instruction supported\rDebug store supported\rACPI support (power states)\rMMX instruction set supported\rFXSAVE / FXRSTOR supported\rStreaming-SIMD Extensions (SSE) supported\rSSE2 instructions supported\rSelf-snoop\rHyper-threading supported (but might be disabled)\rThermal monitor\rIA64 supported (Itanium only)\rPending-break enable\rPNI (SSE3) instructions supported\rPCLMULQDQ instruction supported\r64-bit Debug store supported\rMONITOR / MWAIT supported\rCPL Qualified Debug Store\rVirtualization technology supported\rSafer mode exceptions\rEnhanced SpeedStep\rThermal monitor 2\rSSSE3 instructionss supported (this is different from SSE3!)\rContext ID supported\rCMPXCHG16B instruction supported\rSend Task Priority Messages disable\rPerformance capabilities MSR supported\rDirect cache access supported\rSSE 4.1 instructions supported\rSSE 4.2 instructions supported\rSYSCALL / SYSRET instructions supported\rExecute disable bit supported\rMOVBE instruction supported\rPOPCNT instruction supported\rAES* instructions supported\rXSAVE/XRSTOR/etc instructions supported\rnon-privileged copy of OSXSAVE supported\rAdvanced vector extensions supported\rAMD MMX-extended instructions supported\rAMD 3DNow! instructions supported\rAMD 3DNow! extended instructions supported\rNo-execute bit supported\rFFXSR: FXSAVE and FXRSTOR optimizations\rRDTSCP instruction supported (AMD-only)\rLong mode (x86_64/EM64T) supported\rLAHF/SAHF supported in 64-bit mode\rcore multi-processing legacy mode\rAMD Secure virtual machine\rLZCNT instruction support\rMisaligned SSE supported\rSSE 4a from AMD\rPREFETCH/PREFETCHW support\rOS Visible Workaround (AMD)\rInstruction-based sampling\rSSE 5 instructions supported (deprecated, will never be 1)\rSKINIT / STGI supported\rWatchdog timer support\rTemperature sensor\rFrequency ID control\rVoltage ID control\rTHERMTRIP\rAMD-specified hardware thermal control\rSoftware thermal control\r100 MHz multiplier control\rHardware P-state control\rTSC ticks at constant rate\rThe XOP instruction set (same as the old CPU_FEATURE_SSE5)\rThe FMA3 instruction set\rThe FMA4 instruction set\rTrailing bit manipulation instruction support\r16-bit FP convert instruction support\rRdRand instruction\rx2APIC, APIC_BASE.EXTD, MSRs 0000_0800h...0000_0BFFh 64-bit ICR (+030h but not +031h), no DFR (+00Eh), SELF_IPI (+040h) also see standard level 0000_000Bh\rCore performance boost\rMPERF/APERF MSRs support\rProcessor Feedback Interface support\rProcessor accumulator"
      Italic          =   False
      Left            =   -29
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   512
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   False
      Width           =   100
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  List.AddRow "VendorName", CPUIDMBS.VendorName
		  List.AddRow "Vendor", str(CPUIDMBS.Vendor)
		  List.AddRow "BrandString", CPUIDMBS.BrandString
		  List.AddRow "CodeName", CPUIDMBS.CodeName
		  List.AddRow "Family", str(CPUIDMBS.family)
		  List.AddRow "Model", str(CPUIDMBS.model)
		  List.AddRow "Stepping", str(CPUIDMBS.stepping)
		  List.AddRow "ExtFamily", str(CPUIDMBS.ExtFamily)
		  List.AddRow "ExtModel", str(CPUIDMBS.ExtModel)
		  List.AddRow "NumCores", str(CPUIDMBS.NumCores)
		  List.AddRow "NumLogicalCPUs", str(CPUIDMBS.NumLogicalCPUs)
		  List.AddRow "TotalLogicalCPUs", str(CPUIDMBS.TotalLogicalCPUs)
		  List.AddRow "L1DataCache", str(CPUIDMBS.L1DataCache)+" KB"
		  List.AddRow "L1InstructionCache", str(CPUIDMBS.L1InstructionCache)+" KB"
		  List.AddRow "L2Cache", str(CPUIDMBS.L2Cache)+" KB"
		  List.AddRow "L3Cache", str(CPUIDMBS.L3Cache)+" KB"
		  
		  for i as integer = 0 to 93
		    list.AddRow CPUIDMBS.FeatureName(i)+" "+FeatureDescriptions.Cell(i,0), str(CPUIDMBS.Flags(i))
		  next
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
