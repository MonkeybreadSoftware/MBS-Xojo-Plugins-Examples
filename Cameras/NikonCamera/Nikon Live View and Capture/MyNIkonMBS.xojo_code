#tag Class
Protected Class MyNIkonMBS
Inherits NikonMBS
	#tag Event
		Sub FileDownloadComplete(info as NikonFileInfoMBS, data as Memoryblock, length as Integer)
		  // does only work if file is a JPEG
		  'Dim f as FolderItem=SpecialFolder.Desktop.Child("Nikon Data.txt")
		  'Dim TheDataDump as TextOutputStream=TextOutputStream.Create(f)
		  'If f <> Nil then
		  'TheDataDump.Write Data
		  'TheDataDump.Close
		  'End if
		  dim pic as Picture = Picture.FromData(Data)
		  Window1.pic= pic
		  WIndow1.CapCanvas.Refresh
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub ImageDownloadComplete(info as NikonImageInfoMBS, data as Memoryblock, length as Integer)
		  // maybe does not work if data is raw pixels!
		  dim pic as Picture = Picture.FromData(Data)
		  
		  Window1.pic= pic
		  WIndow1.CapCanvas.Refresh
		End Sub
	#tag EndEvent

	#tag Event
		Sub Progress(Command as integer, Param as Integer, Done as UInt32, Total as UInt32, Percent as double)
		  System.DebugLog "Progress: "+Format(Percent/100.0,"0%")
		  If Percent=100 then
		    Window1.Title=""
		  Else
		    Window1.Title="Transferring..."
		  End If
		End Sub
	#tag EndEvent


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
