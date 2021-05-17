#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  
		  const Address = "localhost"
		  const username = "cs"
		  const password = "xxx"
		  const keyfile1 = ""
		  const keyfile2 = ""
		  const commandline = "/bin/ls"
		  
		  
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
		  
		  
		  //* Request a shell */
		  dim channel as SSH2ChannelMBS = session.OpenSession
		  
		  if channel = nil then
		    print "Unable to open a session"
		    Return 4
		  end if
		  
		  
		  channel.SetBlocking false
		  
		  app.DoEvents 10
		  // read greetings
		  dim s as string = channel.Read(10000)
		  print s 
		  
		  // execute command line
		  app.DoEvents 10
		  channel.execute commandline
		  print "Lasterror: "+str(channel.LastError)
		  print str(Ticks)
		  
		  // wait until things are okay
		  // the following loop seems to be wrong and only causes delays!
		  'while channel.LastError = -37
		  'channel.execute commandline
		  'print "Lasterror: "+str(channel.LastError)
		  'print str(Ticks)
		  
		  'session.WaitSocket
		  'print str(Ticks)
		  'wend
		  '
		  if channel.LastError <> 0 then
		    print "Failed with error: "+str(channel.LastError)
		  end if
		  
		  print "now wait for data"
		  
		  // ok
		  
		  session.WaitSocket
		  do
		    session.WaitSocket
		    app.DoEvents 10
		    s = channel.Read(10000)
		    
		    if channel.LastError = session.kErrorEagain then
		      // no answer yet
		      Continue
		    else
		      print s
		      exit
		    end if
		    
		    s = channel.ReadStdErr(10000)
		    if s<>"" then
		      print s
		      Break // got error output
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


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
