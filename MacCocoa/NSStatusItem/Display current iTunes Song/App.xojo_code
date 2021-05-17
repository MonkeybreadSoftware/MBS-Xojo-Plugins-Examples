#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim f as FolderItem
		  dim source as String
		  
		  if TargetMachO=false then
		    MsgBox "This example needs a MachO target running on Mac OS X."
		    quit
		  end if
		  
		  s=new NSStatusItemMBS
		  
		  if not s.Available then
		    MsgBox "NSStatusItem is not available."
		    quit
		  end if
		  
		  call s.CreateMenu
		  s.HighlightMode=false
		  s.Title="?"
		  
		  c=new clock
		  c.Period=2000
		  c.mode=2
		  
		  a=new AppleScriptMBS
		  a.UnicodeText=true
		  
		  source=       "tell application ""iTunes"""+chr(13)
		  source=source+"return name of current track"+chr(13)
		  source=source+"end tell"
		  
		  a.Compile source
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function getcurrentsong() As string
		  dim s as String
		  
		  a.Execute
		  
		  s=a.Result
		  
		  System.DebugLog str(lenb(s))+" "+str(len(s))
		  System.DebugLog hex(GetEncodingOfStringMBS(s))
		  
		  Return s
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub update()
		  dim t as String
		  
		  if s<>Nil then
		    
		    t=getcurrentsong
		    if t<>last then
		      s.title=t
		      last=t
		    end if
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected a As applescriptmBS
	#tag EndProperty

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
