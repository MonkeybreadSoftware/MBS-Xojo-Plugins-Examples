#tag Class
Protected Class Curve1
Inherits LMFitMBS
	#tag Event
		Function evaluateCurve(t as double, par as Ptr, nPar as Integer, parameters() as double, tag as variant) As double
		  Return f(t, par)
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function f(t as double, par() as Double) As Double
		  
		  dim p0 as double = par(0)
		  dim p1 as double = par(1)
		  dim p2 as double = par(2)
		  
		  return p0 + p1*t + p2*t*t
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function f(t as double, par as ptr) As Double
		  
		  dim p0 as double = par.Double( 0)
		  dim p1 as double = par.Double( 8)
		  dim p2 as double = par.Double(16)
		  
		  return p0 + p1*t + p2*t*t
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub test()
		  const n = 3 // number of parameters in model function f */
		  dim par() as double = Array( 100.0, 0, -10) // really bad starting value */
		  
		  // data points: a slightly distorted standard parabola */
		  const m = 9
		  
		  dim t() as double = Array( -4., -3., -2., -1.,  0., 1.,  2.,  3.,  4. )
		  dim y() as double = Array( 16.6, 9.9, 4.4, 1.1, 0., 1.1, 4.2, 9.3, 16.4 )
		  
		  Dim control As New LMFitControlMBS
		  dim status as new LMFitStatusMBS
		  
		  control.verbosity = 9
		  
		  print "Fitting ..."
		  // now the call to lmfit */
		  me.LMCurve( n, par, m, t, y, control, status )
		  
		  print "Results:"
		  print "status after %d function evaluations: "+status.outcomeInfoMessage
		  
		  print "obtained parameters:"
		  for i as integer = 0 to n-1
		    print "  par("+str(i)+") = " + str(par(i))
		  next
		  
		  print "obtained norm: "+ str(status.fnorm )
		  
		  print "fitting data as follows:"
		  for i as integer = 0  to m-1
		    dim r as Double = f(t(i), par)
		    print  "  t["+str(i,"00")+"]="+str(t(i))+" y="+str(y(i))+" fit="+str(r)+" residue="+str(y(i) - r)
		    
		  next
		  
		  
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
	#tag EndViewBehavior
End Class
#tag EndClass
