#tag Module
Protected Module WindowsAppNames
	#tag Method, Flags = &h0
		Sub init()
		  dim f as FolderItem
		  
		  dic=new Dictionary
		  
		  f=WindowsStartMenuMBS(-32763)
		  
		  run f
		  
		  f=WindowsStartMenuMBS(-32766)
		  
		  run f
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function names() As dictionary
		  Return dic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub run(f as folderitem)
		  dim i,c as integer
		  dim g as FolderItem
		  
		  if f<>nil then
		    c=f.Count
		    
		    for i=1 to c
		      g=f.TrueItem(i)
		      
		      if g.Visible then
		        if g.Directory then
		          run g
		        else
		          runitem g
		        end if
		      end if
		    next
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub runitem(f as folderitem)
		  dim s as new WindowsShortCutMBS
		  dim n,e4 as string
		  dim g as FolderItem
		  dim t,k as string
		  
		  System.DebugLog f.NativePath
		  n=f.name
		  if Right(n,4)=".lnk" then
		    s.Location=f.NativePath
		    if s.ResolveShortCut(true,true) then
		      
		      t=s.Target
		      
		      e4=Right(t,4)
		      
		      if e4=".exe" then
		        
		        k=NthField(t,"\",CountFields(t,"\"))
		        
		        dic.Value(k)=n
		      end if
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private dic As dictionary
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
