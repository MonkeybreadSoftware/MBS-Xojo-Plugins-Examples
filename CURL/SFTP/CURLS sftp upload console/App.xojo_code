#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  dim url as string = "sftp://user:pass@localhost/users/cs/desktop/test.txt"
		  dim data as string = "Just a little bit text. Have fun!"
		  
		  DoUpload url, data
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub DoUpload(URL as string, data as string)
		  
		  dim e as integer
		  dim d as new UploadCURL
		  
		  d.InputData=data
		  d.OptionURL=URL
		  d.OptionUpload=true
		  d.optionverbose=true
		  d.CollectDebugData = true
		  
		  e=d.Perform
		  
		  print "Result: "+str(e)
		  
		  dim DebugMessage as string = d.DebugData
		  
		  Select case e
		  case d.kError_LOGIN_DENIED
		    print "Wrong password."
		  case d.kError_UNSUPPORTED_PROTOCOL 
		    print "Protocol not implemented."
		  case d.kError_OK
		    print "No error."
		  else
		    break // some other error
		  end select
		  
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
