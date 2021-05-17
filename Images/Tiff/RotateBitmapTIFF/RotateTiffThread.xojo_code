#tag Class
Protected Class RotateTiffThread
Inherits Thread
	#tag Event
		Sub Run()
		  Me.Sleep(500)
		  
		  Dim desc,err As String
		  Dim DestFldr As FolderItem = SpecialFolder.Desktop
		  
		  Dim n As Integer 
		  Dim oldname,newname,nameparts() As String
		  oldname = InputFile.Name
		  nameparts = Split(oldname,".")
		  For n = 0 To UBound(nameparts) -1
		    If n = 0 Then
		      newname = nameparts(n)
		    Else
		      newname = newname + "." + nameparts(n)
		    End If
		  Next
		  n = UBound(nameparts)
		  newname = newname + "." + Str(Degrees) + "." + nameparts(n)
		  Dim OutputFile As FolderItem = SpecialFolder.Desktop.Child(newname)
		  
		  Dim InputTIFF As New MyTIFF
		  Dim OutputTIFF As New MyTIFF
		  
		  If InputTIFF.Open(InputFile) Then
		    If OutputTIFF.Create(OutputFile) Then
		      
		      Dim d As Date
		      Dim y,m,dy,hh,mm,ss As String
		      d = New Date
		      y = Right(Str(d.Year),2)
		      m = Format(d.Month,"0#")
		      dy = Format(d.Day,"0#")
		      hh =Format(d.Hour,"0#")
		      mm = Format(d.Minute,"0#")
		      ss =Format(d.Second,"0#")
		      
		      // Determine orientation
		      If Degrees mod 180 = 90 or Degrees mod 180 = -90 then
		        // Swap orientation
		        OutputTIFF.Height = InputTIFF.Width
		        OutputTIFF.Width = InputTIFF.Height
		      Else
		        // Same orientation
		        OutputTIFF.Width = InputTIFF.Width
		        OutputTIFF.Height = InputTIFF.Height
		      End If
		      
		      OutputTIFF.BitsPerSample = InputTIFF.BitsPerSample
		      OutputTIFF.SamplesPerPixel = InputTIFF.SamplesPerPixel
		      OutputTIFF.Compression = InputTIFF.Compression
		      OutputTIFF.PlanarConfig = InputTIFF.PlanarConfig
		      OutputTIFF.Photometric = InputTIFF.Photometric
		      OutputTIFF.RowsPerStrip = InputTIFF.RowsPerStrip
		      OutputTIFF.FillOrder = InputTIFF.FillOrder
		      OutputTIFF.Copyright = InputTIFF.Copyright
		      OutputTIFF.DateTime = y + ":" + m + ":" + dy + " " + hh + ":" + mm + ":" + ss
		      OutputTIFF.DocumentName=InputTIFF.DocumentName
		      OutputTIFF.ExtraSamples=InputTIFF.ExtraSamples
		      OutputTIFF.SampleFormat = InputTIFF.SampleFormat
		      OutputTIFF.HorizontalPosition = InputTIFF.HorizontalPosition
		      OutputTIFF.HorizontalResolution = InputTIFF.HorizontalResolution
		      OutputTIFF.HostComputer = InputTIFF.HostComputer
		      OutputTIFF.ImageDescription = InputTIFF.ImageDescription
		      OutputTIFF.Make = InputTIFF.Make
		      OutputTIFF.Model = InputTIFF.Model
		      OutputTIFF.Orientation = InputTIFF.Orientation
		      OutputTIFF.PageName=InputTIFF.PageName
		      OutputTIFF.ResolutionUnit = InputTIFF.ResolutionUnit
		      OutputTIFF.Software = InputTIFF.Software
		      OutputTIFF.VerticalPosition = InputTIFF.VerticalPosition
		      OutputTIFF.VerticalResolution = InputTIFF.VerticalResolution
		      
		      
		      Dim inMB as MemoryBlock = InputTIFF.Scanlines(0,InputTIFF.Height)
		      Dim outMB as new MemoryBlock(OutputTIFF.BytesPerRow * (OutputTIFF.Height+7))
		      // output buffer with a bit of safeguard space on the end.
		      
		      Dim b as Boolean
		      Dim m1 as Double = Microseconds
		      
		      b = BitRotateMBS(Degrees,inMB,outMB, InputTIFF.Width, InputTIFF.Height, InputTIFF.BytesPerRow, OutputTIFF.BytesPerRow)
		      
		      dim m2 as Double = Microseconds
		      
		      if b then
		        
		        OutputTIFF.Scanlines(0,OutputTIFF.Height) = outMB
		        if OutputTIFF.waserror then
		          Messages.Append("Error on Copy!")
		        end if
		        
		        InputTIFF.Close
		        OutputTIFF.Close
		        
		        Messages.Append(str(Degrees)+" Okay: "+Format((m2-m1) / 1000000,"#,###,##0.00") + " seconds")
		        
		      else
		        Messages.Append("Rotate failed.")
		      end if
		      
		      
		    Else
		      // Error
		      Messages.Append("The OutputTIFF could not be created. ")
		    End If
		    
		  Else
		    // Error
		    Messages.Append("The TIFF could not be opened. ")
		  End If 
		  
		  RotateDone
		  
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
		#tag ViewProperty
			Name="DebugIdentifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadState"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ThreadStates"
			EditorType="Enum"
			#tag EnumValues
				"0 - Running"
				"1 - Waiting"
				"2 - Paused"
				"3 - Sleeping"
				"4 - NotRunning"
			#tag EndEnumValues
		#tag EndViewProperty
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
		#tag ViewProperty
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
