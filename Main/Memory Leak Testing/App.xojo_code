#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Function HandleSpecialURL(Request As WebRequest) As Boolean
		  If Request.Path = "test" Then
		    
		    Request.Print "Hello World"
		    
		    Return True
		  End If
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Open(args() as String)
		  StartMemoryStatisticsTimer
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub StartMemoryStatisticsTimer()
		  // start timer to print memory stats
		  Static t As MemoryStatisticsTimer
		  
		  t = New MemoryStatisticsTimer
		  t.Period = 2000
		  t.Mode = timer.ModeMultiple
		  
		  // query something, so it initializes
		  Dim RuntimeObjectIterator As Runtime.ObjectIterator = Runtime.IterateObjects
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
