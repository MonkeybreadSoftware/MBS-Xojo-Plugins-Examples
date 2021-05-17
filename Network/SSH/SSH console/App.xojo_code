#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  // this example connects via SSH and runs commands with timer and thread
		  // please update login details in session method
		  
		  
		  // make a connection
		  dim e as integer = Connect
		  if e <> 0 then
		    return e // failed to connect
		  end if 
		  
		  
		  // timer to make query every 10 seconds
		  dim t as new QueryTimer
		  t.Period = 10000
		  t.Mode = timer.ModeMultiple
		  
		  
		  // start main loop
		  
		  print "Query date and disk space every 10 seconds."
		  
		  do
		    
		    app.DoEvents 10
		    
		    
		  loop until ende
		  
		  
		  
		  // shutdown
		  
		  session.Disconnect "Normal Shutdown, Thank you for playing"
		  
		  session = nil
		  print "done"
		  
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Connect() As integer
		  
		  const Address = "localhost"
		  const username = "cs"
		  const password = "test"
		  const keyfile1 = ""
		  const keyfile2 = ""
		  
		  dim hostAddr as string = System.Network.LookupIPAddress(Address)
		  print hostAddr
		  
		  //* Create a session instance and start it up. This will trade welcome
		  //* banners, exchange keys, and setup crypto, compression, and MAC layers
		  
		  dim session as new MySSH2SessionMBS(hostAddr, 22)
		  session.MyPassword = password
		  
		  if session.Handle = 0 then
		    print "Failed to connect socket!"
		    Return 1
		  end if
		  
		  session.SessionHandshake 
		  if session.lasterror<>0 then
		    print "Failure establishing SSH session"
		    Return 9
		  end if
		  
		  
		  //* At this point we havn't authenticated. The first thing to do is check
		  //* the hostkey's fingerprint against our known hosts Your app may have it
		  //* hard coded, may go to a file, may present it to the user, that's your
		  //* call
		  
		  dim fingerprint as string = session.HostKeyHash(session.kHostKeyHashSHA1)
		  print "Fingerprint: "+EncodeHex(fingerprint)
		  
		  //* check what authentication methods are available */
		  dim userauthlist as string = session.UserAuthList(username)
		  
		  dim authPassword as Boolean = false
		  dim authKeyboardInteractive as Boolean = false
		  dim authPublickey as Boolean = false
		  print "Authentication methods: "+ userauthlist
		  
		  
		  if instr(userauthlist, "password")>0 then
		    authPassword = true
		  end if
		  
		  if instr(userauthlist, "keyboard-interactive")>0 then
		    authKeyboardInteractive = true
		  end if
		  
		  if instr(userauthlist, "publickey")>0 then
		    authPublickey = true
		  end if
		  
		  if authPassword then
		    //* We could authenticate via password */
		    
		    session.UserAuthPassword(username, password)
		    
		    if session.LastError = 0 then
		      // ok
		      print "Authentication by password succeeded."
		    else
		      // failed
		      print "Authentication by password failed!"
		      Return 1
		    end if
		    
		    
		  elseif authKeyboardInteractive then
		    //* Or via keyboard-interactive */
		    session.UserAuthKeyboardInteractive username
		    if session.LastError <> 0 then
		      print "Authentication by keyboard-interactive failed!"
		      return 10
		    else
		      print "Authentication by keyboard-interactive succeeded."
		    end if
		    
		    //* Or by public key */
		  elseif authPublickey then
		    session.UserAuthPublicKeyFromFile(username, keyfile1, keyfile2, password)
		    
		    if session.LastError <> 0 then
		      print "Authentication by public key failed!"
		      Return 4
		    else
		      print "Authentication by public key succeeded."
		    end if
		  else
		    print "No supported authentication methods found!"
		    Return 3
		  end if
		  
		  
		  self.session = session
		  
		  return 0 // ok
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Ende As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		session As SSH2SessionMBS
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Ende"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
