#tag Class
Protected Class MyThread
Inherits Thread
	#tag Event
		Sub Run()
		  dim c as integer = folder.count
		  dim filesTodo() as FolderItem
		  
		  for i as integer = 1 to c
		    
		    dim file as FolderItem = folder.TrueItem(i)
		    if file <> nil and file.Visible then
		      
		      // skip jpeg?
		      'if file.Name.Right(4) = ".jpg" then continue
		      
		      filesTodo.Append file
		      
		    end if
		    
		  next
		  
		  
		  StartTime = Microseconds
		  for each file as FolderItem in filesTodo
		    dim converter as new GMConvertMBS
		    
		    converter.InputFile = file
		    
		    dim ScaleGeometry as new GMGeometryMBS(512,512)
		    ScaleGeometry.aspect = false // keep aspect
		    ScaleGeometry.greater = true // Resize if image is greater than size (>)
		    
		    // Thumbnail scale is faster, but normal scale is better quality
		    'converter.ThumbnailGeometry = ScaleGeometry
		    converter.ScaleGeometry = ScaleGeometry
		    converter.Trim = true 
		    converter.AutoOrient = true
		    
		    converter.Strip = true // remove metadata
		    converter.OutputMagick = "jpeg"
		    converter.OutputFile = folder.Child(file.Name+".jpg")
		    converter.Quality = 90 // JPEG quality
		    
		    converter.run
		    
		    if converter.OutputImage <> nil then
		      
		      self.images.Append converter.OutputImage
		      self.files.append file
		      
		    end if
		    
		  next
		  
		  EndTime = Microseconds
		  done = true
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		done As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		EndTime As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		files() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		folder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		Images() As GMImageMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		StartTime As Double
	#tag EndProperty


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
		#tag ViewProperty
			Name="done"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EndTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StartTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
