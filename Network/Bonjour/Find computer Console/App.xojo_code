#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  print "Press control-C to quit."
		  
		  StartBrowse "_ftp._tcp","FTP Server"
		  StartBrowse "_afpovertcp._tcp","Apple File Sharing"
		  StartBrowse "_nfs._tcp","Network File System"
		  StartBrowse "_http._tcp","Webserver"
		  StartBrowse "_printer._tcp","Printer"
		  StartBrowse "_ichat._tcp","iChat (old)"
		  StartBrowse "_presence._tcp","iChat"
		  StartBrowse "_daap._tcp","iTunes"
		  StartBrowse "_dpap._tcp","iPhoto"
		  StartBrowse "_ipp._tcp","Intenet Printing Protocol"
		  StartBrowse "_pdl-datastream._tcp","PDL Data Stream"
		  StartBrowse "_distcc._tcp","XCode"
		  StartBrowse "_xserveraid._tcp","XServe RAID"
		  
		  
		  do
		    // give time to system threads and timers
		    DelayMBS 0.1
		    
		    // and give time to RB timers, sockets and threads
		    DoEvents
		  loop
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ClearAddrInfos()
		  
		  dim u as integer = UBound(addrinfos)
		  for i as integer = u downto 0
		    if addrinfos(i).done then
		      addrinfos.Remove i
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearLookups()
		  dim l as MyLookup
		  dim i,c as integer
		  
		  c=UBound(lookup)
		  for i=c downto 0
		    if lookup(i).done then
		      lookup.Remove i
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartAddrInfo(name as string, type as string, domain as string, reason as string, hostname as string, port as integer)
		  dim b as new MyAddrInfo
		  
		  ClearAddrInfos
		  
		  if b.AddrInfo(0, b.kProtocolIPv4, hostname) then
		    b.Reason = reason
		    b.name = name
		    b.port = port
		    addrinfos.Append b
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub StartBrowse(typ as string, reason as string)
		  dim b as MyBrowser
		  
		  b=new MyBrowser
		  
		  if b.Browse(b.kInterfaceIndexAny, typ, "") then
		    b.Reason=reason
		    browser.Append b
		  else
		    print "Failed to init browser for "+typ
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartLookup(name as string, type as string, domain as string, reason as string)
		  dim b as MyLookup
		  
		  ClearLookups
		  b=new MyLookup
		  
		  if b.Resolve(b.kInterfaceIndexAny, name, type, domain) then
		    b.Reason = reason
		    b.name = name
		    b.type = type
		    b.domain = domain
		    lookup.Append b
		  end if
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		addrinfos(-1) As MyAddrInfo
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected browser(-1) As MyBrowser
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected lookup(-1) As MyLookup
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
