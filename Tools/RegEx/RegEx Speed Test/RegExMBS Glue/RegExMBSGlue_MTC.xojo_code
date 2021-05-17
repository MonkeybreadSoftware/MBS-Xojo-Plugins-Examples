#tag Class
Protected Class RegExMBSGlue_MTC
Inherits RegExMBS
	#tag Method, Flags = &h21
		Private Sub pCompareOptionsToMyOptions()
		  // Compares zOptions and, if they are different, sets zNeedsCompile to true
		  
		  if zNeedsCompile then return // Already needs to be compiled
		  
		  if zOptions is nil then
		    pSetDefaultOptions
		  else
		    zNeedsCompile = true // Assume this
		    
		    // This gets a little confusing since some of the RegExMBS options are opposite of the RegExOptions.
		    // For example, if me.CompileOptionUngreedy = RegExOptions.Greedy, they are actually different.
		    select case true
		    case zOptions.CaseSensitive = me.CompileOptionCaseLess
		    case zOptions.DotMatchAll <> me.CompileOptionDotAll
		    case zOptions.Greedy = me.CompileOptionUngreedy
		    case zOptions.MatchEmpty = me.ExecuteOptionNotEmpty
		    case zOptions.TreatTargetAsOneLine = me.CompileOptionMultiline
		    else
		      zNeedsCompile = false
		    end select // true
		    
		  end if // zOptions is nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pDoCompile()
		  pCompareOptionsToMyOptions()
		  if zNeedsCompile then
		    pSetMyOptionsFromRegExOptions()
		    if not me.Compile( searchPattern ) or not me.Study() then
		      pRaiseRegExSearchPatternException( me.ErrorMessage, me.Lasterror )
		      return
		    end if
		    
		    zNeedsCompile = false
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pRaiseRegExSearchPatternException(msg As String, code As Integer = 0)
		  dim err as new RegExSearchPatternException
		  err.Message = msg
		  err.ErrorNumber = code
		  raise err
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pSetDefaultOptions()
		  dim rx as new RegEx
		  zOptions = rx.Options
		  zNeedsCompile = true
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pSetMyOptionsFromRegExOptions()
		  if zOptions is nil then pSetDefaultOptions
		  
		  me.CompileOptionAnchored = false
		  me.CompileOptionBSRUnicode = true
		  me.CompileOptionCaseLess = not zOptions.CaseSensitive
		  me.CompileOptionDotAll = zOptions.DotMatchAll
		  me.CompileOptionMultiline = not zOptions.TreatTargetAsOneLine
		  me.CompileOptionUngreedy = not zOptions.Greedy
		  me.ExecuteOptionNotEmpty = not zOptions.MatchEmpty
		  // No equivalents for StringBeginIsLineBegin and StringEndIsLineEnd
		  
		  dim lineEndType as integer = zOptions.LineEndType
		  if lineEndType = 1 then // Default for platform
		    dim eol as string = EndOfLine
		    if eol = EndOfLine.Windows then
		      lineEndType = 3
		    elseif eol = EndOfLine.Macintosh then
		      lineEndType = 2
		    else // Unix
		      lineEndType = 4
		    end if
		  end if
		  
		  select case lineEndType
		  case 0
		    me.CompileOptionNewLineAnyCRLF = true
		  case 2
		    me.CompileOptionNewLineCR = true
		  case 3
		    me.CompileOptionNewLineCRLF = true
		  case 4
		    me.CompileOptionNewLineLF = true
		  end select
		  
		  // Some additional stuff
		  me.CompileOptionUTF8 = true
		  me.CompileOptionNoUTF8Check = true
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Replace() As String
		  return me.Replace( zTargetString, SearchStartPosition )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Replace(targetString As String) As String
		  return me.Replace( targetString, SearchStartPosition )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Replace(targetString As String, startPosition As Integer = 0) As String
		  dim r as string
		  
		  if startPosition < 0 then startPosition = 0
		  pDoCompile()
		  if zNeedsCompile then return ""
		  
		  if Options.ReplaceAllMatches then
		    
		    r = me.ReplaceAll( targetString, ReplacementPattern )
		    if me.Lasterror <> 0 then
		      r = ""
		      pRaiseRegExSearchPatternException( me.ErrorMessage, me.Lasterror )
		    end if
		    
		  else
		    
		    dim offset as integer = me.Execute( targetString, startPosition )
		    if offset = 0 then
		      r = targetString
		    else
		      r = super.Replace( ReplacementPattern )
		      if me.Lasterror <> 0 then
		        r = ""
		        pRaiseRegExSearchPatternException( me.ErrorMessage, me.Lasterror )
		      end if
		    end if
		    SearchStartPosition = startPosition
		    
		  end if
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Search() As RegExMBSMatch_MTC
		  return me.Search( zTargetString, SearchStartPosition )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Search(startPosition As Integer) As RegExMBSMatch_MTC
		  return me.Search( zTargetString, startPosition )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Search(targetString As String, startPosition As Integer = 0) As RegExMBSMatch_MTC
		  if startPosition < 0 then startPosition = 0
		  
		  pDoCompile()
		  if zNeedsCompile then return nil
		  
		  zTargetString = targetString
		  SearchStartPosition = startPosition
		  dim err as integer = me.Execute( targetString, startPosition )
		  if err < 0 then
		    pRaiseRegExSearchPatternException( me.ErrorMessage, err )
		    return nil
		  elseif err = 0 then
		    return nil
		  else
		    SearchStartPosition = me.Offset( 1 ) + 1
		    return new RegExMBSMatch_MTC( me )
		  end if
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if zOptions = nil then
			    pSetDefaultOptions
			  end if
			  return zOptions
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value = nil then
			    pSetDefaultOptions
			  else
			    zOptions = value
			    // When search is called, if the options are different, will recompile
			  end if
			  
			End Set
		#tag EndSetter
		Options As RegExOptions
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return zReplacementPattern
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  zReplacementPattern = value.ConvertEncoding( Encodings.UTF8 )
			  
			End Set
		#tag EndSetter
		ReplacementPattern As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return zSearchPattern
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  value = value.ConvertEncoding( Encodings.UTF8 )
			  if StrComp( value, zSearchPattern, 0 ) <> 0 then
			    zSearchPattern = value
			    zNeedsCompile = true
			  end if
			  
			End Set
		#tag EndSetter
		SearchPattern As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return zSearchStartPosition
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value < 0 then value = 0
			  zSearchStartPosition = value
			  
			End Set
		#tag EndSetter
		SearchStartPosition As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private zNeedsCompile As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zOptions As RegExOptions
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zReplacementPattern As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zSearchPattern As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zSearchStartPosition As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zTargetString As String
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
		#tag ViewProperty
			Name="SearchPattern"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReplacementPattern"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SearchStartPosition"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
