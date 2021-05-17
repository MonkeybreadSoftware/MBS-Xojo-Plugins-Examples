#tag Class
Protected Class MyCFXMLParser
Inherits CFXMLParserMBS
	#tag Event
		Sub AddChild(parent as CFObjectMBS, child as CFObjectMBS)
		  
		  writeline "---Add Child Called---"
		  writeline "Parent being added to: "+GetCFString(parent)
		  writeline "Child being added: "+GetCFString(child)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function CreateXMLStructure(node as CFXMLNodeMBS) As CFObjectMBS
		  const kCFXMLNodeTypeDocument        = 1
		  const kCFXMLNodeTypeElement         = 2
		  const kCFXMLNodeTypeAttribute       = 3
		  const kCFXMLNodeTypeProcessingInstruction = 4
		  const kCFXMLNodeTypeComment         = 5
		  const kCFXMLNodeTypeText            = 6
		  const kCFXMLNodeTypeCDATASection    = 7
		  const kCFXMLNodeTypeDocumentFragment = 8
		  const kCFXMLNodeTypeEntity          = 9
		  const kCFXMLNodeTypeEntityReference = 10
		  const kCFXMLNodeTypeDocumentType    = 11
		  const kCFXMLNodeTypeWhitespace      = 12
		  const kCFXMLNodeTypeNotation        = 13
		  const kCFXMLNodeTypeElementTypeDeclaration = 14
		  const kCFXMLNodeTypeAttributeListDeclaration = 15
		  
		  
		  dim type as integer
		  dim TypeStr as string
		  dim DataStr as string
		  
		  type=node.TypeCode
		  
		  Select case type
		  case kCFXMLNodeTypeDocument 
		    TypeStr="Data Type ID: kCFXMLNodeTypeDocument"
		    DataStr="Document URL: "+GetNodeDocumentURL(node)
		  case kCFXMLNodeTypeElement 
		    TypeStr="Data Type ID: kCFXMLNodeTypeElement"
		    DataStr="Element: "+GetNodeData(node)
		  case kCFXMLNodeTypeProcessingInstruction 
		    TypeStr="Data Type ID: kCFXMLNodeTypeProcessingInstruction"
		    DataStr="PI: "+GetNodeData(node)
		  case kCFXMLNodeTypeComment  
		    TypeStr="Data Type ID: kCFXMLNodeTypeComment "
		    DataStr="Comment: "+GetNodeData(node)
		  case kCFXMLNodeTypeText   
		    TypeStr="Data Type ID: kCFXMLNodeTypeText"
		    DataStr="Text: "+GetNodeData(node)
		  case kCFXMLNodeTypeCDATASection   
		    TypeStr="Data Type ID: kCFXMLNodeTypeText"
		    DataStr="CDATA: "+GetNodeData(node)
		  case kCFXMLNodeTypeEntityReference    
		    TypeStr="Data Type ID: kCFXMLNodeTypeEntityReference"
		    DataStr="CDATA: "+GetNodeData(node)
		  case kCFXMLNodeTypeWhitespace    
		    TypeStr="Data Type ID: kCFXMLNodeTypeWhitespace"
		    DataStr="Whitespace: "+GetNodeData(node)
		  case kCFXMLNodeTypeEntity    
		    TypeStr="Data Type ID: kCFXMLNodeTypeEntity"
		    DataStr="Entity: "+GetNodeData(node)
		  else
		    TypeStr="Data Type ID: UNKNOWN"
		    DataStr="Data: "+GetNodeData(node)
		  end Select
		  
		  writeline "---Create Structure Called---"
		  writeline TypeStr
		  writeline DataStr
		  
		  // Keep for later Lookup
		  Return NewCFStringMBS(datastr)
		End Function
	#tag EndEvent

	#tag Event
		Sub EndXMLStructure(xmlType as CFObjectMBS)
		  
		  writeline "---End Structure Called for "+GetCFString(xmlType)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function HandleError(StatusCode as integer) As boolean
		  writeline "Parse error ("+str(StatusCode)+") "+me.ErrorDescription.Str+" on line "+str(me.LineNumber)+", character "+str(me.Location)+"."
		End Function
	#tag EndEvent

	#tag Event
		Function ResolveExternalEntity(externalID as CFXMLExternalIDMBS) As CFBinaryDataMBS
		  writeline "---resolveEntity Called---"
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function GetNodeData(node as cfxmlnodeMBS) As string
		  return node.Data.Str
		  
		  Exception // if it fails, it fails here
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetNodeDocumentURL(node as cfxmlnodembs) As string
		  dim docinfo as CFXMLDocumentInfoMBS
		  dim u as CFURLMBS
		  dim s as CFStringMBS
		  
		  docinfo=node.GetCFXMLDocumentInfo
		  
		  u=docinfo.SourceURL
		  if u<>Nil then
		    s=u.str
		    if s<>nil then
		      return s.Str
		    end if
		  end if
		  
		  Exception // if it fails, it doesn't block the whole event
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub writeline(s as string)
		  MainWindow.output=MainWindow.output+s+chr(13)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		d As dictionary
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
