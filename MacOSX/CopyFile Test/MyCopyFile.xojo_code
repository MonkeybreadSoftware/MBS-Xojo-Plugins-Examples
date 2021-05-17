#tag Class
Protected Class MyCopyFile
Inherits CopyFileMBS
	#tag Event
		Function Progress(What as Integer, Stage as Integer, Source as String, Dest as String) As Integer
		  Dim WhatString As String
		  
		  Select Case what
		    
		  Case kWhatCopyData
		    WhatString = "Copy Data"
		  Case kWhatCopyXAttr
		    WhatString = "Copy XAttr"
		  Case kWhatRecurseDir
		    WhatString = "Recurse Dir"
		  Case kWhatRecurseDirCleanup
		    WhatString = "Recurse Dir Cleanup"
		  Case kWhatRecurseError
		    WhatString = "Recurse Error"
		  Case kWhatRecurseFile
		    WhatString = "Recurse File"
		    
		  Else
		    Break
		  End Select
		  
		  
		  Dim StageString As String
		  
		  Select Case Stage
		    
		  Case kStageError
		    StageString = "Error"
		  Case kStageFinish
		    StageString = "Finish"
		  Case kStageProgress
		    StageString = "Progress"
		  Case kStageStart
		    StageString = "Start"
		    
		  Else
		    Break
		  End Select
		  
		  Dim values() As String
		  
		  values.Append WhatString
		  values.Append StageString
		  values.Append source
		  values.Append dest
		  values.Append Str(Me.BytesCopied)
		  
		  
		  
		  // don't use WeakAddressOf here as it may cause NilObjectException later
		  xojo.core.Timer.CallLater 0, AddressOf AddToLogList, values
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddToLogList(values as auto)
		  // add to list on main thread
		  
		  Dim v() As String = values
		  
		  list.AddRow v
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		list As listbox
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
