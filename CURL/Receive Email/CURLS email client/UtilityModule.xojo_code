#tag Module
Protected Module UtilityModule
	#tag Method, Flags = &h0
		Function FromLabel(extends e as MimeEmailMBS) As string
		  dim h as MimeHeaderMBS = e.Header
		  dim f as MimeMailboxListMBS = h.from
		  
		  if f <> nil then
		    dim Mailboxes() as MimeMailboxMBS = f.Mailboxes
		    
		    for each m as MimeMailboxMBS in Mailboxes
		      dim l as string = m.LabelDecoded
		      if l = "" then
		        l = m.Email
		      end if
		      
		      return l
		    next
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToLabel(extends e as MimeEmailMBS) As string
		  dim h as MimeHeaderMBS = e.Header
		  dim f as MimeAddressListMBS = h.too
		  dim parts() as string
		  
		  if f <> nil then
		    dim Addresses() as MimeAddressMBS = f.Addresses
		    
		    for each a as MimeAddressMBS in Addresses
		      dim g as MimeGroupMBS = a.Group
		      
		      if g <> nil then
		        parts.Append g.NameDecoded
		      else
		        dim m as MimeMailboxMBS = a.Mailbox
		        if m <> nil then
		          dim s as string = m.LabelDecoded
		          if s = "" then
		            s = m.Email
		          end if
		          
		          parts.Append s
		        end if
		      end if
		    next
		  end if
		  
		  Return Join(parts, ", ")
		  
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
