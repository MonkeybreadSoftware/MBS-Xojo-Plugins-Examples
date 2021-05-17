#tag Class
Protected Class RegExMBSMatch_MTC
	#tag Method, Flags = &h0
		Sub Constructor(rx As RegExMBS)
		  zMyRegExMBS = rx
		  
		  zSubExpressionCount = rx.Count
		  dim lastIndex as integer = zSubExpressionCount - 1
		  redim zSubExpressionStartB( lastIndex )
		  redim zSubExpressionEndB( lastIndex )
		  redim zSubExpressionString( lastIndex )
		  dim offsetIndex as integer
		  for i as integer = 0 to lastIndex
		    zSubExpressionStartB( i ) = rx.Offset( offsetIndex )
		    zSubExpressionEndB( i ) = rx.Offset( offsetIndex + 1 )
		    zSubExpressionString( i ) = rx.Substring( i )
		    offSetIndex = offSetIndex + 2
		  next
		  
		  if rx IsA RegExMBSGlue_MTC then
		    zReplacementPattern = RegExMBSGlue_MTC( rx ).ReplacementPattern
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pRaiseNilObjectException(msg As String, code As Integer = 0)
		  dim err as new NilObjectException
		  err.ErrorNumber = code
		  err.Message = msg
		  raise err
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pRaiseRegExException(msg As String, code As Integer = 0)
		  dim err as new RegExException
		  err.ErrorNumber = code
		  err.Message = msg
		  raise err
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Replace() As String
		  // See comments in other Replace.
		  // This is a different call because it expects the Replacement Pattern to be take from the parent
		  // RegExMBSGlue_MTC object.
		  
		  if zMyRegExMBS is nil or not ( zMyRegExMBS isA RegExMBSGlue_MTC ) then
		    pRaiseRegExException( "The replacement pattern must be specified." )
		  end if
		  return me.Replace( zReplacementPattern )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Replace(replacementPattern As String) As String
		  // Not a perfect substitute because it must be used before the next execute, the results will be arbitrary.
		  
		  dim rx as RegExMBS = zMyRegExMBS
		  if rx is nil then
		    pRaiseNilObjectException( "The parent RegExMBS object no longer exists." )
		  end if
		  if rx.Count <> zSubExpressionCount or _
		    rx.Offset( 0 ) <> zSubExpressionStartB( 0 ) or _
		    StrComp( rx.Substring( 0 ), zSubExpressionString( 0 ), 0 ) <> 0 then
		    pRaiseRegExException( "Replace must be used before Execute is called again in the parent RegExMBS." )
		  end if
		  
		  dim r as string = rx.ReplaceSelection( replacementPattern )
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SubExpressionCount() As Integer
		  return zSubExpressionCount
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SubExpressionEndB(index As Integer) As Integer
		  return zSubExpressionEndB( index )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SubExpressionStartB(index As Integer) As Integer
		  return zSubExpressionStartB( index )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SubExpressionString(index As Integer) As String
		  return zSubExpressionString( index )
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private zMyRegExMBS As RegExMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zReplacementPattern As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zSubExpressionCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zSubExpressionEndB() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zSubExpressionStartB() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zSubExpressionString() As String
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
End Class
#tag EndClass
