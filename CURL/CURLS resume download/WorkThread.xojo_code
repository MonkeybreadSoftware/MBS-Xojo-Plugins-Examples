#tag Class
Protected Class WorkThread
Inherits Thread
	#tag Event
		Sub Run()
		  dim e as integer
		  dim u as string = url
		  dim filename as string = NthField(u,"/",CountFields(u,"/"))
		  dim file as FolderItem = SpecialFolder.Desktop.Child(filename)
		  dim b as BinaryStream 
		  
		  if resume then
		    b = BinaryStream.Open(file, true)
		  else
		    b = BinaryStream.Create(file)
		  end if
		  
		  d=new DownloadCURL
		  d.OptionURL=u
		  d.YieldTime=true
		  d.b=b
		  
		  if resume then
		    d.offset=b.Length
		    
		    d.OptionResumeFromLarge=b.Length
		    b.Position=b.Length
		  end if
		  
		  e=d.Perform
		  
		  b=nil
		  
		  if e=42 then
		    d.message = "Result: "+str(e)+" (download stopped)"
		  elseif e=0 then
		    d.message = "Result: "+str(e)+" (download is complete)"
		  else
		    d.message = "Result: "+str(e)+" (download failed)"
		  end if
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function GetMessage() As string
		  dim s as string = d.message
		  d.message = ""
		  if s<>"" then
		    Return s
		  end if
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		d As DownloadCURL
	#tag EndProperty

	#tag Property, Flags = &h0
		Resume As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		url As string
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="DebugIdentifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadState"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ThreadStates"
			EditorType="Enum"
			#tag EnumValues
				"0 - Running"
				"1 - Waiting"
				"2 - Paused"
				"3 - Sleeping"
				"4 - NotRunning"
			#tag EndEnumValues
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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Resume"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="url"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
