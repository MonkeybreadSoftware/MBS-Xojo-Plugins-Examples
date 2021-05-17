#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  print "main thread start"
		  
		  // we can create timers
		  dim t as new MyTimer
		  t.Period = 1000
		  t.Mode = 2
		  
		  // this is main loop of app and it will fire timers
		  do
		    
		    app.DoEvents(1)
		    
		  loop until ende
		  
		  // we end when variable ende is set to true by timer
		  print "main thread end"
		  
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		ende As Boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ende"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
