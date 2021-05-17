#tag Class
Protected Class SubDDE
Inherits DDEMBS
	#tag Event
		Function AdviceData(topic as DDEStringMBS, item as DDEStringMBS, dataformat as integer,data as DDEBinaryDataMBS) As integer
		  list.addRow "AdviceData. Topic: "+st(topic)+", item: "+st(item)+", format: "+str(dataformat)
		  
		  return me.DDE_FACK //ok
		  
		  exception e
		    msgBox "Exception in SubDDE.AdviceData."
		End Function
	#tag EndEvent

	#tag Event
		Function AdviceRequest(topic as DDEStringMBS, item as DDEStringMBS, dataformat as integer,remaincount as integer) As DDEBinaryDataMBS
		  list.addRow "AdviceRequest. Topic: "+st(topic)+", item: "+st(item)+", format: "+str(dataformat)+" remaincount: "+str(remaincount)
		  
		  return nil // nothing to give
		  
		  exception e
		    msgBox "Exception in SubDDE.AdviceRequest."
		End Function
	#tag EndEvent

	#tag Event
		Function AdviceStart(topic as DDEStringMBS, item as DDEStringMBS, dataformat as integer) As Boolean
		  list.addRow "AdviceStart. Topic: "+st(topic)+", item: "+st(item)+", format: "+str(dataformat)
		  
		  return true // give advise
		  exception e
		    msgBox "Exception in SubDDE.AdviceStart."
		End Function
	#tag EndEvent

	#tag Event
		Sub AdviceStop(topic as DDEStringMBS, item as DDEStringMBS, dataformat as integer)
		  list.addRow "AdviceStop. Topic: "+st(topic)+", item: "+st(item)+", format: "+str(dataformat)
		  
		  exception e
		    msgBox "Exception in SubDDE.AdviceStop."
		End Sub
	#tag EndEvent

	#tag Event
		Sub ConfirmConnect(topic as DDEStringMBS, service as DDEStringMBS, myself as Boolean)
		  list.addRow "ConfirmConnect. Topic: "+st(topic)+", item: "+st(service)
		  
		  exception e
		    msgBox "Exception in SubDDE.ConfirmConnect."
		End Sub
	#tag EndEvent

	#tag Event
		Function Connect(topic as DDEStringMBS, service as DDEStringMBS, myself as Boolean,info as DDEContextInfoMBS) As Boolean
		  dim s as string
		  
		  list.addRow "Connect. Topic: "+st(topic)+", item: "+st(service)
		  
		  if info<>Nil then
		    if info.ansi then
		      s="Ansi"
		    elseif info.unicode then
		      s="Unicode"
		    else
		      s="?"
		    end if
		    list.addrow "   Encoding: "+s+", Language: "+str(info.langID)+", Country: "+str(info.countryID)
		  end if
		  
		  return true
		  
		  exception e
		    msgBox "Exception in SubDDE.Connect."
		End Function
	#tag EndEvent

	#tag Event
		Sub Disconnect(myself as Boolean)
		  list.addRow "Disconnect."
		  
		  
		  exception e
		    msgBox "Exception in SubDDE.Disconnect."
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error(errorcode as integer)
		  list.addRow "Error. errorcode: "+str(errorcode)
		  
		  exception e
		    msgBox "Exception in SubDDE.Error."
		End Sub
	#tag EndEvent

	#tag Event
		Function Execute(topic as DDEStringMBS,data as DDEBinaryDataMBS) As integer
		  dim s as string
		  
		  list.addRow "Execute. Topic: "+st(topic)
		  
		  s=data.Str
		  if s="msgbox" then
		    msgBox "Hello World!"
		    
		    return me.DDE_FACK
		  else
		    return me.DDE_FNOTPROCESSED // I want only my msgbox and nothing else.
		  end if
		  
		  exception e
		    msgBox "Exception in SubDDE.Execute."
		End Function
	#tag EndEvent

	#tag Event
		Function Poke(topic as DDEStringMBS,item as DDEStringMBS,data as DDEBinaryDataMBS) As integer
		  list.addRow "Poke. Topic: "+st(topic)+", Item: "+st(item)
		  
		  return me.DDE_FACK
		  
		  exception e
		    msgBox "Exception in SubDDE.Poke."
		End Function
	#tag EndEvent

	#tag Event
		Sub Register(application as DDEStringMBS,service as DDEStringMBS)
		  list.addRow "Register. Topic: "+st(application)+", Item: "+st(service)
		  
		  exception e
		    msgBox "Exception in SubDDE.Register."
		End Sub
	#tag EndEvent

	#tag Event
		Function Request(topic as DDEStringMBS,item as DDEStringMBS,dataformat as integer) As DDEBinaryDataMBS
		  list.addRow "Request. Topic: "+st(topic)+", Item: "+st(item)+", format: "+str(dataformat)
		  
		  return me.NewDDEBinaryData(nil,"Hello World!")
		  
		  exception e
		    msgBox "Exception in SubDDE.Request."
		End Function
	#tag EndEvent

	#tag Event
		Sub UnRegister(application as DDEStringMBS,service as DDEStringMBS)
		  list.addRow "unregister. Topic: "+st(application)+", Item: "+st(service)
		  
		  exception e
		    msgBox "Exception in SubDDE.Unregister."
		End Sub
	#tag EndEvent

	#tag Event
		Function WildConnect(topic as DDEStringMBS,service as DDEStringMBS, myself as boolean,info as DDEContextInfoMBS) As DDEStringPairListMBS
		  dim l as DDEStringPairListMBS
		  dim p as DDEStringPairMBS
		  
		  p=new DDEStringPairMBS
		  p.Service=NewDDEString("MyService")
		  p.Topic=NewDDEString("MyTopic")
		  l=new DDEStringPairListMBS
		  l.Append p
		  
		  list.addRow "Wild Connect. Topic: "+st(topic)+", item: "+st(service)
		  
		  return l
		  
		  exception e
		    msgBox "Exception in SubDDE.WildConnect."
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function St(s as ddestringmBS) As string
		  if s<>nil then
		    return s.Str
		  end if
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		list As listbox
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
