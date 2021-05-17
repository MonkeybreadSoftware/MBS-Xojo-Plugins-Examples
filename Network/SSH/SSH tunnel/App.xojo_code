#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  // this is the tunnel version which handles socket in Xojo, so you can directly from your app push data through SSH to destination
		  // for forwarding a connection via thread, please check other example.
		  
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
		  dim channel as SSH2ChannelMBS = session.OpenDirectTCPIPChannel("monkeybreadsoftware.de", 80)
		  
		  if channel = nil then
		    print "Unable to open a channel"
		    Return 4
		  end if
		  
		  // don't block
		  channel.SetBlocking false
		  app.DoEvents 10
		  
		  // send http request through server to mbs website
		  dim request as string 
		  
		  request = "GET /cgi-bin/ip.cgi HTTP/1.1"+_
		  EndOfLine.windows+_
		  "Host: monkeybreadsoftware.de"+_
		  EndOfLine.windows+_
		  EndOfLine.windows
		  
		  app.DoEvents 10
		  call channel.Write request
		  
		  // now see if we get the IP of server returned
		  
		  do
		    app.DoEvents 10
		    dim s as string = channel.Read(10000)
		    
		    if channel.LastError = session.kErrorEagain then
		      // no answer yet
		      Continue
		    elseif s <> "" then
		      // got answer
		      print s
		    else
		      // no more data
		      exit
		    end if
		  loop
		  
		  channel.Close
		  channel = nil
		  
		  
		  
		  
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
