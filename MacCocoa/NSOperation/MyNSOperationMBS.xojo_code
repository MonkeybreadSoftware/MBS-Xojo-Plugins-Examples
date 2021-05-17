#tag Class
Protected Class MyNSOperationMBS
Inherits NSOperationMBS
	#tag Event
		Sub Close()
		  #pragma DisableBackgroundTasks
		  #pragma DisableAutoWaitCursor
		  #pragma StackOverflowChecking false
		  
		  System.DebugLog "Close"
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Finished()
		  #pragma DisableBackgroundTasks
		  #pragma DisableAutoWaitCursor
		  #pragma StackOverflowChecking false
		  
		  System.DebugLog "Finished"
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  #pragma DisableBackgroundTasks
		  #pragma DisableAutoWaitCursor
		  #pragma StackOverflowChecking false
		  
		  System.DebugLog "Open"
		  localdic=new Dictionary
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Work()
		  #pragma DisableBackgroundTasks
		  #pragma DisableAutoWaitCursor
		  #pragma StackOverflowChecking false
		  
		  System.DebugLog "Work"
		  
		  dim i,n as integer
		  dim d,x as double
		  dim w as window1
		  dim a(-1) as string
		  
		  count=100000
		  for i=1 to count
		    
		    lock // lock RB runtime so we can call it
		    '// this will crash because of the stack check
		    '// localdic.value(i)=i
		    
		    a.append str(i)
		    unlock
		    
		    // this does not need locking and wastes CPU time
		    x=0
		    for n=1 to 10000
		      x=x+1
		    next
		    
		    d=d+i
		    
		  next
		  
		  result=d
		  
		  System.DebugLog "Work done"
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		count As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		localdic As dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		result As double
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
			Name="count"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="result"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
