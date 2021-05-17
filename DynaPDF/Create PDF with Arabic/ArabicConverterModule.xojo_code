#tag Module
Protected Module ArabicConverterModule
	#tag Method, Flags = &h21
		Private Function CharacterMapContains(c as integer) As Boolean
		  for each ch as charRep in charsMap
		    if ch.code = c then
		      Return true
		    end if
		  next
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Convert(s as string) As string
		  Init
		  
		  dim result as string
		  dim normal as string = ConvertEncoding(s, encodings.UTF16)
		  
		  dim len as integer = len(normal)
		  for i as integer = 1 to len
		    dim current as integer = asc(mid(normal, i, 1))
		    
		    if CharacterMapContains(current) then
		      dim prevChar, nextChar as integer
		      dim prevID as integer = i - 1
		      dim nextID as integer = i + 1
		      dim crep as CharRep
		      
		      // Transparent characters have no effect in the shaping process.
		      // So, ignore all the transparent characters that are BEFORE the
		      // current character.
		      
		      while (prevID >= 1)
		        dim c as integer = asc(mid(normal, prevID, 1))
		        if not IsTransparent(c) then
		          exit
		        end if
		        prevID = prevID - 1 
		      wend
		      
		      prevChar = asc(mid(normal, prevID, 1))
		      crep = GetCharRep(prevChar)
		      
		      if ((prevID < 1) or (not CharacterMapContains(prevChar)) or (not (crep.Initial <> 0) and not (crep.Medial <> 0))) then
		        prevChar = 0
		      end if
		      
		      // Transparent characters have no effect in the shaping process.
		      // So, ignore all the transparent characters that are AFTER the
		      // current character.
		      
		      while nextID <= len
		        dim c as integer = asc(mid(normal, nextID, 1))
		        if not IsTransparent(c) then
		          exit
		        end if
		        nextID = nextID + 1
		      wend
		      
		      nextChar = asc(mid(normal, nextID, 1))
		      crep = GetCharRep(nextChar)
		      
		      if ((nextID > len) or not CharacterMapContains(nextChar) or (not (crep.Medial <> 0) and not (crep.Final <> 0) and (nextChar <> &h0640))) then
		        nextChar = 0
		      end if
		      
		      // Combinations 
		      
		      if (current = &h0644 and nextChar <> 0 and (nextChar = &h0622 or nextChar = &h0623 or nextChar = &h0625 or nextChar = &h0627)) then
		        
		        dim combcrep as CombCharRep = GetCombCharRep(current, nextChar)
		        if prevChar <> 0 then
		          result = result + encodings.UTF16.chr(combcrep.Final)
		        else
		          result = result + encodings.UTF16.chr(combcrep.Isolated)
		        end if
		        i = i + 1
		        continue
		      end if
		      
		      crep = GetCharRep(current)
		      
		      // Medial 
		      if (prevChar <> 0 and nextChar <> 0 and crep.Medial <> 0) then
		        
		        result = result + encodings.UTF16.chr( crep.Medial)
		        continue
		        
		        // Final 
		        
		      elseif (prevChar <> 0 and crep.Final <> 0) then
		        
		        result = result + encodings.UTF16.chr( crep.Final)
		        continue
		        // Initial 
		        
		      elseif (nextChar <> 0 and crep.Initial <> 0) then
		        
		        result = result + encodings.UTF16.chr( crep.Initial)
		        continue
		      end if
		      // Isolated 
		      result = result + encodings.UTF16.chr( crep.Isolated)
		      
		    else
		      
		      result = result + encodings.UTF16.chr(current)
		    end if
		    
		    
		  next
		  
		  Return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetCharRep(c as integer) As charRep
		  for each ch as CharRep in charsMap
		    if ch.Code = c then
		      Return ch
		    end if
		  next
		  
		  // return dummy one
		  static n as new CharRep
		  Return n
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetCombCharRep(c0 as integer, c1 as integer) As CombCharRep
		  for each ch as CombCharRep in combCharsMap
		    if ch.Code0 = c0 and ch.Code1 = C1 then
		      Return ch
		    end if
		  next
		  
		  // return dummy
		  static n as new CombCharRep
		  Return n
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Init()
		  if inited then Return
		  inited = true
		  
		  charsMap.Append new CharRep( &h0621, &hFE80, 0, 0, 0 ) // HAMZA 
		  charsMap.Append new CharRep( &h0622, &hFE81, 0, 0, &hFE82 ) // ALEF_MADDA 
		  charsMap.Append new CharRep( &h0623, &hFE83, 0, 0, &hFE84 ) // ALEF_HAMZA_ABOVE 
		  charsMap.Append new CharRep( &h0624, &hFE85, 0, 0, &hFE86 ) // WAW_HAMZA 
		  charsMap.Append new CharRep( &h0625, &hFE87, 0, 0, &hFE88 ) // ALEF_HAMZA_BELOW 
		  charsMap.Append new CharRep( &h0626, &hFE89, &hFE8B, &hFE8C, &hFE8A ) // YEH_HAMZA 
		  charsMap.Append new CharRep( &h0627, &hFE8D, 0, 0, &hFE8E ) // ALEF 
		  charsMap.Append new CharRep( &h0628, &hFE8F, &hFE91, &hFE92, &hFE90 ) // BEH 
		  charsMap.Append new CharRep( &h0629, &hFE93, 0, 0, &hFE94 ) // TEH_MARBUTA 
		  charsMap.Append new CharRep( &h062A, &hFE95, &hFE97, &hFE98, &hFE96 ) // TEH 
		  charsMap.Append new CharRep( &h062B, &hFE99, &hFE9B, &hFE9C, &hFE9A ) // THEH 
		  charsMap.Append new CharRep( &h062C, &hFE9D, &hFE9F, &hFEA0, &hFE9E ) // JEEM 
		  charsMap.Append new CharRep( &h062D, &hFEA1, &hFEA3, &hFEA4, &hFEA2 ) // HAH 
		  charsMap.Append new CharRep( &h062E, &hFEA5, &hFEA7, &hFEA8, &hFEA6 ) // KHAH 
		  charsMap.Append new CharRep( &h062F, &hFEA9, 0, 0, &hFEAA ) // DAL 
		  charsMap.Append new CharRep( &h0630, &hFEAB, 0, 0, &hFEAC ) // THAL 
		  charsMap.Append new CharRep( &h0631, &hFEAD, 0, 0, &hFEAE ) // REH 
		  charsMap.Append new CharRep( &h0632, &hFEAF, 0, 0, &hFEB0 ) // ZAIN 
		  charsMap.Append new CharRep( &h0633, &hFEB1, &hFEB3, &hFEB4, &hFEB2 ) // SEEN 
		  charsMap.Append new CharRep( &h0634, &hFEB5, &hFEB7, &hFEB8, &hFEB6 ) // SHEEN 
		  charsMap.Append new CharRep( &h0635, &hFEB9, &hFEBB, &hFEBC, &hFEBA ) // SAD 
		  charsMap.Append new CharRep( &h0636, &hFEBD, &hFEBF, &hFEC0, &hFEBE ) // DAD 
		  charsMap.Append new CharRep( &h0637, &hFEC1, &hFEC3, &hFEC4, &hFEC2 ) // TAH 
		  charsMap.Append new CharRep( &h0638, &hFEC5, &hFEC7, &hFEC8, &hFEC6 ) // ZAH 
		  charsMap.Append new CharRep( &h0639, &hFEC9, &hFECB, &hFECC, &hFECA ) // AIN 
		  charsMap.Append new CharRep( &h063A, &hFECD, &hFECF, &hFED0, &hFECE ) // GHAIN 
		  charsMap.Append new CharRep( &h0640, &h0640, 0, 0, 0 ) // TATWEEL 
		  charsMap.Append new CharRep( &h0641, &hFED1, &hFED3, &hFED4, &hFED2 ) // FEH 
		  charsMap.Append new CharRep( &h0642, &hFED5, &hFED7, &hFED8, &hFED6 ) // QAF 
		  charsMap.Append new CharRep( &h0643, &hFED9, &hFEDB, &hFEDC, &hFEDA ) // KAF 
		  charsMap.Append new CharRep( &h0644, &hFEDD, &hFEDF, &hFEE0, &hFEDE ) // LAM 
		  charsMap.Append new CharRep( &h0645, &hFEE1, &hFEE3, &hFEE4, &hFEE2 ) // MEEM 
		  charsMap.Append new CharRep( &h0646, &hFEE5, &hFEE7, &hFEE8, &hFEE6 ) // NOON 
		  charsMap.Append new CharRep( &h0647, &hFEE9, &hFEEB, &hFEEC, &hFEEA ) // HEH 
		  charsMap.Append new CharRep( &h0648, &hFEED, 0, 0, &hFEEE ) // WAW 
		  //charsMap.Append new CharRep( &h0649, &hFEEF, &hFBE8, &hFBE9, &hFEF0 )    // ALEF_MAKSURA 
		  charsMap.Append new CharRep( &h0649, &hFEEF, 0, 0, &hFEF0 ) // ALEF_MAKSURA 
		  charsMap.Append new CharRep( &h064A, &hFEF1, &hFEF3, &hFEF4, &hFEF2 ) // YEH 
		  
		  
		  combCharsMap.Append new CombCharRep( &h0644, &h0622, &hFEF5, 0, 0, &hFEF6 ) // LAM_ALEF_MADDA 
		  combCharsMap.Append new CombCharRep( &h0644, &h0623, &hFEF7, 0, 0, &hFEF8 ) // LAM_ALEF_HAMZA_ABOVE 
		  combCharsMap.Append new CombCharRep( &h0644, &h0625, &hFEF9, 0, 0, &hFEFA ) // LAM_ALEF_HAMZA_BELOW 
		  combCharsMap.Append new CombCharRep( &h0644, &h0627, &hFEFB, 0, 0, &hFEFC ) // LAM_ALEF 
		  
		  
		  transChars = new Dictionary
		  
		  transChars.value(&h0610) = nil  //  ARABIC SIGN SALLALLAHOU ALAYHE WASSALLAM
		  transChars.value(&h0612) = nil  //  ARABIC SIGN ALAYHE ASSALLAM
		  transChars.value(&h0613) = nil  //  ARABIC SIGN RADI ALLAHOU ANHU
		  transChars.value(&h0614) = nil  //  ARABIC SIGN TAKHALLUS
		  transChars.value(&h0615) = nil  //  ARABIC SMALL HIGH TAH
		  transChars.value(&h064B) = nil  //  ARABIC FATHATAN
		  transChars.value(&h064C) = nil  //  ARABIC DAMMATAN
		  transChars.value(&h064D) = nil  //  ARABIC KASRATAN
		  transChars.value(&h064E) = nil  //  ARABIC FATHA
		  transChars.value(&h064F) = nil  //  ARABIC DAMMA
		  transChars.value(&h0650) = nil  //  ARABIC KASRA
		  transChars.value(&h0651) = nil  //  ARABIC SHADDA
		  transChars.value(&h0652) = nil  //  ARABIC SUKUN
		  transChars.value(&h0653) = nil  //  ARABIC MADDAH ABOVE
		  transChars.value(&h0654) = nil  //  ARABIC HAMZA ABOVE
		  transChars.value(&h0655) = nil  //  ARABIC HAMZA BELOW
		  transChars.value(&h0656) = nil  //  ARABIC SUBSCRIPT ALEF
		  transChars.value(&h0657) = nil  //  ARABIC INVERTED DAMMA
		  transChars.value(&h0658) = nil  //  ARABIC MARK NOON GHUNNA
		  transChars.value(&h0670) = nil  //  ARABIC LETTER SUPERSCRIPT ALEF
		  transChars.value(&h06D6) = nil  //  ARABIC SMALL HIGH LIGATURE SAD WITH LAM WITH ALEF MAKSURA
		  transChars.value(&h06D7) = nil  //  ARABIC SMALL HIGH LIGATURE QAF WITH LAM WITH ALEF MAKSURA
		  transChars.value(&h06D8) = nil  //  ARABIC SMALL HIGH MEEM INITIAL FORM
		  transChars.value(&h06D9) = nil  //  ARABIC SMALL HIGH LAM ALEF
		  transChars.value(&h06DA) = nil  //  ARABIC SMALL HIGH JEEM
		  transChars.value(&h06DB) = nil  //  ARABIC SMALL HIGH THREE DOTS
		  transChars.value(&h06DC) = nil  //  ARABIC SMALL HIGH SEEN
		  transChars.value(&h06DF) = nil  //  ARABIC SMALL HIGH ROUNDED ZERO
		  transChars.value(&h06E0) = nil  //  ARABIC SMALL HIGH UPRIGHT RECTANGULAR ZERO
		  transChars.value(&h06E1) = nil  //  ARABIC SMALL HIGH DOTLESS HEAD OF KHAH
		  transChars.value(&h06E2) = nil  //  ARABIC SMALL HIGH MEEM ISOLATED FORM
		  transChars.value(&h06E3) = nil  //  ARABIC SMALL LOW SEEN
		  transChars.value(&h06E4) = nil  //  ARABIC SMALL HIGH MADDA
		  transChars.value(&h06E7) = nil  //  ARABIC SMALL HIGH YEH
		  transChars.value(&h06E8) = nil  //  ARABIC SMALL HIGH NOON
		  transChars.value(&h06EA) = nil  //  ARABIC EMPTY CENTRE LOW STOP
		  transChars.value(&h06EB) = nil  //  ARABIC EMPTY CENTRE HIGH STOP
		  transChars.value(&h06EC) = nil  //  ARABIC ROUNDED HIGH STOP WITH FILLED CENTRE
		  transChars.value(&h06ED) = nil  //  ARABIC SMALL LOW MEEM
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsTransparent(c as integer) As Boolean
		  Return transChars.HasKey(c)
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Note
		based on
		https://github.com/Accorpa/Arabic-Converter-From-and-To-Arabic-Presentation-Forms-B
		
		but we give you this code with BSD license.
		
		
		
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private charsMap() As CharRep
	#tag EndProperty

	#tag Property, Flags = &h21
		Private combCharsMap() As CombCharRep
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Inited As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private transChars As Dictionary
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
