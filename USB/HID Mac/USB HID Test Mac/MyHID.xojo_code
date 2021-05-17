#tag Class
Protected Class MyHID
Inherits MacHIDMBS
	#tag Event
		Sub ReceivedData(data as string, size as integer)
		  dim m as MemoryBlock
		  dim s as string
		  dim i as integer
		  
		  m=data
		  
		  // debug output
		  for i=0 to 15
		    s=s+str(m.Byte(i))+" "
		  next
		  
		  s=s+"= "+data
		  
		  System.DebugLog s
		  
		  // and store it for the read command
		  
		  datas.Append m
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor()
		  EventRecord=NewMemoryBlock(100)
		  TimeOut=2222
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub MyWait()
		  // Boolean WaitNextEvent(EventMask      eventMask,EventRecord *  theEvent,UInt32         sleep,RgnHandle      mouseRgn)
		  
		  declare function WaitNextEvent lib "Carbon" (eventmask as integer, EventRecord as Ptr, sleep as integer, mouse as integer) as Boolean
		  
		  call WaitNextEvent(0,EventRecord,1,0)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Read(count as  integer) As memoryBlock
		  // This read command is to read syncronous.
		  // Normally you should handle data in the event and work asyncronous, but this is not always possible.
		  
		  const DelayDontMPYield = 1
		  const DelayDontRBYield = 2
		  const DelayDontThreadYield = 4
		  const DelayDontQuickTimeYield = 8
		  const DelayDontWait = 16
		  const DelayDontWaitNextEvent = 32
		  const DelayDontSleep = 64
		  
		  dim t as integer
		  dim m as MemoryBlock
		  
		  t=Ticks+60
		  
		  // quitting already?
		  if app.quitting then
		    quit
		  end if
		  
		  while t>ticks  
		    // delay some time
		    MyWait
		    
		    if app.quitting then
		      quit
		    end if
		    
		    // and if we got data we return it.
		    if UBound(datas)>=0 then
		      Return datas.Pop
		    end if
		  wend
		  
		  Return nil // timeout
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Send(data as string)
		  // this is a special send command for this device.
		  // For this device we need to package data into a 8 byte package.
		  
		  dim m as MemoryBlock
		  dim n as integer
		  dim d,s as string
		  dim i as integer
		  
		  if app.quitting then
		    quit
		  end if
		  
		  // this device wants 8 byte per command
		  n=lenb(data)
		  if n>8 then
		    n=8
		  end if
		  
		  m=NewMemoryBlock(8)
		  m.StringValue(0,n)=data
		  
		  for i=0 to 7
		    s=s+str(m.Byte(i))+" "
		  next
		  
		  d=m
		  s=s+"= "+d
		  
		  System.DebugLog s
		  
		  me.SendMessageMemory m,0,8
		  'System.DebugLog "SendMessageMemory lasterror: "+Format(me.Lasterror,"-0")
		  if me.Lasterror=-536854447 then
		    app.quitting=true
		    MsgBox "The USB Receiver failed with a timeout to send an answer. Please restart application and device."
		    quit
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		datas(-1) As memoryBlock
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected EventRecord As memoryBlock
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
