#tag Module
Protected Module Util
	#tag Method, Flags = &h0
		Function PictureToJPEGString(p as Picture, q as integer) As string
		  dim t as FolderItem = GetTemporaryFolderItem
		  
		  t.SaveAsJPEG p
		  
		  dim b as BinaryStream = t.OpenAsBinaryFile(False)
		  if b<>Nil then
		    Return b.Read(B.Length)
		  end if
		  
		  Exception r as runtimeexception
		    
		    if DebugBuild then
		      MsgBox r.message
		    end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PictureToPNGString(p as Picture) As string
		  dim t as FolderItem = GetTemporaryFolderItem
		  
		  t.SaveAsPicture p, FolderItem.SaveAsPNG
		  
		  dim b as BinaryStream = t.OpenAsBinaryFile(False)
		  if b<>Nil then
		    Return b.Read(B.Length)
		  end if
		  
		  Exception r as runtimeexception
		    
		    if DebugBuild then
		      MsgBox r.message
		    end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PictureToTiffString(p as Picture) As string
		  dim t as FolderItem = GetTemporaryFolderItem
		  
		  t.SaveAsPicture p, FolderItem.SaveAsTIFF
		  
		  dim b as BinaryStream = t.OpenAsBinaryFile(False)
		  if b<>Nil then
		    Return b.Read(B.Length)
		  end if
		  
		  Exception r as runtimeexception
		    
		    if DebugBuild then
		      MsgBox r.message
		    end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PictureToTIFFStringMBS(p as Picture) As string
		  // very easy function
		  // does not set compression, icc profile, mask, etc.
		  
		  dim t as new TiffPictureMBS
		  
		  if t.CreateString(1000000) then
		    t.Pict=p
		    
		    if t.WriteRGB then
		      t.Close
		      
		      Return t.OutputBuffer
		    end if
		    
		  end if
		  
		  
		  Exception r as runtimeexception
		    
		    if DebugBuild then
		      MsgBox r.message
		    end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringToPicture(s as string) As Picture
		  if lenb(s)=0 then Return nil
		  
		  dim t as FolderItem = GetTemporaryFolderItem
		  
		  dim b as BinaryStream = t.CreateBinaryFile("")
		  
		  if b<>Nil then
		    b.Write s
		    b.Close
		    
		    Return t.OpenAsPicture
		    
		  end if
		  
		  Exception r as runtimeexception
		    
		    if DebugBuild then
		      MsgBox r.message
		    end if
		End Function
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
End Module
#tag EndModule
