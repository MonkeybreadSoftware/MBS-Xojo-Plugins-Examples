#tag Class
Protected Class Surface
Inherits LMFitMBS
	#tag Event
		Function evaluateMin(par as Ptr, nPar as Integer, parameters() as double, mDat as Integer, fvec as Ptr, tag as variant) As Integer
		  
		  for i as integer = 0 to mDat-1
		    fvec.Double(i*8) = y(i) - f( tx(i), tz(i), par)
		  next
		  
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function f(tx as double, tz as double, p() as Double) As double
		  
		  return p(0) + p(1)*tx + p(2)*tz
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function f(tx as double, tz as double, p as ptr) As double
		  dim p0 as Double = p.double( 0)
		  dim p1 as Double = p.double( 8)
		  dim p2 as Double = p.double(16)
		  
		  return p0 + p1*tx + p2*tz
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub test()
		  // parameter vector */
		  const n_par = 3                // number of parameters in model function f */
		  dim par() as double = Array( -1.0, 0, 1 ) // arbitrary starting value */
		  
		  // data points */
		  const m_dat = 4
		  dim tx() as double = array( -1.0, -1,  1,  1 )
		  dim tz() as double = array( -1.0,  1, -1,  1 )
		  dim y() as double  = array(  0.0,  1,  1,  2 )
		  
		  // we use this object to pass data to event
		  self.tx = tx
		  self.tz = tz
		  self.y = y
		  
		  // auxiliary parameters */
		  Dim status As New LMFitStatusMBS
		  Dim control As New LMFitControlMBS
		  control.verbosity = 9
		  
		  // perform the fit */
		  print "Fitting:" 
		  me.lmmin( n_par, par, m_dat, control, status )
		  
		  // print results */
		  print "Results:" 
		  print "status after "+str(status.nfev)+" function evaluations: "+status.outcomeInfoMessage
		  
		  print "obtained parameters:" 
		  
		  for i as integer = 0 to n_par-1
		    print"  par["+str(i)+"] = "+str(par(i))
		  next
		  
		  print"obtained norm: "+str(status.fnorm )
		  
		  print"fitting data as follows:"
		  for i as integer = 0 to m_dat -1
		    dim ff as double = f(tx(i), tz(i), par)
		    
		    print "  t["+str(i)+"]="+str(tx(i))+", "+str(tz(i))+" y="+str(y(i))+" fit="+str(ff)+" residue=" + str(y(i)-ff)
		  next
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		tx() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		tz() As double
	#tag EndProperty

	#tag Property, Flags = &h0
		y() As double
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
