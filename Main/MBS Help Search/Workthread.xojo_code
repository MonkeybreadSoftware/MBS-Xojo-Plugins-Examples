#tag Class
Protected Class Workthread
Inherits Thread
	#tag Event
		Sub Run()
		  
		  MainWindow.ProgressDisplay.Maximum=0
		  MainWindow.ProgressDisplay.Value=0
		  MainWindow.ProgressMessage.text="Reading directory..."
		  
		  ReadDirectory
		  
		  MainWindow.ProgressDisplay.Maximum=UBound(files)
		  MainWindow.ProgressDisplay.Value=0
		  MainWindow.ProgressMessage.text="Reading files..."
		  
		  ReadFiles
		  
		  MainWindow.ProgressMessage.text="Loaded "+str(ubound(files))+" files..."
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReadDirectory()
		  dim dir as FolderItem
		  dim file as FolderItem
		  dim f as file
		  dim i,c as integer
		  
		  dir=FindFile("HTML files")
		  dir=dir.Child("files")
		  c=dir.Count
		  
		  for i=1 to c
		    file=dir.item(i)
		    if file<>nil and Right(file.name,5)=".html" then
		      f=new file
		      f.file=file
		      files.Append f
		    end if
		  next
		  
		  Exception
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReadFiles()
		  dim p as ProgressBar
		  dim i,c,n as integer
		  dim f as file
		  
		  p=MainWindow.ProgressDisplay
		  
		  c=UBound(files)
		  n=1
		  for i=c downto 1
		    f=files(i)
		    
		    p.Value=n
		    f.process
		    n=n+1
		  next
		  p.Value=n
		  
		  Exception
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		files(0) As file
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
	#tag EndViewBehavior
End Class
#tag EndClass
