#tag Class
Protected Class File
	#tag Method, Flags = &h0
		Function FindTitel(s as string) As string
		  dim p1,p2 as integer
		  dim p,l as integer
		  dim t as string
		  
		  const titlestart="<TITLE>"
		  const titleend="</TITLE>"
		  const mbs="Monkeybread Realbasic plugin - "
		  
		  p1=instr(s,titlestart)
		  p2=instr(s,titleend)
		  
		  l=p2-p1-len(mbs)-len(titlestart)
		  p=p1+len(titlestart)+len(mbs)
		  t=mid(s,p,l)
		  Return t
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasIndex() As Boolean
		  dim f as FolderItem
		  dim dir as FolderItem
		  dim t as TextInputStream
		  
		  dir=HelpIndexFolder
		  
		  
		  if dir<>Nil and dir.Exists then
		    f=dir.Child(file.Name)
		    
		    if f<>nil and f.Exists then
		      if f.ModificationDate.TotalSeconds>=file.ModificationDate.TotalSeconds then
		        
		        t=f.OpenAsTextFile
		        
		        titel=t.ReadLine(Encodings.UTF8)
		        text=t.ReadAll(Encodings.utf8)
		        if text<>"" then
		          Return true
		        end if
		      end if
		    end if
		  end if
		  
		  Exception
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function HelpIndexFolder() As folderitem
		  dim f as folderitem
		  
		  f=CreateCachedDataFolderMBS(-32763)
		  
		  if f=nil then
		    f=CreateApplicationSupportFolderMBS(-32763)
		  end if
		  
		  if f=nil then
		    // Last way for Windows/Linux
		    f=SpecialFolder.ApplicationData
		  end if
		  
		  f=f.Child("MBS Help Search")
		  f.CreateAsFolder
		  
		  Return f
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function name() As string
		  Return file.Name
		  
		  Exception
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub process()
		  dim b as BinaryStream
		  dim s as string
		  
		  if not hasindex then
		    b=file.OpenAsBinaryFile(false)
		    
		    s=b.Read(b.Length, Encodings.ASCII)
		    
		    if s<>"" then
		      titel=FindTitel(s)
		      s=RemoveLinks(s)
		      s=RemoveHTMLTagsMBS(s)
		      s=DecodingFromHTMLMBS(s)
		      s=ConvertEncoding(s,Encodings.UTF8)
		      s=Shorten(s)
		      if s<>"" then
		        text=s
		        WriteIndex
		      end if
		    end if
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveLinks(s as string) As String
		  dim p as integer
		  
		  p=instr(s,"<!-- Ende Content-->")
		  if p>0 then
		    s=left(s,p-1)
		  end if
		  
		  const start="<!-- Start Content -->"
		  p=instr(s,start)
		  if p>0 then
		    s=mid(s,p+len(start))
		  end if
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteIndex()
		  dim f as FolderItem
		  dim dir as FolderItem
		  dim t as TextOutputStream
		  
		  dir=HelpIndexFolder
		  
		  f=dir.Child(file.Name)
		  
		  t=f.CreateTextFile
		  t.WriteLine titel.ConvertEncoding(Encodings.UTF8)
		  t.Write text.ConvertEncoding(Encodings.UTF8)
		  t.Close
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		file As folderitem
	#tag EndProperty

	#tag Property, Flags = &h0
		text As string
	#tag EndProperty

	#tag Property, Flags = &h0
		titel As string
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
		#tag ViewProperty
			Name="text"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="titel"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
