#tag Module
Protected Module CPU
	#tag Method, Flags = &h1
		Protected Function CPUKind() As integer
		  if TargetLinux then
		    Return intel
		  elseif TargetWin32 then
		    Return intel
		  elseif TargetMacOS then
		    
		    dim m as MemoryBlock
		    dim cputype, cpusubtype as integer
		    dim s as string
		    
		    m=SystemControlByNameMBS("hw.cputype")
		    
		    if m<>nil then
		      cputype=m.Long(0)
		      
		      m=SystemControlByNameMBS("hw.cpusubtype")
		      
		      if m<>nil then
		        cpusubtype=m.Long(0)
		        
		        Select case cputype // only types for Mac OS X listed
		        case 7 // X86
		          Return intel // only when RB compiles for Intel!
		          
		        case 18 // PowerPC
		          // Maybe emulator?
		          m=SystemControlByNameMBS("sysctl.proc_native")
		          
		          if m=nil then // not found, so real PowerPC
		            Select case cpusubtype
		            case 9
		              Return ppcG3
		            case 10
		              Return ppcG4
		            case 11
		              Return ppcG4
		            case 100
		              Return ppcG5
		            end Select
		          else
		            Return ppcEmulator
		          end if
		          
		        end Select
		      end if
		    end if
		  else
		    MsgBox "?"
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CPUKindString() As String
		  Select case CPUKind
		  case intel
		    Return "Intel CPU"
		  case ppcEmulator
		    Return "PPC Emulator"
		  case ppcg3
		    Return "PPC G3"
		  case ppcg4
		    Return "PPC G4"
		  case ppcg5
		    Return "PPC G5"
		  else
		    Return "?"
		  end Select
		End Function
	#tag EndMethod


	#tag Constant, Name = intel, Type = Integer, Dynamic = False, Default = \"6", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ppcEmulator, Type = Integer, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ppcG3, Type = Integer, Dynamic = False, Default = \"3", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ppcG4, Type = Integer, Dynamic = False, Default = \"4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ppcG5, Type = Integer, Dynamic = False, Default = \"5", Scope = Protected
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
	#tag EndViewBehavior
End Module
#tag EndModule
