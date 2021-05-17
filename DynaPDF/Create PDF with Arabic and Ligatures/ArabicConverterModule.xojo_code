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
		Function Convert(s as string) As Integer()
		  Init
		  
		  dim result() as integer
		  dim normal as string = ConvertEncoding(s, encodings.UTF16)
		  dim prevNum as integer
		  dim j as integer
		  dim len as integer = len(normal)
		  
		  for i as integer = 1 To len
		    dim current as integer = asc(mid(normal, i, 1))
		    
		    if CharacterMapContains(current) then
		      dim prevChar, nextChar as integer
		      dim prevID as integer = i - 1
		      dim nextID as integer = i + 1
		      dim crep as CharRep
		      
		      prevNum = 0
		      j = 0
		      
		      // Transparent characters have no effect in the shaping process.
		      // So, ignore all the transparent characters that are BEFORE the current character.
		      
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
		      // So, ignore all the transparent characters that are AFTER the current character.
		      
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
		      
		      // Special case ligature Allah
		      if current = &h0627 and nextChar = &h0644 then
		        if nextID + 2 <= len and asc(mid(normal, nextID + 1, 1)) = &h0644 and asc(mid(normal, nextID + 2, 1)) = &h0647 then 
		          if nextID + 2 = len or asc(mid(normal, nextID + 3, 1)) = &h0020 then
		            if pdf.TestGlyphs(hFont, chr(&hFDF2)) = -1 then
		              
		              result.Insert(0, &hFDF2)
		              i = i + 3
		              continue
		            end if
		          end if
		        end if
		      end if
		      
		      // Combinations
		      if inStr( "644 628 62A 62B 62C 62D 62E 646 64A 641 645", hex(current)) > 0 and nextChar <> 0 then
		        
		        dim combcrep as CombCharRep = GetCombCharRep(current, nextChar)
		        dim follChar as integer = asc(mid(normal, nextID + 1, 1))
		        dim follcrep as CharRep = GetCharRep(follChar)
		        
		        if ((nextID + 1 > len) or not CharacterMapContains(follChar) or (not (follcrep.Medial <> 0) and not (follcrep.Final <> 0) and (follChar <> &h0640))) then
		          follChar = 0
		        end if
		        
		        if current = &h0644 and inStr("622 623 625 627 649 64A", hex(nextChar)) > 0 then // §
		          if prevChar <> 0 then
		            
		            if pdf.TestGlyphs(hFont, chr(combcrep.Final)) = -1 then
		              
		              result.Insert(0, combcrep.Final)
		              i = i + 1
		              continue
		            end if
		          else
		            
		            if pdf.TestGlyphs(hFont, chr(combcrep.Isolated)) = -1 then
		              
		              result.Insert(0, combcrep.Isolated)
		              i = i + 1
		              continue
		            end if
		          end if
		          
		        elseif prevChar = 0 and (nextChar = &h0645 and inStr("628 62A 62B 644 646", hex(current)) > 0) or  (current = &h0646 and nextChar = &h062C) or _
		          ((current = &h062A or current = &h0644) and inStr("62C 62D 62E", hex(nextChar)) > 0) then // †
		          
		          if current = &h0644 and nextChar = &h0645 and nextID + 2 <= len and asc(mid(normal, nextID + 1, 1)) = &h062D then  // Handle triple ligatures ALEF + LAM + ?
		            
		            if nextID + 1 = len or not CharacterMapContains(asc(mid(normal, nextID + 2, 1))) then
		              if pdf.TestGlyphs(hFont, chr(combcrep.Initial)) = -1 then
		                
		                result.Insert(0, combcrep.Initial)
		                result.Insert(0, &hFEA2)
		              else
		                
		                result.Insert(0, &hFEDF)
		                result.Insert(0, &hFEE4)
		                result.Insert(0, &hFEA2)
		              end if
		              
		            else
		              if pdf.TestGlyphs(hFont, chr(&hFD88)) = -1 then
		                
		                result.Insert(0, &hFD88)
		              elseif pdf.TestGlyphs(hFont, chr(combcrep.Initial)) = -1 then
		                
		                result.Insert(0, combcrep.Initial)
		                result.Insert(0, &hFEA4)
		              else
		                
		                result.Insert(0, &hFEDF)
		                result.Insert(0, &hFEE4)
		                result.Insert(0, &hFEA4)
		              end if
		            end if
		            
		            i = i + 2
		            continue
		            
		          else
		            
		            if follChar <> 0 then
		              if pdf.TestGlyphs(hFont, chr(combcrep.Initial)) = -1 then
		                
		                result.Insert(0, combcrep.Initial)
		                i = i + 1
		                continue
		              end if
		            else
		              if pdf.TestGlyphs(hFont, chr(combcrep.Isolated)) = -1 then
		                
		                result.Insert(0, combcrep.Isolated)
		                i = i + 1
		                continue
		              end if
		            end if
		          end if
		          
		        elseif prevChar = 0 and follChar <> 0 and (((current = &h628 or current = &h646) and inStr("62D 62E", hex(nextChar)) > 0) or _
		          (nextChar = &h645 and inStr("62C 62D 62E", hex(current)) > 0) or (current = &h062A and nextChar = &h062E) or _
		          (current = &h0649 and nextChar = &h064A) or (current = &h628 and nextChar=&h62C)) then // ¶
		          
		          if pdf.TestGlyphs(hFont, chr(combcrep.Initial)) = -1 then
		            
		            result.Insert(0, combcrep.Initial)
		            i = i + 1
		            continue
		          end if
		          
		        elseif prevChar = 0 and follChar = 0 and current = &h0641 and (nextChar =  &h0649 or nextChar =  &h064A) then // ∆
		          
		          if pdf.TestGlyphs(hFont, chr(combcrep.Isolated)) = -1 then
		            
		            result.Insert(0, combcrep.Isolated)
		            i = i + 1
		            continue
		          end if
		          
		        elseif prevChar <> 0 and follChar = 0 and ((nextChar = &h0646 or nextChar = &h0631) and inStr("628 62A 64A", hex(current)) > 0) or _
		           (current = &h0646 and nextChar = &h0646) then // #
		          
		          if pdf.TestGlyphs(hFont, chr(combcrep.Final)) = -1 then
		            
		            result.Insert(0, combcrep.Final)
		            i = i + 1
		            continue
		          end if
		          
		        end if
		        
		      end if
		      
		      crep = GetCharRep(current)
		      
		      // Medial
		      if (prevChar <> 0 and nextChar <> 0 and crep.Medial <> 0) then
		        
		        result.Insert(0, crep.Medial)
		        continue
		        
		        // Final
		        
		      elseif (prevChar <> 0 and crep.Final <> 0) then
		        
		        result.Insert(0, crep.Final)
		        continue
		        // Initial
		        
		      elseif (nextChar <> 0 and crep.Initial <> 0) then
		        
		        result.Insert(0, crep.Initial)
		        continue
		      end if
		      
		      // Isolated
		      if pdf.TestGlyphs(hFont, chr(crep.Isolated)) = -1 then
		        
		        result.Insert(0, crep.Isolated)
		      else
		        
		        result.Insert(0, current)
		      end if
		      
		      // Numerals
		    elseif (current >= &h0660 and current <= &h066D) then
		      
		      if  prevNum >= &h0660 and prevNum <= &h066D then
		        
		        result.Insert(j, current)
		        
		      else
		        
		        result.Insert(0, current)
		      end if
		      
		      prevNum = current
		      j = j + 1
		      
		    else
		      
		      result.Insert(0, current)
		      prevNum = 0
		      j = 0
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
		  charsMap.Append new CharRep( &h0649, &hFEEF, 0, 0, &hFEF0 ) // ALEF_MAKSURA 
		  charsMap.Append new CharRep( &h064A, &hFEF1, &hFEF3, &hFEF4, &hFEF2 ) // YEH 
		  
		  
		  combCharsMap.Append new CombCharRep( &h0644, &h0622, &hFEF5, 0, 0, &hFEF6 ) // LAM + ALEF_MADDA §
		  combCharsMap.Append new CombCharRep( &h0644, &h0623, &hFEF7, 0, 0, &hFEF8 ) // LAM + ALEF_HAMZA_ABOVE §
		  combCharsMap.Append new CombCharRep( &h0644, &h0625, &hFEF9, 0, 0, &hFEFA ) // LAM + ALEF_HAMZA_BELOW §
		  combCharsMap.Append new CombCharRep( &h0644, &h0627, &hFEFB, 0, 0, &hFEFC ) // LAM + ALEF §
		  
		  // ADDITIONAL LIGATURES AVAILABLE IN SOME FONTS ONLY
		  combCharsMap.Append new CombCharRep( &h0644, &h0649, &hFC43, 0, 0, &hFC86 ) // LAM + ALEF_MAKSURA §
		  combCharsMap.Append new CombCharRep( &h0644, &h064A, &hFC44, 0, 0, &hFC87 ) // LAM + YEH §
		  
		  combCharsMap.Append new CombCharRep( &h0628, &h0645, &hFC08, &hFC9F, 0, 0 ) // BEH + MEEM †
		  combCharsMap.Append new CombCharRep( &h062A, &h062C, &hFC0B, &hFCA1, 0, 0 ) // TEH + JEEM †
		  combCharsMap.Append new CombCharRep( &h062A, &h062D, &hFC0C, &hFCA2, 0, 0 ) // TEH + HAH †
		  combCharsMap.Append new CombCharRep( &h062A, &h0645, &hFC0E, &hFCA4, 0, 0 ) // TEH + MEEM †
		  combCharsMap.Append new CombCharRep( &h062B, &h0645, &hFC12, &hFCA6, 0, 0 ) // THEH + MEEM †
		  combCharsMap.Append new CombCharRep( &h0644, &h062C, &hFC3F, &hFCC9, 0, 0 ) // LAM + JEEM †
		  combCharsMap.Append new CombCharRep( &h0644, &h062D, &hFC40, &hFCCA, 0, 0 ) // LAM + HAH †
		  combCharsMap.Append new CombCharRep( &h0644, &h062E, &hFC41, &hFCCB, 0, 0 ) // LAM + KHAH †
		  combCharsMap.Append new CombCharRep( &h0644, &h0645, &hFC42, &hFCCC, 0, 0 ) // LAM + MEEM †
		  combCharsMap.Append new CombCharRep( &h0645, &h0645, &hFC48, &hFCD1, 0, 0 ) // MEEM + MEEM †
		  combCharsMap.Append new CombCharRep( &h0646, &h062C, &hFC4B, &hFCD2, 0, 0 ) // NOON + JEEM †
		  combCharsMap.Append new CombCharRep( &h0646, &h0645, &hFC4E, &hFCD5, 0, 0 ) // NOON + MEEM †
		  combCharsMap.Append new CombCharRep( &h064A, &h0645, &hFC58, &hFCDD, 0, 0 ) // YEH + MEEM †
		  
		  combCharsMap.Append new CombCharRep( &h062A, &h062E, 0, &hFCA3, 0, 0 ) // TEH + KHAH ¶
		  combCharsMap.Append new CombCharRep( &h062C, &h0645, 0, &hFCA8, 0, 0 ) // JEEM + MEEM ¶
		  combCharsMap.Append new CombCharRep( &h062D, &h0645, 0, &hFCAA, 0, 0 ) // HAH + MEEM ¶
		  combCharsMap.Append new CombCharRep( &h062E, &h0645, 0, &hFCAC, 0, 0 ) // KHAH + MEEM ¶
		  combCharsMap.Append new CombCharRep( &h0628, &h062C, 0, &hFC9C, 0, 0 ) // BEH + JEEM ¶
		  combCharsMap.Append new CombCharRep( &h0628, &h062D, 0, &hFC9D, 0, 0 ) // BEH + HAH ¶
		  combCharsMap.Append new CombCharRep( &h0628, &h062E, 0, &hFC9E, 0, 0 ) // BEH + KHAH ¶
		  combCharsMap.Append new CombCharRep( &h0646, &h062D, 0, &hFCD3, 0, 0 ) // NOON + HAH ¶
		  combCharsMap.Append new CombCharRep( &h0646, &h062E, 0, &hFCD4, 0, 0 ) // NOON + KHAH ¶
		  
		  combCharsMap.Append new CombCharRep( &h0628, &h0631, 0, 0, 0, &hFC6A ) // BEH + REH # >>
		  combCharsMap.Append new CombCharRep( &h062A, &h0631, 0, 0, 0, &hFC70 ) // TEH + REH # >>
		  combCharsMap.Append new CombCharRep( &h064A, &h0631, 0, 0, 0, &hFC91 ) // YEH + REH # >>
		  combCharsMap.Append new CombCharRep( &h0628, &h0646, 0, 0, 0, &hFC6D ) // BEH + NOON #
		  combCharsMap.Append new CombCharRep( &h062A, &h0646, 0, 0, 0, &hFC73 ) // TEH + NOON #
		  combCharsMap.Append new CombCharRep( &h0646, &h0646, 0, 0, 0, &hFC8D ) // NOON + NOON #
		  combCharsMap.Append new CombCharRep( &h064A, &h0646, 0, 0, 0, &hFC94 ) // YEH + NOON #
		  
		  combCharsMap.Append new CombCharRep( &h0641, &h0649, &hFC31, 0, 0, 0 ) // FEH + YEH ∆
		  combCharsMap.Append new CombCharRep( &h0641, &h064A, &hFC32, 0, 0, 0 ) // FEH + ALEF_MAKSURA ∆
		  
		  
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

	#tag Property, Flags = &h0
		hFont As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Inited As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		pdf As MyDynaPDFMBS
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
		#tag ViewProperty
			Name="hFont"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
