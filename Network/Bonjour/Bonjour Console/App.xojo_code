#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  print "This application does registering a service, browse and lookup this service."
		  print "Press control-C to quit."
		  
		  b=new MyBonjourBrowseMBS
		  r=new MyBonjourRegisterMBS
		  l=new MyBonjourLookupMBS
		  
		  if b.Available then
		    print "Bonjour is available."
		  else
		    print "No Bonjour found!"
		    Return 1
		  end if
		  
		  Register
		  
		  // wait 2 seconds and give sockets, threads and timers time
		  for i as integer=0 to 20
		    DelayMBS 0.1
		    DoEvents 
		  next
		  
		  Browse
		  
		  // give sockets, threads and timers time
		  do
		    DelayMBS 0.1
		    DoEvents
		  loop
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub Browse()
		  if b.Browse(0,"_echo._tcp","local.") then
		    print "Browse started successfull."
		  else
		    print "Browse failed."
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Lookup(ServiceName as string, domain as string)
		  if app.l.Resolve(app.l.kInterfaceIndexAny, ServiceName,"_echo._tcp.", domain) then
		    print "Lookup started successfull."
		  else
		    print "Lookup failed."
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Register()
		  if r.Register(0,0,"MyService","_echo._tcp.", "local.", "", 1111, "") then
		    print "Registering started successfull."
		  else
		    print "Registering failed."
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected b As MyBonjourBrowseMBS
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected l As MyBonjourLookupMBS
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected r As MyBonjourRegisterMBS
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
