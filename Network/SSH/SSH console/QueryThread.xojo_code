#tag Class
Protected Class QueryThread
Inherits Thread
	#tag Event
		Sub Run()
		  dim Session as SSH2SessionMBS = app.session
		  
		  //* Request a shell */
		  dim channel as SSH2ChannelMBS = session.OpenSession
		  
		  if channel = nil then
		    print "Unable to open a session"
		    Return
		  end if
		  
		  //* Some environment variables may be set,
		  //* It's up to the server which ones it'll allow though
		  
		  'channel.SetEnv "FOO", "bar"
		  
		  
		  //* Request a terminal with 'vanilla' terminal emulation
		  //* See /etc/termcap for more options
		  
		  'channel.RequestPTY "vanilla"
		  'if channel.LastError <> 0 then
		  'print "Failed requesting pty"
		  'Return
		  'end if
		  
		  // Open a SHELL on that pty //
		  
		  'channel.Shell
		  'if channel.LastError <> 0 then
		  'print "Unable to request shell on allocated pty"
		  'Return
		  'end if
		  
		  
		  channel.SetBlocking false
		  
		  //* At this point the shell can be interacted with using
		  //* libssh2_channel_read()
		  //* libssh2_channel_read_stderr()
		  //* libssh2_channel_write()
		  //* libssh2_channel_write_stderr()
		  //*
		  //* Blocking mode may be (en|dis)abled with: libssh2_channel_set_blocking()
		  //* If the server send EOF, libssh2_channel_eof() will return non-0
		  //* To send EOF to the server use: libssh2_channel_send_eof()
		  //* A channel can be closed with: libssh2_channel_close()
		  //* A channel can be freed with: libssh2_channel_free()
		  
		  app.YieldToNextThread
		  // read greetings
		  dim s as string = channel.Read(10000)
		  'print s 
		  
		  app.YieldToNextThread
		  dim commandline as string = "/bin/date"
		  call channel.Execute commandline
		  
		  // wait until things are okay
		  while channel.LastError = -37
		    channel.execute commandline
		    'print "Lasterror: "+str(channel.LastError)
		    
		    session.WaitSocket
		  wend
		  
		  do
		    app.YieldToNextThread
		    s = channel.Read(10000)
		    
		    if channel.LastError = session.kErrorEagain then
		      // no answer yet
		      Continue
		    else
		      print "Date: " + s
		      exit
		    end if
		  loop
		  
		  app.YieldToNextThread
		  channel = nil
		  
		  // start new channel
		  
		  //* Request a shell */
		  channel = session.OpenSession
		  
		  if channel = nil then
		    print "Unable to open a session"
		    Return
		  end if
		  
		  
		  commandline = "/bin/df"
		  call channel.Execute commandline
		  
		  // wait until things are okay
		  while channel.LastError = -37
		    channel.execute commandline
		    'print "Lasterror: "+str(channel.LastError)
		    
		    session.WaitSocket
		  wend
		  
		  do
		    app.YieldToNextThread
		    s = channel.Read(10000)
		    
		    if channel.LastError = session.kErrorEagain then
		      // no answer yet
		      Continue
		    else
		      s = ReplaceLineEndings(s, EndOfLine)
		      dim lines() as string = split(s, EndOfLine)
		      print "Disk space: "
		      for each line as string in lines
		        print line
		      next
		      print ""
		      exit
		    end if
		  loop
		  
		  
		  channel.Close
		  channel = nil
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
		#tag ViewProperty
			Name="DebugIdentifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadState"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ThreadStates"
			EditorType="Enum"
			#tag EnumValues
				"0 - Running"
				"1 - Waiting"
				"2 - Paused"
				"3 - Sleeping"
				"4 - NotRunning"
			#tag EndEnumValues
		#tag EndViewProperty
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
		#tag ViewProperty
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
