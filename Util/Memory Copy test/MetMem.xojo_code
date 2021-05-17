#tag Module
Protected Module MetMem
	#tag Method, Flags = &h0
		Function MetMemDouble(minput As memoryBlock, values As integer) As MemoryBlock
		  dim moutput As memoryBlock
		  dim bytepos As integer
		  dim memsize1, memsize2 As integer
		  
		  //Var
		  memsize1=minput.size
		  memsize2=memsize1*2
		  
		  //Neuer Memoryblock
		  moutput=NewMemoryBlock(memsize2)
		  if moutput=nil then
		    MsgBox "Fehler: Beim doppeln des Speicherabbildes (Eingabe) ist ein Fehler aufgetreten!"
		    return nil
		  end if
		  
		  //Block doppeln
		  for bytepos=0 to memsize1-1
		    moutput.UShort(bytepos*2)=minput.byte(bytepos)*values //256
		  next
		  
		  //Zurück
		  return moutput
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MetMemDouble2(minput As memoryBlock, values As integer) As memoryBlock
		  #pragma DisableAutoWaitCursor
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  
		  dim moutput As memoryBlock
		  dim bytepos As integer
		  dim n, memsize1, memsize2 As integer
		  
		  //Var
		  memsize1=minput.size
		  memsize2=memsize1*2
		  
		  //Neuer Memoryblock
		  moutput=NewMemoryBlock(memsize2)
		  if moutput=nil then
		    MsgBox "Fehler: Beim doppeln des Speicherabbildes (Eingabe) ist ein Fehler aufgetreten!"
		    return nil
		  end if
		  
		  //Block doppeln
		  n=memsize1-1
		  for bytepos=0 to n
		    moutput.UShort(bytepos*2)=minput.byte(bytepos)*values //256
		  next
		  
		  //Zurück
		  return moutput
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MetMemDouble3(minput As memoryBlock, values As integer) As memoryBlock
		  #pragma DisableAutoWaitCursor
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  
		  dim moutput As memoryBlock
		  dim bytepos As integer
		  dim n, memsize1, memsize2 As integer
		  
		  //Var
		  memsize1=minput.size
		  memsize2=memsize1*2
		  
		  //Neuer Memoryblock
		  moutput=NewMemoryBlock(memsize2)
		  if moutput=nil then
		    MsgBox "Fehler: Beim doppeln des Speicherabbildes (Eingabe) ist ein Fehler aufgetreten!"
		    return nil
		  end if
		  
		  minput.CopyByteToUShortMBS(moutput,0,0,memsize1,values)
		  
		  //Zurück
		  return moutput
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MetMemHalf(minput As memoryBlock, values As integer) As MemoryBlock
		  dim moutput As memoryBlock
		  dim bytepos As integer
		  dim memsize1, memsize2 As integer
		  
		  //Var
		  memsize1=minput.size
		  memsize2=memsize1/2
		  
		  //Neuer Memoryblock
		  moutput=NewMemoryBlock(memsize2)
		  if moutput=nil then
		    MsgBox "Fehler: Beim doppeln des Speicherabbildes (Ausgabe) ist ein Fehler aufgetreten!"
		    return nil
		  end if
		  
		  //Block doppeln
		  for bytepos=0 to memsize1-2 step 2
		    moutput.Byte(bytepos/2)=minput.Ushort(bytepos)/values //257
		  next
		  
		  //Zurück
		  return moutput
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MetMemHalf2(minput As memoryBlock, values As integer) As memoryBlock
		  #pragma DisableAutoWaitCursor
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  
		  dim moutput As memoryBlock
		  dim bytepos As integer
		  dim n,memsize1, memsize2 As integer
		  
		  //Var
		  memsize1=minput.size
		  memsize2=memsize1\2
		  
		  //Neuer Memoryblock
		  moutput=NewMemoryBlock(memsize2)
		  if moutput=nil then
		    MsgBox "Fehler: Beim doppeln des Speicherabbildes (Ausgabe) ist ein Fehler aufgetreten!"
		    return nil
		  end if
		  
		  //Block doppeln
		  n=memsize1-2
		  for bytepos=0 to n step 2
		    moutput.Byte(bytepos/2)=minput.Ushort(bytepos)\values //257
		  next
		  
		  //Zurück
		  return moutput
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MetMemHalf3(minput As memoryBlock, values As integer) As memoryBlock
		  #pragma DisableAutoWaitCursor
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  
		  dim moutput As memoryBlock
		  dim bytepos As integer
		  dim n,memsize1, memsize2 As integer
		  
		  //Var
		  memsize1=minput.size
		  memsize2=memsize1\2
		  
		  //Neuer Memoryblock
		  moutput=NewMemoryBlock(memsize2)
		  if moutput=nil then
		    MsgBox "Fehler: Beim doppeln des Speicherabbildes (Ausgabe) ist ein Fehler aufgetreten!"
		    return nil
		  end if
		  
		  minput.CopyUShortToByteMBS(moutput,0,0,memsize2,values)
		  
		  //Zurück
		  return moutput
		End Function
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
			InitialValue="2147483648"
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
End Module
#tag EndModule
