#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim b as boolean
		  dim s as script
		  dim t as string
		  
		  crlf=chr(13)+chr(10)
		  c=new console
		  s=new script
		  if c.gotConsole then
		    c.title="RBScript console"
		    c.textColor=c.red
		    b=c.writeConsole("Please enter a RBScript command:"+crlf)
		    c.textColor=15 // red+blue+green+highlight
		    do
		      b=c.writeConsole(">")
		      t=c.readConsole(80)
		      if t<>"" then
		        if t="quit" then
		          quit
		        else
		          s.source=replaceall(t,";",chr(13))
		          s.run
		        end if
		      end if
		    loop
		    
		  end if
		  
		  quit
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		c As console
	#tag EndProperty

	#tag Property, Flags = &h0
		crlf As string
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="crlf"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
