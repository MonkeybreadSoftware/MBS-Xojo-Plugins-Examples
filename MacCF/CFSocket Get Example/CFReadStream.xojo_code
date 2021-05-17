#tag Class
Protected Class CFReadStream
Inherits CFReadStreamMBS
	#tag Event
		Sub Callback(reason as integer)
		  // constants for the reason:
		  
		  const kCFStreamEventNone = 0
		  const kCFStreamEventOpenCompleted = 1
		  const kCFStreamEventHasBytesAvailable = 2
		  const kCFStreamEventCanAcceptBytes = 4
		  const kCFStreamEventErrorOccurred = 8
		  const kCFStreamEventEndEncountered = 16
		  
		  Select case reason
		  case kCFStreamEventOpenCompleted
		    eventOpenCompleted
		  case kCFStreamEventHasBytesAvailable
		    eventHasBytesAvailable
		  case kCFStreamEventCanAcceptBytes
		    eventCanAcceptBytes
		  case kCFStreamEventErrorOccurred
		    eventErrorOccurred
		  case kCFStreamEventEndEncountered
		    eventEndEncountered
		  end Select
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Destructor()
		  if events then
		    me.RemoveEvents
		    events=false
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub eventCanAcceptBytes()
		  System.DebugLog "CanAcceptBytes Event"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub eventEndEncountered()
		  System.DebugLog "EndEncountered Event"
		  
		  MainWindow.Status.text="Fetch is complete."
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub eventErrorOccurred()
		  System.DebugLog "ErrorOccurred Event"
		  
		  MainWindow.Status.text="Error occurred."
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub eventHasBytesAvailable()
		  dim s as String
		  
		  System.DebugLog "HasBytesAvailable Event"
		  
		  s=me.ReadString(2048)
		  
		  if s<>"" then
		    
		    // Append text
		    MainWindow.result.SelStart=len(MainWindow.result.text)
		    MainWindow.result.SelLength=0
		    MainWindow.result.seltext=s
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub eventOpenCompleted()
		  System.DebugLog "OpenCompleted Event"
		  
		  MainWindow.Status.text="Stream is open."
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub fetchUrl(urlstring as string)
		  dim url as String
		  
		  url=urlstring
		  
		  if len(url)<1 then
		    Return 
		  end if
		  
		  if left(url,7)<>"http://" and left(url,8)<>"https://" then
		    url="http://"+url
		  end if
		  
		  cfurl=NewCFURLMBSStr(url,nil)
		  cfget=NewCFStringMBS("GET")
		  cfhttp=me.kCFHTTPVersion1_1
		  
		  request=CFHTTPMessageCreateRequestMBS(cfget,cfurl,cfhttp)
		  
		  // start the fetch
		  
		  if me.CreateForHTTPRequest(request) then
		    
		    if not events then // Install Event handler if not already installed
		      me.InstallEvents
		      events=true
		    end if
		    
		    if me.Open then
		      MainWindow.Status.text="Downloading..."
		    else
		      MainWindow.Status.text="Failed to open stream."
		    end if
		    
		  else
		    MainWindow.Status.text="Creating the stream failed."
		  end if
		  
		  Exception
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected cfget As cfstringMBS
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected cfhttp As CFStringMBS
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected cfstring As CFStringMBS
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected cfurl As CFURLMBS
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected events As boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected request As CFHTTPMessageMBS
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
