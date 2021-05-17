#tag Class
Protected Class MySSH2SessionMBS
Inherits SSH2SessionMBS
	#tag Event
		Sub KeyboardCallback(Name as string, Instruction as string, PromptCount as integer, Prompts() as SSH2UserAuthKeyboardInteractivePromptMBS, responses() as SSH2UserAuthKeyboardInteractiveResponseMBS)
		  print "Name: "+Name
		  Print "Instruction: "+Instruction
		  
		  for each p as SSH2UserAuthKeyboardInteractivePromptMBS in Prompts
		    print p.Text
		  next
		  
		  if PromptCount = 1 then
		    responses(0).Text = MyPassword
		  end if
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Print(s as string)
		  MainWindow.Print s
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		MyPassword As string
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
			Name="MyPassword"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
