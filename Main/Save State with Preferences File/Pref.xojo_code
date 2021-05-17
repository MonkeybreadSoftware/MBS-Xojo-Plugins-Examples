#tag Module
Protected Module Pref
	#tag Method, Flags = &h0
		Sub load()
		  dim file as FolderItem = SpecialFolder.Preferences.Child(Preffilename)
		  if file = nil then Return
		  
		  dim t as TextInputStream = file.OpenAsTextFile
		  if t = nil then Return
		  
		  t.Encoding = encodings.UTF8
		  while not t.EOF
		    dim line as string = t.ReadLine
		    
		    dim p as integer = instr(line, "=")
		    if p>0 then
		      dim le as string = left(line,p-1)
		      dim ri as string = mid(line, p+1)
		      
		      select case le
		      case "CurrentURL"
		        CurrentURL = ri
		      end select
		    end if
		    
		  wend
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub save()
		  dim file as FolderItem = SpecialFolder.Preferences.Child(Preffilename)
		  if file = nil then Return
		  
		  dim t as TextOutputStream = file.CreateTextFile
		  if t = nil then Return
		  
		  t.WriteLine ConvertEncoding("CurrentURL="+CurrentURL, encodings.UTF8)
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CurrentURL As string
	#tag EndProperty


	#tag Constant, Name = Preffilename, Type = String, Dynamic = False, Default = \"Save State with Preferences File.pref", Scope = Public
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
			Name="CurrentURL"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
