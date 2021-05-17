#tag Module
Protected Module debugModule
	#tag Method, Flags = &h0
		Sub init()
		  destFolder = SpecialFolder.Desktop.Child("eidReaderDebugLog")
		  
		  if Not(destFolder.Exists) then
		    
		    destFolder.CreateAsFolder
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub log(line as string)
		  Dim t As textOutputStream
		  dim d as date
		  
		  
		  if active then
		    if destFile <> nil then
		      d = new Date
		      t = TextOutputStream.Append(destFile)
		      t.WriteLine(d.SQLDateTime + chr(9) + line)
		      t.Close
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub start()
		  Dim dte As date
		  dim t as textOutputStream
		  
		  active = true
		  
		  dte = new date()
		  
		  
		  destFile = destFolder.Child("eidReader-" + Format(dte.Year - 2000, "00") + Format(dte.Month, "00") + Format(dte.Day, "00") + "-" + Format(dte.Hour, "00") + Format(dte.Minute, "00") + Format(dte.Second, "00") + ".debug")
		  
		  if destFile <> nil then
		    t = TextOutputStream.Create(destFile)
		    t.Close
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		active As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		destFile As folderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		destFolder As folderItem
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="active"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
