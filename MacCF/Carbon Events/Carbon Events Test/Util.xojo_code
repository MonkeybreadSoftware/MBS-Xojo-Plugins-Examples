#tag Module
Protected Module Util
	#tag Method, Flags = &h0
		Sub speakandwrite(s as string)
		  ' crashes sometimes
		  'dim i as Integer
		  '
		  'Declare Function MySpeakString lib "CarbonLib" Alias "SpeakString" (SpeakString as pstring)  as Integer
		  '
		  'i=MySpeakString(s)
		  
		  write s
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(s as string)
		  dim i,c as integer
		  dim w as window
		  dim m as MainWindow
		  
		  c=WindowCount-1
		  for i=0 to c
		    w=Window(i)
		    if w isa MainWindow then
		      m=MainWindow(w)
		      m.List.InsertRow 0,s
		    end if
		  next
		  
		  System.DebugLog s
		  
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
			InitialValue="2147483648"
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
End Module
#tag EndModule
