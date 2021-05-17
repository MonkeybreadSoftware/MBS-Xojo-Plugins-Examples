#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  // test normal mode
		  test "%f", 1.234 // default locale
		  test "%f", 1.234, "de_DE" // German
		  test "%f", 1.234, "en_US" // US English
		  test "%f", 1.234, "fr_FR" // French
		  
		  test "%f", 1.0 // default locale
		  test "%f", 1.0, "de_DE" // German
		  test "%f", 1.0, "en_US" // US English
		  test "%f", 1.0, "fr_FR" // French
		  
		  
		  // one before comma, 2 after comma
		  test "%1.2f", 1.234 // default locale
		  test "%1.2f", 1.234, "de_DE" // German
		  test "%1.2f", 1.234, "en_US" // US English
		  test "%1.2f", 1.234, "fr_FR" // French
		  
		  
		  
		  // test exceptions
		  test "%f%f", 1.23, "fr_FR" // French
		  test "%f", 1.23, "xxx" // French
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Test(format as string, value as Double, locale as string = "")
		  #pragma BreakOnExceptions false
		  
		  try
		    
		    print format+": "+formatMBS(format, value, locale)
		    
		  catch u as UnsupportedFormatException
		    
		    print format+": "+u.message
		    
		  end try
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
