#tag Class
Protected Class OpenCL
	#tag Method, Flags = &h0
		Sub AppendInputInt32(value as Int32, parameterName as String = "")
		  dim o as OpenCLDataInt32 = new OpenCLDataInt32(value)
		  
		  me.Input.Append(o)
		  
		  if parameterName <> "" then
		    o.ParameterName = parameterName
		  else
		    // Assign a default name
		    o.ParameterName = "input" + Str(me.Input.Ubound + 1)
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendInputMemoryBlock(mb as MemoryBlock, parameterName as String = "")
		  dim o as OpenCLDataMemoryBlock = new OpenCLDataMemoryBlock(mb, mb.Size)
		  
		  me.Input.Append(o)
		  
		  if parameterName <> "" then
		    o.ParameterName = parameterName
		  else
		    // Assign a default name
		    o.ParameterName = "input" + Str(me.Input.Ubound + 1)
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Run()
		  dim i as Integer
		  dim devices(-1) as CLDeviceMBS = OpenCLMBS.AllDevices(CLDeviceMBS.kDeviceTypeGPU)
		  if devices.Ubound = -1 then Return
		  dim device as CLDeviceMBS = devices(0) // we use first one
		  dim context as new CLContextMBS(device, CLContextMBS.kErrorModeLogMessagesToSystemLog)
		  dim queue as new CLCommandQueueMBS(context, device, 0)
		  dim program as new CLProgramMBS(context, me.Source)
		  
		  program.BuildProgram
		  if program.LastError <> 0 then
		    MsgBox "Error: Failed to build program executable" + EndOfLine + EndOfLine + Program.BuildLog(device)
		    Return
		  end if
		  
		  // Create the compute kernel in the program we wish to run
		  dim kernel as new clKernelMBS(program, kDefaultKernelName)
		  
		  // Create the input and output arrays in device memory for our calculation
		  'dim inputCL(-1) as CLMemMBS
		  
		  for i = 0 to me.Input.Ubound
		    me.Input(i).CreateCLMemory(context, CLMEMMBS.kMemoryReadOnly)
		  next
		  
		  me.Output.CreateCLMemory(context, CLMEMMBS.kMemoryWriteOnly)
		  //
		  
		  // Write our data set into the input array in device memory
		  for i = 0 to me.Input.Ubound
		    me.Input(i).WriteCLMemory(queue)
		  next
		  
		  // Set the arguments to our compute kernel
		  dim ii as Integer = 0
		  for i = 0 to me.Input.Ubound
		    ii = ii + me.Input(i).SetKernelArguments(kernel, ii)
		  next
		  ii = ii + me.Output.SetKernelArguments(kernel, ii)
		  
		  // Get the maximum work-group size for executing the kernel on the device
		  dim maxWorkGroupCount as integer = kernel.GetKernelWorkGroupSize(Device)
		  
		  // Execute the kernel over the entire range of the data set
		  queue.EnqueueNDRangeKernel(kernel, me.Output.DataCount, maxWorkGroupCount)
		  
		  // Wait for the command queue to get serviced before reading back results
		  queue.finish
		  
		  // Read the results from the device
		  queue.EnqueueReadBuffer(me.Output.DataCL, 0, me.Output.Data.Size, me.Output.Data)
		  
		  // Clean up
		  for i = 0 to me.Input.Ubound
		    me.Input(i).ClearCLMemory
		  next
		  
		  me.Output.ClearCLMemory
		  //
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetOutputMemory(mb as MemoryBlock)
		  
		  me.Output = new OpenCLDataMemoryBlock(mb, mb.Size)
		  me.Output.ParameterName = "output"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetOutputMemorySize(size as Integer)
		  dim mb as MemoryBlock = new MemoryBlock(size)
		  
		  me.SetOutputMemory(mb)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Input(-1) As OpenCLData
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Copy the returned string and use it as a template for writing your OpenCL program in a text editor
			  dim s as String
			  dim i as Integer
			  
			  s = "// See a quick reference for OpenCL language here: http://www.khronos.org/files/opencl-quick-reference-card.pdf" + EndOfLine + EndOfLine
			  
			  // Function signature
			  s = s + "__kernel " + kDefaultKernelName + "("
			  
			  for i = 0 to me.Input.Ubound
			    s = s + me.Input(i).GetParameterDeclaration + ","
			  next
			  
			  s = s + me.Output.GetParameterDeclaration + " ) {" + EndOfLine
			  //
			  
			  // Function block
			  s = s + "    int i = get_global_id(0);" + EndOfLine
			  s = s + "    if (i < outputCount) {" + EndOfLine
			  s = s + "        output[i] = 0; // Do something interesting here!" + EndOfLine
			  s = s + "    }" + EndOfLine
			  //
			  
			  // End
			  s = s + "}" + EndOfLine
			  
			  Return s
			  
			End Get
		#tag EndGetter
		OpenCLProgramTemplate As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Output As OpenCLDataMemoryBlock
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  if me.Output = nil then Return nil
			  
			  Return me.Output.Data
			  
			End Get
		#tag EndGetter
		OutputMemoryBlock As MemoryBlock
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Source As String
	#tag EndProperty


	#tag Constant, Name = kDefaultKernelName, Type = String, Dynamic = False, Default = \"square", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Source"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OpenCLProgramTemplate"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
