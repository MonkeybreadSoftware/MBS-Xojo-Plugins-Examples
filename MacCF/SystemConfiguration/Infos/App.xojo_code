#tag Class
Protected Class App
Inherits Application
	#tag Method, Flags = &h0
		Function Flags(flags as integer) As string
		  const kSCNetworkFlagsTransientConnection =1
		  const kSCNetworkFlagsReachable = 2
		  const kSCNetworkFlagsConnectionRequired = 4
		  const kSCNetworkFlagsConnectionAutomatic = 8
		  const kSCNetworkFlagsInterventionRequired = 16
		  const kSCNetworkFlagsIsLocalAddress  = 65536
		  const kSCNetworkFlagsIsDirect   = 131072
		  
		  dim s as string
		  
		  if BitwiseAnd(flags, kSCNetworkFlagsTransientConnection)<>0 then
		    if s<>"" then
		      s=s+", "+chr(13)
		    end if
		    
		    s=S+"TransientConnection"
		  end if
		  
		  if BitwiseAnd(flags, kSCNetworkFlagsReachable)<>0 then
		    if s<>"" then
		      s=s+", "+chr(13)
		    end if
		    
		    s=S+"Reachable"
		  end if
		  
		  if BitwiseAnd(flags, kSCNetworkFlagsConnectionRequired)<>0 then
		    if s<>"" then
		      s=s+", "+chr(13)
		    end if
		    
		    s=S+"ConnectionRequired"
		  end if
		  
		  if BitwiseAnd(flags, kSCNetworkFlagsConnectionAutomatic)<>0 then
		    if s<>"" then
		      s=s+", "+chr(13)
		    end if
		    
		    s=S+"ConnectionAutomatic"
		  end if
		  
		  if BitwiseAnd(flags, kSCNetworkFlagsInterventionRequired)<>0 then
		    if s<>"" then
		      s=s+", "+chr(13)
		    end if
		    
		    s=S+"InterventionRequired"
		  end if
		  
		  if BitwiseAnd(flags, kSCNetworkFlagsIsLocalAddress)<>0 then
		    if s<>"" then
		      s=s+", "+chr(13)
		    end if
		    
		    s=S+"IsLocalAddress"
		  end if
		  
		  if BitwiseAnd(flags, kSCNetworkFlagsIsDirect)<>0 then
		    if s<>"" then
		      s=s+", "+chr(13)
		    end if
		    
		    s=S+"IsDirect"
		  end if
		  
		  if s<>"" then
		    s=s+", "+chr(13)
		  end if
		  
		  s=s+str(flags)
		  
		  Return s
		End Function
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
