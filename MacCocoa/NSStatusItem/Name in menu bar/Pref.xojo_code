#tag Module
Protected Module Pref
	#tag Method, Flags = &h1
		Protected Sub Load()
		  dim p as CFPreferencesMBS
		  dim o as CFObjectMBS
		  dim b as CFBooleanMBS
		  
		  p=new CFPreferencesMBS
		  
		  o=p.CopyAppValue(NewCFStringMBS("ShortName"),p.kCFPreferencesCurrentApplication)
		  if o isa CFBooleanMBS then
		    b=CFBooleanMBS(o)
		    if b<>nil then
		      myShortName= b.Value
		    end if
		  end if
		  
		  
		  Exception
		    
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Save(key as CFStringMBS, value as CFObjectMBS)
		  dim p as CFPreferencesMBS
		  
		  p=new CFPreferencesMBS
		  
		  p.SetAppValue key,value,p.kCFPreferencesCurrentApplication
		  
		  if p.AppSynchronize(p.kCFPreferencesCurrentApplication)  then
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ShortName() As boolean
		  Return myShortName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ShortName(assigns b as boolean)
		  dim key as CFStringMBS
		  dim value as CFObjectMBS
		  
		  myShortName=b
		  
		  key=NewCFStringMBS("ShortName")
		  value=NewCFBooleanMBS(b)
		  
		  Save key,value
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private myShortName As boolean
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
