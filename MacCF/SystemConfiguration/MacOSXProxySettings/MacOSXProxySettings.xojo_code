#tag Class
Protected Class MacOSXProxySettings
	#tag Method, Flags = &h1
		Protected Sub CheckBoolean(cd as CFDIctionaryMBS, s as CFStringMBS, byref result as boolean)
		  dim o as CFObjectMBS
		  dim b as CFBooleanMBS
		  dim n as CFNumberMBS
		  
		  // Check if a Boolean is there and return it's value
		  // false on not found.
		  
		  o=cd.Value(s)
		  if o isa CFBooleanMBS then
		    b=CFBooleanMBS(o)
		    result=b.Value
		  end if
		  
		  // for unknown reason it is a CFNumber for the proxy settings!?
		  if o isa CFNumberMBS then
		    n=CFNumberMBS(o)
		    result= n.integerValue=1
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CheckInteger(cd as CFDIctionaryMBS, s as CFStringMBS, byref result as integer)
		  dim o as CFObjectMBS
		  dim b as CFNumberMBS
		  
		  // Check if a Boolean is there and return it's value
		  // false on not found.
		  
		  o=cd.Value(s)
		  if o isa CFNumberMBS then
		    b=CFNumberMBS(o)
		    result=b.integerValue
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CheckString(cd as CFDIctionaryMBS, s as CFStringMBS, byref result as string)
		  dim o as CFObjectMBS
		  dim b as CFStringMBS
		  
		  // Check if a String is there and return it's value
		  // false on not found.
		  
		  o=cd.Value(s)
		  
		  if o isa CFStringMBS then
		    b=CFStringMBS(o)
		    
		    Result=b.Str
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  FindProxy
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub FindProxy()
		  dim ca as CFArrayMBS
		  dim co as CFObjectMBS
		  dim i,c as integer
		  dim cs as CFStringMBS
		  dim s as SystemConfigurationMBS
		  dim p as SCPreferencesMBS
		  dim o as CFObjectMBS
		  dim cd as CFDictionaryMBS
		  dim currentset as CFStringMBS
		  dim cdl as CFDictionaryListMBS
		  
		  s=new SystemConfigurationMBS
		  p=new SCPreferencesMBS
		  
		  if p.Create(NewCFStringMBS("TestRB"),nil) then
		    
		    // currentset is a CFString
		    // and can be used as key in the Network Services.
		    o=p.GetValue(s.kSCPrefCurrentSet)
		    currentset=CFStringMBS(o)
		    'CFShowMBS currentset
		    
		    // Find the value for this path and get the dictionary
		    cd=p.GetPathValue(currentset)
		    'CFShowMBS cd
		    
		    // get the network stuff in this dictionary
		    o=cd.Value(NewCFStringMBS("Network"))
		    if o isa CFDictionaryMBS then
		      cd=CFDictionaryMBS(o)
		      'CFShowMBS cd
		      
		      // get the list of services
		      o=cd.Value(NewCFStringMBS("Service"))
		      if o isa CFDictionaryMBS then
		        cd=CFDictionaryMBS(o)
		        'CFShowMBS cd
		        
		        // now we try each of them
		        
		        cdl=cd.List
		        c=cdl.Count-1
		        for i=0 to c
		          FindProxyInNetworkService(cdl.Value(i),s,p)
		        next
		      end if
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub FindProxyInNetworkService(dico as CFObjectMBS, s as SystemConfigurationMBS, p as SCPreferencesMBS)
		  dim cd as CFDictionaryMBS
		  dim cs as CFStringMBS
		  dim o as CFObjectMBS
		  
		  if dico isa CFDictionaryMBS then
		    cd=CFDictionaryMBS(dico)
		    
		    'CFShowMBS cd
		    
		    // get the link path
		    o=cd.Value(s.kSCResvLink)
		    
		    if o isa CFStringMBS then
		      cs=CFStringMBS(o)
		      
		      // search the Network Services linked
		      cd=p.GetPathValue(cs)
		      
		      'CFShowMBS cd
		      
		      // get its proxy values
		      o=cd.Value(s.kSCEntNetProxies)
		      
		      if o isa CFDictionaryMBS then
		        cd=CFDictionaryMBS(o)
		        
		        CheckBoolean(cd, s.kSCPropNetProxiesHTTPEnable,HTTPEnable) 
		        CheckInteger(cd, s.kSCPropNetProxiesHTTPPort,  HTTPPort) 
		        CheckString (cd, s.kSCPropNetProxiesHTTPProxy, HTTPProxy)
		        
		        CheckBoolean(cd, s.kSCPropNetProxiesHTTPSEnable,HTTPSEnable) 
		        CheckInteger(cd, s.kSCPropNetProxiesHTTPSPort,  HTTPSPort) 
		        CheckString (cd, s.kSCPropNetProxiesHTTPSProxy, HTTPSProxy)
		        
		        CheckBoolean(cd, s.kSCPropNetProxiesFTPEnable, FTPEnable) 
		        CheckBoolean(cd, s.kSCPropNetProxiesFTPPassive,FTPPassive) 
		        CheckInteger(cd, s.kSCPropNetProxiesFTPPort,   FTPPort) 
		        CheckString (cd, s.kSCPropNetProxiesFTPProxy,  FTPProxy)
		        
		      end if
		      
		    end if
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		FTPEnable As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FTPPassive As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FTPPort As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		FTPProxy As string
	#tag EndProperty

	#tag Property, Flags = &h0
		HTTPEnable As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		HTTPPort As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		HTTPProxy As string
	#tag EndProperty

	#tag Property, Flags = &h0
		HTTPSEnable As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		HTTPSPort As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		HTTPSProxy As string
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
		#tag ViewProperty
			Name="HTTPPort"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HTTPProxy"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HTTPEnable"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FTPEnable"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FTPPort"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FTPProxy"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FTPPassive"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HTTPSEnable"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HTTPSPort"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HTTPSProxy"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
