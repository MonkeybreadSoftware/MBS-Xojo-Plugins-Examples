#tag Class
Protected Class MyWindowsProcessMBS
Inherits WindowsProcessMBS
	#tag Event
		Sub DataAvailable(AvailableBytesOutput as Integer, AvailableBytesError as Integer)
		  
		  if AvailableBytesOutput > 0 then
		    log str(AvailableBytesOutput)+" Bytes available on output:"
		    
		    dim o as string = me.ReadOutput(AvailableBytesOutput)
		    
		    if o <> "" then
		      
		      'dim f as FolderItem = SpecialFolder.Desktop.Child("output.txt")
		      'dim t as TextOutputStream = TextOutputStream.Append(f)
		      't.Write o
		      
		      o = FixEncoding(o) // you should know encoding of other app!
		      log o
		    end if
		  end if
		  
		  if AvailableBytesError > 0 then
		    log str(AvailableBytesError)+" Bytes available on error:"
		    
		    dim e as string = me.ReadError(AvailableBytesError)
		    
		    if e <> "" then
		      e = FixEncoding(e) // you should know encoding of other app!
		      log e
		    end if
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Terminated(ExitCode as Integer)
		  log "Terminated with exit code "+str(ExitCode)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FixEncoding(e as string) As string
		  if e.Encoding = nil then
		    if encodings.UTF8.IsValidData(e) then
		      e = DefineEncoding(e, encodings.UTF8)
		    else
		      e = DefineEncoding(e, encodings.DOSLatin1) // works for me with umlauts
		    end if
		  end if
		  
		  Return e
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub log(message as string)
		  MainWindow.Log.AppendText message + EndOfLine + EndOfLine
		  MainWindow.Log.ScrollPosition = 10000000 // to end
		  
		End Sub
	#tag EndMethod


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
			InitialValue="-2147483648"
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
	#tag EndViewBehavior
End Class
#tag EndClass
