#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim f as FolderItem
		  
		  if TargetMachO=false then
		    MsgBox "This example needs a MachO target running on Mac OS X."
		    quit
		  end if
		  
		  s=new NSStatusItemMBS
		  
		  if not s.Available then
		    MsgBox "NSStatusItem not available."
		    quit
		  end if
		  
		  call s.CreateMenu
		  s.HighlightMode=false
		  s.Title="IP"
		  
		  c=new clock
		  c.Period=2000
		  c.mode=2
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub update()
		  dim t as String
		  dim sock as tcpSocket
		  
		  if s<>Nil then
		    sock=new tcpSocket
		    
		    t="IP "+sock.LocalAddress
		    if t<>last then
		      s.Title=t
		      last=t
		    end if
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		c As clock
	#tag EndProperty

	#tag Property, Flags = &h0
		last As string
	#tag EndProperty

	#tag Property, Flags = &h0
		s As NSStatusItemMBS
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="last"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
