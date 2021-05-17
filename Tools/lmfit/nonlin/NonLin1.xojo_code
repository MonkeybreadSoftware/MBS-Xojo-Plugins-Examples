#tag Class
Protected Class NonLin1
Inherits LMFitMBS
	#tag Event
		Function evaluateMin(par as Ptr, nPar as Integer, parameters() as double, mDat as Integer, fvec as Ptr, tag as variant) As Integer
		  dim p0 as double = par.Double(0)
		  dim p1 as double = par.Double(8)
		  
		  fvec.Double(0) = p0*p0 + p1*p1 - 1.0 // unit circle    x^2+y^2=1 */
		  fvec.Double(8) = p1 - p0*p0          // standard parabola  y=x^2 */
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub test()
		  const n = 2   // dimension of the problem */
		  dim p(2) as double // parameter vector p=(x,y) */
		  
		  // auxiliary parameters */
		  Dim control As New LMFitControlMBS
		  Dim  status As New LMFitStatusMBS
		  control.verbosity  = 31
		  
		  // get start values from command line */
		  
		  p(0) = 5
		  p(1) = 6
		  
		  // the minimization */
		  print "Minimization:" 
		  
		  me.LMMin( n, p, n, control, status )
		  
		  // print results */
		  print ""
		  print "lmmin status after "+str(status.nfev)+" function evaluations: "+status.outcomeInfoMessage
		  
		  print "" 
		  print "Solution:"
		  print "  x = "+str(p(0))
		  print "  y = "+str(p(1))
		  print "  d = " + str(status.fnorm)
		  
		  // convergence of lmfit is not enough to ensure validity of the solution */
		  if( status.fnorm >= control.ftol ) then
		    print "not a valid solution, try other starting values."
		  else
		    print "valid, though not the only solution: try other starting values."
		  end if
		  
		  
		End Sub
	#tag EndMethod


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
			InitialValue="-2147483648"
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
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
