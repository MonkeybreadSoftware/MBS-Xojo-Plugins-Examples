#tag Class
Protected Class MyWebUIDelegateMBS
Inherits WebUIDelegateMBS
	#tag Event
		Function MouseDidMoveOverElement(elementInformation as Dictionary, modifierFlags as integer) As boolean
		  dim l as listbox = Window1.List
		  
		  l.DeleteAllRows
		  
		  if elementInformation<>Nil then
		    
		    dim c as integer = elementInformation.Count -1
		    for i as integer = 0 to c
		      dim key as Variant = elementInformation.Key(i)
		      dim value as Variant = elementInformation.Value(key)
		      
		      l.addrow key.StringValue
		      
		      if value isa webFrameMBS then
		        dim w as webFrameMBS = value
		        l.cell(l.LastIndex,1)="Webframe: "+w.name
		      elseif value isa DOMNodeMBS then
		        dim n as DOMNodeMBS = value
		        l.Cell(l.LastIndex,1)="WebElementDOMNode: "+n.localName
		      elseif value isa NSImageMBS then
		        dim im as NSImageMBS = value
		        l.Cell(l.LastIndex,1)="Image: "+str(im.width)+" x "+str(im.height)
		      else
		        l.cell(l.LastIndex,1)=value
		      end if
		      
		      
		      // *** CHANGE WEBVIEW MOUSE CURSOR *** //
		      
		      if key = "WebElementLinkIsLive" then
		        if value = true then
		          Window1.MouseCursor = System.Cursors.FingerPointer
		        else
		          Window1.MouseCursor = System.Cursors.StandardPointer
		        end if
		      end if
		      
		    next
		    
		    
		  end if
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		w As WebFrameMBS
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
