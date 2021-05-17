#tag Class
Protected Class MyMidiPort
Inherits MidiPortMBS
	#tag Event
		Sub Read(endpoint as MidiEndpointMBS, list as MidiPacketListMBS)
		  dim i, j, n, x as integer
		  dim pack as MIDIPacketMBS
		  dim s,f as string
		  dim cs as CFStringMBS
		  dim data as memoryBlock
		  dim k as integer
		  
		  system.debuglog "endpoint.Handle: "+hex(endpoint.Handle)
		  
		  count=count+1
		  k=count
		  n = list.Count-1
		  
		  system.debuglog str(k)+" "+str(list.Count)+" packets."
		  
		  for i = 0 to n
		    system.debuglog str(k)+" "+str(i)
		    pack = list.item(i)
		    
		    data = pack.dataMemory
		    x = data.size
		    
		    if data.byte(0) >= &h90 and data.byte(0) <= &h9F then
		      'note on
		      s = "Note on(" + str(data.byte(1)) + ") + velocity("+str(data.byte(2)) + ")"
		    elseif data.byte(0) >= &h80 and data.byte(0) <= &h8F then
		      'note off
		      s = "Note off(" + str(data.byte(1)) + ") + velocity("+str(data.byte(2)) + ")"
		    elseif data.byte(0) >= &hB0 and data.byte(0) <= &hBF then
		      s = "Controller change(" + str(data.byte(1)) + ") + value("+str(data.byte(2)) + ")"
		    elseif data.byte(0) >= &hE0 and data.byte(0) <= &hEF then
		      s = "Pitchbend"
		    elseif data.byte(0) = &hFE then
		      'don't do anything with active sensing
		      s = ""
		    else
		      system.debuglog str(k)+" something else"
		      'more midi events go here
		      s = ""
		      for j = 0 to x-1
		        s = s + str(data.byte(j)) + " "
		      next
		    end
		    
		    if s <> "" then
		      system.debuglog str(k)+" insertrow"
		      
		      cs=endpoint.StringProperty(endpoint.kMIDIPropertyName)
		      if cs<>Nil then
		        f=cs.str
		      else
		        f=""
		      end if
		      
		      window1.ListBox1.Insertrow 0,s+" from "+f
		    end
		    
		  next
		  system.debuglog str(k)+" finished. "
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h1
		Protected count As integer
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
