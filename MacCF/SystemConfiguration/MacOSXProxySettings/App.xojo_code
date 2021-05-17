#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim m as MacOSXProxySettings
		  
		  m=new MacOSXProxySettings
		  
		  if m.HTTPEnable then
		    MsgBox "HTTP Proxy: "+m.HTTPProxy+":"+str(m.HTTPPort)
		  else
		    MsgBox "No HTTP Proxy."
		  end if
		  
		  quit
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
