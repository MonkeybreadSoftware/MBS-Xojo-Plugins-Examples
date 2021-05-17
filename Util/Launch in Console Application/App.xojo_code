#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  print "Hello"
		  
		  // Folderitem.Launch is not available in console applications!
		  
		  const sShellPath="/usr/bin/open"
		  
		  dim a(1) as string
		  dim e(-1) as string
		  
		  a(0)="open" // must be the application name
		  a(1)="/Applications/TextEdit.app" // first parameter
		  
		  print str(ConsoleExecuteMBS(sShellPath,a,e))
		  
		  
		End Function
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
