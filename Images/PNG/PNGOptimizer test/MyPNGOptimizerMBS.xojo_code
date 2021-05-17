#tag Class
Protected Class MyPNGOptimizerMBS
Inherits PNGOptimizerMBS
	#tag Event
		Sub Log(message as string)
		  // you get messages in chunks where a chr(10) shows a new line
		  
		  dim a as integer = asc(Right(Message,1))
		  if a=10 or a=13 then
		    Messages=Messages+left(Message,len(Message)-1)
		    
		    Messages=ReplaceLineEndings(Messages, EndOfLine.Macintosh)
		    dim lines(-1) as string = split(Messages, EndOfLine.Macintosh)
		    
		    for each line as string in lines
		      window1.list.AddRow "log: "+line
		    next
		    Messages=""
		  else
		    Messages=Messages+Message
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Progress(index as integer, count as integer)
		  if index<>window1.ProgressBar1.Value then
		    window1.ProgressBar1.Value=index
		  end if
		  
		  if count<>window1.ProgressBar1.Maximum then
		    window1.ProgressBar1.Maximum=count
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub ProgressBegin()
		  window1.ProgressBar1.Value=0
		  window1.ProgressBar1.Maximum=0
		  window1.ProgressBar1.Visible=true
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub ProgressEnd()
		  window1.ProgressBar1.Value=0
		  window1.ProgressBar1.Maximum=0
		  window1.ProgressBar1.Visible=false
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		messages As string
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
			Name="messages"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
