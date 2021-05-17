#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  Print "LGL "+LGLMBS.LibVersion
		  
		  
		  Dim l As New LGLMBS
		  
		  l.Option("Hello") = 1
		  
		  
		  Dim f As FolderItem = FindFile("test.txt")
		  
		  Dim LineNo As Integer
		  Dim Max As Integer
		  Dim r As String = l.ParseFile(f, False, lineNo, Max)
		  print "ParseFile: "+r
		  
		  Dim Sat As Integer = l.Sat
		  Print "Sat: "+Str(Sat) 
		  
		  Select Case sat
		  Case l.LGL_SATISFIABLE
		    Print "LGL_SATISFIABLE"
		  Case l.LGL_UNSATISFIABLE
		    Print "LGL_UNSATISFIABLE"
		  End Select
		  
		  
		  
		  l.PrintAll
		  
		  Dim u As Integer = l.MaxVar
		  For i As Integer = 1 To u
		    Print Str(i)+": "+Str(l.Deref(i))
		  Next
		  
		  Break // see debugger
		  
		End Function
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  Print Introspection.GetType(error).fullname
		  Print error.Message
		  
		  For Each line As String In error.Stack
		    Print line
		  Next
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
