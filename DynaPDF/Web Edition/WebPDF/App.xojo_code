#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Sub Open()
		  'RegisterDynaPDF
		  
		  dim uploadFolder as FolderItem = FindFolder("uploads")
		  dim samplesFolder as FolderItem = FindFolder("samples")
		  
		  if uploadFolder = nil then
		    uploadFolder = FindFile("uploads")
		    uploadFolder.CreateAsFolder
		  end if
		  
		  if samplesFolder = nil then
		    samplesFolder = FindFile("samples")
		    samplesFolder.CreateAsFolder
		  end if
		  
		  call GetObjectClassNameMBS(self) // init
		  
		  LoadSamples
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(Error As RuntimeException) As Boolean
		  System.DebugLog "Unhandled "+GetObjectClassNameMBS(error)+": "+Error.Message
		  
		End Function
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
		Sub LoadSamples()
		  System.DebugLog "Loading sample files..."
		  
		  dim f as FolderItem = FindFolder("samples")
		  
		  if f<>nil then
		    dim c as integer = f.Count
		    for i as integer = 1 to c
		      dim g as FolderItem = f.TrueItem(i)
		      if g<>nil and g.Visible and not g.Directory then
		        dim n as integer = GetPDFPageCount(g)
		        
		        if n>0 then
		          SampleNames.Append g.DisplayName
		          SampleFiles.append g
		          SamplePageCount.Append n
		          
		        end if
		      end if
		    next
		    
		    System.DebugLog "Samples loaded."
		  else
		    System.DebugLog "No samples found."
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		SampleFiles(-1) As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		SampleNames(-1) As string
	#tag EndProperty

	#tag Property, Flags = &h0
		SamplePageCount(-1) As Integer
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
