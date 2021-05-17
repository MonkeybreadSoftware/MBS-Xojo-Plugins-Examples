#tag Class
Protected Class CPUInfo
	#tag Method, Flags = &h0
		Sub Constructor()
		  const PROCESSOR_BASIC_INFO=1  //* basic information */
		  const PROCESSOR_CPU_LOAD_INFO=2 //* cpu load information */
		  const PROCESSOR_PM_REGS_INFO=&h10000001 //* performance monitor register info */
		  const PROCESSOR_TEMPERATURE=&h10000002 //* Processor core temperature */
		  
		  dim s as new SoftDeclareMBS
		  dim port as integer
		  dim p as MemoryBlock // Parameters
		  dim buf as MemoryBlock
		  dim bufptr as MemoryBlock
		  dim count as MemoryBlock
		  dim noOfMPU as MemoryBlock
		  dim i,j as integer
		  dim t as String
		  
		  if s.LoadFramework("System.framework") then
		    if s.LoadFunction("mach_host_self") then
		      if s.CallFunction(0,nil) then
		        port=s.Result // port to talk through
		      end if
		    end if
		  end if
		  
		  if port=0 then // failed for any reason
		    Return
		  end if
		  
		  s=new SoftDeclareMBS
		  
		  if s.LoadFramework("System.framework") then
		    if s.LoadFunction("host_processor_info") then
		      p=NewMemoryBlock(100)
		      noOfMPU=NewMemoryBlock(4)
		      count=NewMemoryBlock(4)
		      bufptr=NewMemoryBlock(4)
		      p.Long(0)=port
		      p.Long(4)=PROCESSOR_BASIC_INFO
		      p.Long(8)=noOfMPU.AddressMBS(0)
		      p.Long(12)=bufptr.AddressMBS(0)
		      p.Long(16)=count.AddressMBS(0)
		      if s.CallFunction(5,p) then
		        'struct processor_basic_info {
		        'cpu_type_t cpu_type; /* type of cpu */
		        'cpu_subtype_t cpu_subtype; /* subtype of cpu */
		        'boolean_t running; /* is processor running */
		        'int  slot_num; /* slot number */
		        'boolean_t is_master; /* is this the master processor */
		        '};
		        
		        if s.Result=0 then
		          CountOfCPUs=noOfMPU.Long(0)
		          
		          redim CpuType(CountOfCPUs)
		          redim cpusubtype(CountOfCPUs)
		          redim ismaster(CountOfCPUs)
		          redim running(CountOfCPUs)
		          redim slotnum(CountOfCPUs)
		          
		          buf=NewMemoryBlockFromPtrMBS(bufptr.Long(0))
		          
		          j=0
		          for i=1 to CountOfCPUs
		            CpuType(i)=buf.Long(j)
		            j=j+4
		            CPUSubType(i)=buf.Long(j)
		            j=j+4
		            Running(i)=buf.Long(j)>0
		            j=j+4
		            SlotNum(i)=buf.Long(j)
		            j=j+4
		            isMaster(i)=buf.Long(j)>0
		            j=j+4
		          next
		          
		          vm_deallocate(port,bufptr.Long(0),count.Long(0))
		        end if
		      end if
		    end if
		  end if
		  
		  const CPU_STATE_MAX  =4
		  
		  const CPU_STATE_USER  =0
		  const CPU_STATE_SYSTEM=1
		  const CPU_STATE_IDLE  =2
		  const CPU_STATE_NICE  =3
		  
		  if s.LoadFramework("System.framework") then
		    if s.LoadFunction("host_processor_info") then
		      p=NewMemoryBlock(100)
		      noOfMPU=NewMemoryBlock(4)
		      count=NewMemoryBlock(4)
		      bufptr=NewMemoryBlock(4)
		      p.Long(0)=port
		      p.Long(4)=PROCESSOR_CPU_LOAD_INFO
		      p.Long(8)=noOfMPU.AddressMBS(0)
		      p.Long(12)=bufptr.AddressMBS(0)
		      p.Long(16)=count.AddressMBS(0)
		      if s.CallFunction(5,p) then
		        
		        if s.Result=0 then
		          
		          redim CPULoadIdle(CountOfCPUs)
		          redim CPULoadNice(CountOfCPUs)
		          redim CPULoadSystem(CountOfCPUs)
		          redim CPULoadUser(CountOfCPUs)
		          
		          buf=NewMemoryBlockFromPtrMBS(bufptr.Long(0))
		          
		          j=0
		          for i=1 to CountOfCPUs
		            CPULoadUser(i)=buf.Long(j)
		            j=j+4
		            CPULoadSystem(i)=buf.Long(j)
		            j=j+4
		            CPULoadIdle(i)=buf.Long(j)
		            j=j+4
		            CPULoadNice(i)=buf.Long(j)
		            j=j+4
		          next
		          
		          vm_deallocate(port,bufptr.Long(0),count.Long(0))
		        end if
		      end if
		    end if
		  end if
		  
		  if s.LoadFramework("System.framework") then
		    if s.LoadFunction("host_processor_info") then
		      p=NewMemoryBlock(100)
		      noOfMPU=NewMemoryBlock(4)
		      count=NewMemoryBlock(4)
		      bufptr=NewMemoryBlock(4)
		      p.Long(0)=port
		      p.Long(4)=PROCESSOR_TEMPERATURE
		      p.Long(8)=noOfMPU.AddressMBS(0)
		      p.Long(12)=bufptr.AddressMBS(0)
		      p.Long(16)=count.AddressMBS(0)
		      if s.CallFunction(5,p) then
		        
		        if s.Result=0 then
		          
		          redim Temperature(CountOfCPUs)
		          
		          buf=NewMemoryBlockFromPtrMBS(bufptr.Long(0))
		          
		          j=0
		          for i=1 to CountOfCPUs
		            Temperature(i)=buf.Long(j)
		            j=j+4
		          next
		          
		          vm_deallocate(port,bufptr.Long(0),count.Long(0))
		        end if
		      end if
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub vm_deallocate(port as integer, pointer as integer, count as integer)
		  // Release kernel memory
		  
		  dim s as SoftDeclareMBS
		  dim m as MemoryBlock
		  
		  m=NewMemoryBlock(12)
		  m.Long(0)=port
		  m.Long(4)=pointer
		  m.Long(8)=count
		  
		  s=new SoftDeclareMBS
		  
		  if s.LoadFramework("System.framework") then
		    if s.LoadFunction("vm_deallocate") then
		      if s.CallFunction(3,m) then
		        
		      end if
		    end if
		  end if
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CountOfCPUs As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CPULoadIdle(0) As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CPULoadNice(0) As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CPULoadSystem(0) As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CPULoadUser(0) As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CPUSubType(0) As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CpuType(0) As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		isMaster(0) As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Running(0) As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		SlotNum(0) As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Temperature(0) As integer
	#tag EndProperty


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
			InitialValue="2147483648"
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
			Name="CountOfCPUs"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
