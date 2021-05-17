#tag Module
Protected Module TextAreaModule
	#tag Method, Flags = &h0
		Function SelStrikeOut(extends t as TextArea) As Boolean
		  #if TargetWin32 then
		    
		    // for Windows
		    
		    return t.WinSelStrikeOutMBS
		    
		  #elseif TargetCocoa then
		    
		    // for Mac
		    
		    dim n as NSTextViewMBS = t.NSTextViewMBS
		    dim s as NSTextStorageMBS = n.textStorage
		    
		    // and for typing
		    dim att as Dictionary = n.typingAttributes
		    return att.lookup( NSAttributedStringMBS.NSStrikethroughStyleAttributeName, 0) <> 0
		    
		  #else
		    break // not supported
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelStrikeOut(extends t as TextArea, assigns value as Boolean)
		  #if TargetWin32 then
		    
		    // for Windows
		    
		    t.WinSelStrikeOutMBS = value
		    
		  #elseif TargetCocoa then
		    
		    // for Mac
		    
		    dim n as NSTextViewMBS = t.NSTextViewMBS
		    dim s as NSTextStorageMBS = n.textStorage
		    dim range as new NSRangeMBS( t.SelStart,t.SelLength )
		     
		    // change it for selection
		    if range.length > 0 then
		      if value then
		        s.addAttribute(NSAttributedStringMBS.NSStrikethroughStyleAttributeName, 1, range)
		      else
		        s.addAttribute(NSAttributedStringMBS.NSStrikethroughStyleAttributeName, 0, range)
		      end if
		    end if
		    
		    // and for typing
		    dim att as Dictionary = n.typingAttributes
		    dim v as integer
		    if value then
		      v = 1
		    else
		      v = 0
		    end if
		    att.Value( NSAttributedStringMBS.NSStrikethroughStyleAttributeName ) = v
		    n.typingAttributes = att
		    
		  #else
		    break // not supported
		  #endif
		  
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
