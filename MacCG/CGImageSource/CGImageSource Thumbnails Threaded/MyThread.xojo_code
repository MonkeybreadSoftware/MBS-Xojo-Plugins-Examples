#tag Class
Protected Class MyThread
Inherits Thread
	#tag Event
		Sub Run()
		  dim c as integer = folder.count
		  
		  dim options as new Dictionary
		  options.Value(CGImageSourceMBS.kCGImageSourceThumbnailMaxPixelSize) = 100
		  options.Value(CGImageSourceMBS.kCGImageSourceCreateThumbnailFromImageIfAbsent) = true
		  
		  for i as integer = 1 to c
		    
		    dim file as FolderItem = folder.TrueItem(i)
		    if file <> nil and file.Visible then
		      
		      dim image as CGImageMBS = CGImageSourceMBS.CreateThumbnailMT(file, 0, options)
		      
		      if image <> nil then
		        images.Append image
		        files.append file
		      end if
		      
		    end if
		    
		  next
		  
		  done = true
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		done As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		files() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		folder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		Images() As CGImageMBS
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
	#tag EndViewBehavior
End Class
#tag EndClass
