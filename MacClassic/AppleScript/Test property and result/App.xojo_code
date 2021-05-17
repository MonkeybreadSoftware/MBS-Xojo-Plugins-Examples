#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim s as String
		  dim a as AppleScriptMBS
		  dim i,c,cc as integer
		  dim z,t as String
		  
		  s=s+"property hello : ""Hallo Leute"""+chr(13)
		  s=s+"property just : ""Just a test"""+chr(13)
		  s=s+"display dialog hello"+chr(13)
		  s=s+"return just"+chr(13)
		  
		  MsgBox "The script:"+chr(13)+s
		  a=new AppleScriptMBS
		  
		  a.Compile s
		  
		  c=a.CountScriptProperties
		  
		  cc=c-1
		  for i=0 to cc
		    z=a.ScriptProperty(i)
		    if z<>"" then
		      if i=0 then
		        t=z
		      elseif i=cc then
		        t=t+" and "+z
		      else
		        t=t+", "+z
		      end if
		    end if
		  next
		  
		  MsgBox str(c)+" properties in the script: "+t
		  
		  t=a.ScriptProperty(0)
		  z=a.ScriptPropertyValue(t)
		  MsgBox "Value of the property named "+t+" is: "+z
		  
		  a.ScriptPropertyValue(t)="Hello World!"
		  
		  z=a.ScriptPropertyValue(t)
		  MsgBox "The new value of the property named "+t+" is: "+z
		  
		  a.Execute
		  
		  MsgBox "The result is: "+a.Result
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
