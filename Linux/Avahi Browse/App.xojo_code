#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  if MyClient.available = false then
		    MsgBox "Please run on Linux with avahi installed."
		    quit
		  end if
		  
		  client = new MyClient
		  
		  log "HostName: "+Client.HostName
		  log "Domain: "+Client.DomainName
		  log "Version: "+Client.Version
		  
		  // for the list of domains we find
		  domains = new Dictionary
		  
		  // for the list of types we find
		  types = new Dictionary
		  
		  // for the browsers we run
		  Browsers = new Dictionary
		  
		  // for the resolvers we run
		  Resolvers = new Dictionary
		  
		  // look for types
		  typebrowser = new MyTypeBrowser(client)
		  
		  call typebrowser.BrowseTypes(typebrowser.kInterfaceAny, typebrowser.kProtocolAny)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Browse()
		  for each domain as string in domains.Keys
		    for each type as string in types.keys
		      dim key as string = type+domain
		      
		      if Browsers.HasKey(key) then
		        // already handled
		      else
		        
		        dim b as new MyBrowser(client)
		        
		        
		        if b.Browse(b.kInterfaceAny, b.kProtocolAny, type, domain) then
		          Browsers.Value(key) = b
		        end if
		        
		      end if
		    next
		  next
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Browsers As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Client As MyClient
	#tag EndProperty

	#tag Property, Flags = &h0
		Domains As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Resolvers As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		typebrowser As MyTypeBrowser
	#tag EndProperty

	#tag Property, Flags = &h0
		Types As Dictionary
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&L\xC3\xB6schen", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&L\xC3\xB6schen"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&L\xC3\xB6schen"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"Beenden", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Beenden"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
