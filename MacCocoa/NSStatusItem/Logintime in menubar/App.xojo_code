#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Close()
		  if s<>nil then
		    s.Close
		    DelayMBS 0.2 // wait for events to flush
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  dim f as FolderItem
		  dim t as String
		  
		  s=new NSStatusItemMBS
		  
		  t=GetLoginTimeString
		  if t="" then
		    quit
		  end if
		  
		  // Create statusitem
		  call s.CreateMenu
		  s.Title=t
		  
		  Exception
		    
		    quit
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function GetLoginTimeString() As string
		  dim p as ProcessMBS
		  dim d as CFDictionaryMBS
		  dim cd as CFDateMBS
		  dim co as CFObjectMBS
		  dim g as CFGregorianDateMBS
		  
		  p=GetSystemUIServer
		  
		  d=cfdictionarymbs(p.ProcessInformationCFDictionary)
		  
		  co=d.Value(NewCFStringMBS("LSLaunchTime"))
		  if co = nil then
		    co = d.Value(NewCFStringMBS("LSCheckInTime*"))
		  end if
		  
		  cd=new CFDateMBS
		  cd.Handle=co.Handle
		  cd.RetainObject
		  
		  g=cd.AbsoluteTime.GregorianDate(SystemCFTimeZoneMBS)
		  
		  return Format(g.Hour,"0")+":"+Format(g.Minute,"00")
		  
		  Exception
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSystemUIServer() As ProcessMBS
		  dim p as ProcessMBS
		  dim m as MemoryBlock
		  
		  p=new ProcessMBS
		  
		  p.GetFirstProcess
		  if p.Name="SystemUIServer" then
		    Return p
		  end if
		  
		  while p.GetNextProcess
		    if p.Name="SystemUIServer" then
		      Return p
		    end if
		  wend
		  
		  Exception
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		last As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected s As NSStatusItemMBS
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="last"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
