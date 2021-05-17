#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Dim a As New LargeNumberMBS(3245*456)
		  Dim b As New LargeNumberMBS(4356*456)
		  
		  Dim m1 As Double = Microseconds
		  Dim l As LargeNumberMBS = FindGCD(a,b)
		  Dim m2 As Double = Microseconds
		  
		  Dim ma As LargeNumberMBS = a / l
		  Dim mb As LargeNumberMBS = b / l
		  
		  Dim m3 As Double = Microseconds
		  Dim p As LargeNumberMBS = a.FindGCD(b)
		  Dim m4 As Double = Microseconds
		  
		  Dim md1 As Double = m2-m1
		  Dim md2 As Double = m4-m3
		  
		  MsgBox "FindGCD("+a.StringValue+", "+b.StringValue+") = "+l.StringValue+" or via plugin "+p.StringValue+EndOfLine+ma.StringValue+" "+mb.StringValue
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FindGCD(ParamArray n() As LargeNumberMBS) As LargeNumberMBS
		  #Pragma DisableBackgroundTasks
		  
		  // Greatest Common Divisor
		  ' (the largest number that divides the given numbers without remainder)
		  
		  Dim x As Integer
		  Dim j, k, One, theGCD As LargeNumberMBS
		  For x = 0 To n.UBound - 1
		    theGCD = New LargeNumberMBS(1)
		    If n(x) > n( x+1 ) Then
		      k = n(x)
		    Else
		      k = n( x+1 )
		    End If
		    j = k
		    One = New LargeNumberMBS(1)
		    While Not j.isZero
		      If n(x).modulo(j).IsZero And n( x + 1 ).modulo(j).IsZero Then
		        theGCD = j
		        Exit While
		      End If
		      j = j - One
		    Wend
		    n( x + 1 ) = theGCD
		  Next
		  Return theGCD
		  
		End Function
	#tag EndMethod


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
