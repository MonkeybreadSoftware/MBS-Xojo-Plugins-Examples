#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   192569611
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Open CL Test"
   Visible         =   True
   Width           =   600
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   3
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
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   366
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Index	Input (a value)	Output (squared value)"
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
      TextFont        =   "System"
      TextSize        =   0.0
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
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // OpenCL example.
		  // based on an example from Apple
		  // http://developer.apple.com/library/mac/#documentation/Performance/Conceptual/OpenCL_MacProgGuide/Example:Hello,World/Example:Hello,World.html
		  //
		  ////////////////////////////////////////////////////////////////////////////////
		  // Use a static data size for simplicity
		  //
		  
		  const DATA_SIZE = 1024
		  
		  ////////////////////////////////////////////////////////////////////////////////
		  
		  // Simple compute kernel that computes the square of an input array.
		  //
		  dim KernelSource as string = EndOfLine+_
		  "__kernel void square(                                                       "+EndOfLine+_
		  "   __global float* input,                                              "+EndOfLine+_
		  "   __global float* output,                                             "+EndOfLine+_ 
		  "   const unsigned int count)                                           "+EndOfLine+_
		  "{                                                                      "+EndOfLine+_
		  "   int i = get_global_id(0);                                           "+EndOfLine+_
		  "   if(i < count)                                                       "+EndOfLine+_
		  "       output[i] = input[i] * input[i];                                "+EndOfLine+_
		  "}                                                                      "+EndOfLine+_ 
		  ""
		  
		  ////////////////////////////////////////////////////////////////////////////////
		  
		  // Get data on which to operate
		  //
		  
		  dim outputdata as new MemoryBlock(DATA_SIZE*4)
		  dim inputdata as new MemoryBlock(DATA_SIZE*4)
		  for i as integer = 0 to DATA_SIZE-1
		    inputdata.SingleValue(i*4)=rnd
		  next
		  
		  // Get an ID for the device
		  
		  dim devices(-1) as CLDeviceMBS = OpenCLMBS.AllDevices(CLDeviceMBS.kDeviceTypeGPU)
		  
		  if UBound(devices)=-1 then
		    MsgBox "no devices found."
		    Return
		  end if
		  
		  dim device as CLDeviceMBS = devices(0) // we use first one
		  
		  // Create a context
		  //
		  dim context as new CLContextMBS(device, CLContextMBS.kErrorModeLogMessagesToSystemLog)
		  
		  // Create a command queue
		  //
		  dim queue as new CLCommandQueueMBS(context, device, 0)
		  
		  // Create the compute program from the source buffer
		  //
		  dim program as new CLProgramMBS(context, KernelSource)
		  
		  // Build the program executable
		  //
		  
		  program.BuildProgram
		  if program.lasterror <> 0 then
		    MsgBox "Error: Failed to build program executable"+EndOfLine+EndOfLine+Program.BuildLog(device)
		    Return
		  end if
		  
		  // take a look on the code
		  'dim binarysizes(-1) as UInt64 = Program.BinarySizes
		  'dim binaries(-1) as string = Program.Binaries
		  
		  // Create the compute kernel in the program we wish to run
		  //
		  dim kernel as new clKernelMBS(program, "square")
		  
		  // Create the input and output arrays in device memory for our calculation
		  
		  dim input  as new CLMemMBS(context, CLMEMMBS.kMemoryReadOnly,  inputdata.Size)
		  dim output as new CLMemMBS(context, CLMEMMBS.kMemoryWriteOnly, outputdata.Size)
		  
		  // Write our data set into the input array in device memory
		  
		  queue.EnqueueWriteBuffer(input, 0, inputdata.Size, inputdata)
		  
		  // Set the arguments to our compute kernel
		  //
		  
		  kernel.SetKernelArgMem(0, input)
		  kernel.SetKernelArgMem(1, output)
		  kernel.SetKernelArgInt32(2, DATA_SIZE)
		  
		  // Get the maximum work-group size for executing the kernel on the device
		  
		  dim localsize as integer = kernel.GetKernelWorkGroupSize(Device)
		  
		  // Execute the kernel over the entire range of the data set
		  //
		  dim globalsize as integer = DATA_SIZE
		  queue.EnqueueNDRangeKernel(kernel, globalsize, localsize)
		  
		  // Wait for the command queue to get serviced before reading back results
		  
		  queue.finish
		  
		  // Read the results from the device
		  //
		  
		  queue.EnqueueReadBuffer(output, 0, outputdata.size, outputdata)
		  
		  // Show result
		  
		  for i as integer = 0 to DATA_SIZE-1
		    List.AddRow str(i+1)
		    List.Cell(List.LastIndex,1) = str(inputdata.SingleValue(i*4))
		    List.Cell(List.LastIndex,2) = str(outputdata.SingleValue(i*4))
		    
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
