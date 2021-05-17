#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  
		  const Address = "1.2.3.4"
		  const username = "xxx"
		  const password = "yyy"
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
		  
		  
		  
		  // here we are authorized
		  
		  //* Open tunnel */
		  dim tunnel as new SSH2TunnelMBS(session)
		  tunnel.LocalAddress = "127.0.0.1"
		  tunnel.LocalPort = 8000
		  tunnel.RemoteAddress = "monkeybreadsoftware.de"
		  tunnel.RemotePort = 80
		  
		  // avoid timeing out in Socket and SSH layers
		  tunnel.KeepAlive = True
		  session.ConfigureKeepAlive
		  
		  // run it
		  tunnel.Run
		  
		  // while it runs, connect to our website through port 8000
		  // don't alter session while tunnel runs
		  
		  do
		    app.DoEvents 10
		  loop until not tunnel.Running
		  
		  print tunnel.Messages
		  
		  
		  session.Disconnect "Normal Shutdown, Thank you for playing"
		  
		  session = nil
		  print "done"
		  Return 0
		End Function
	#tag EndEvent


	#tag Constant, Name = kenn, Type = String, Dynamic = False, Default = \"", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
