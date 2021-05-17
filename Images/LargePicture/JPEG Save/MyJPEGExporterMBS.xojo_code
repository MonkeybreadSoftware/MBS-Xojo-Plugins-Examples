#tag Class
Protected Class MyJPEGExporterMBS
Inherits JPEGExporterMBS
	#tag Event
		Sub Error(message as string, ErrorCode as integer)
		  MsgBox "Error: "+Message
		End Sub
	#tag EndEvent

	#tag Event
		Function GetRowData(index as integer) As memoryblock
		  if p=nil then
		    Return nil
		  else
		    if huge>0 then
		      dim m as MemoryBlock=p.RowInFormat(index mod height, PictureMBS.ImageFormatRGB)
		      dim size as integer = m.Size*huge
		      dim n as MemoryBlock=NewMemoryBlock(size)
		      
		      dim o as integer
		      for i as integer=1 to huge
		        m.CopyBytesMBS(0,m.size, n, o)
		        o=o+m.size 
		      next
		      
		      Return n
		    else
		      dim m as MemoryBlock=p.RowInFormat(index, PictureMBS.ImageFormatRGB)
		      Return m
		    end if
		    
		  end if
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		height As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		huge As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		p As PictureMBS
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
		#tag ViewProperty
			Name="height"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="huge"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
