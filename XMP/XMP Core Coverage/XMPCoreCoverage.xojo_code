#tag Module
Protected Module XMPCoreCoverage
	#tag Method, Flags = &h1
		Protected Sub DoXMPCoverage1()
		  dim d as XMPDateTimeMBS
		  
		  d=new XMPDateTimeMBS
		  d.ConvertToLocalTime
		  
		  out.WriteLine "DoXMPCoverage starting "+str(d.Year)+"-"+str(d.Month)+"-"+str(d.Day)+" "+str(d.Hour)+":"+str(d.Minute)+":"+str(d.Second)
		  
		  'WriteMajorLabel "Test global XMP toolkit options"
		  'out.WriteLine "Initial global options "+hex(m.GlobalOptions)
		  'm.GlobalOptions=0
		  'out.WriteLine "Final global options "+hex(m.GlobalOptions)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DoXMPCoverage10()
		  // --------------------------------------------------------------------------------------------
		  // Date/Time utilities
		  // -------------------
		  
		  dim localNow as XMPDateTimeMBS
		  dim utcNow as new XMPDateTimeMBS
		  dim i as integer
		  
		  WriteMajorLabel ( "Test date/time utilities and special values" )
		  out.WriteLine
		  
		  utcNow.ConvertToUTCTime // constructor makes current local time
		  'utcNow.SetTimeZone
		  out.WriteLine "SetTimeZone : "+utcNow.Str
		  
		  utcNow=new XMPDateTimeMBS
		  out.WriteLine "CurrentDateTime : "+utcNow.Str
		  
		  localNow = utcNow.Clone
		  localNow.ConvertToLocalTime
		  out.WriteLine "ConvertToLocalTime : "+localNow.Str
		  
		  utcNow = localNow.Clone
		  utcNow.ConvertToUTCTime
		  out.WriteLine "ConvertToUTCTime : "+utcNow.Str
		  
		  out.WriteLine
		  
		  i = utcNow.Compare ( localNow )
		  out.WriteLine "CompareDateTime with a == b : "+str(i)
		  
		  utcNow.second = 0
		  localNow.second = 30
		  i = utcNow.Compare ( localNow )
		  out.WriteLine "CompareDateTime with a < b : "+str(i)
		  
		  utcNow.second = 59
		  i = utcNow.Compare ( localNow )
		  out.WriteLine "CompareDateTime with a > b : "+str(i)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DoXMPCoverage11()
		  dim m as new XMPMetaMBS
		  dim meta,meta1,meta2 as XMPMetaMBS
		  dim tmpStr1 as string
		  dim tmpStr2 as string
		  dim tmpStr3 as string
		  
		  // --------------------------------------------------------------------------------------------
		  // Miscellaneous utilities
		  // -----------------------
		  
		  WriteMajorLabel ( "Test CatenateArrayItems and SeparateArrayItems" )
		  out.WriteLine
		  
		  meta=new XMPMetaMBS
		  
		  meta.AppendArrayItem ( kNS1, "Array1", kXMP_PropValueIsArray, "one" )
		  meta.AppendArrayItem ( kNS1, "Array1", 0, "two" )
		  meta.AppendArrayItem ( kNS1, "Array1", kXMP_PropValueIsArray, "3, three" )
		  meta.AppendArrayItem ( kNS1, "Array1", 0, "4; four" )
		  
		  DumpXMPObj ( meta, "Initial array" )
		  out.WriteLine
		  
		  tmpStr1=meta.CatenateArrayItems ( kNS1, "Array1", "; ", """", kXMP_NoOptions )
		  out.WriteLine "CatenateArrayItems, no commas : "+ tmpStr1 
		  
		  tmpStr2=meta.CatenateArrayItems ( kNS1, "Array1", " ; ", "", kXMPUtil_AllowCommas )
		  out.WriteLine "CatenateArrayItems, allow commas : "+ tmpStr2 
		  
		  meta.SeparateArrayItems ( kNS1, "Array2-1", kXMP_NoOptions, tmpStr1 )
		  meta.SeparateArrayItems ( kNS1, "Array2-2", kXMPUtil_AllowCommas, tmpStr1 )
		  
		  meta.SeparateArrayItems ( kNS1, "Array3-1", kXMP_PropArrayIsOrdered, tmpStr2 )
		  meta.SeparateArrayItems ( kNS1, "Array3-2", (kXMP_PropArrayIsOrdered + kXMPUtil_AllowCommas), tmpStr2 )
		  
		  DumpXMPObj ( meta, "Set Array1, cat and split into others" )
		  
		  meta.SeparateArrayItems ( kNS1, "Array2-2", kXMP_NoOptions, tmpStr1 ) // Repeat into existing arrays.
		  meta.SeparateArrayItems ( kNS1, "Array3-2", kXMP_PropArrayIsOrdered, tmpStr2 )
		  
		  
		  // --------------------------------------------------------------------------------------------
		  
		  WriteMajorLabel ( "Test RemoveProperties and AppendProperties" )
		  
		  meta1=new XMPMetaMBS( kSimpleRDF )
		  
		  meta1.SetProperty ( kNS2, "Prop", "value" )
		  DumpXMPObj ( meta1, "Parse simple RDF, add ns2:Prop" )
		  
		  meta1.RemoveProperties ( kNS1, "ArrayOfStructProp" )
		  DumpXMPObj ( meta1, "Remove ns1:ArrayOfStructProp" )
		  
		  meta1.RemoveProperties ( kNS1 )
		  DumpXMPObj ( meta1, "Remove all of ns1:" )
		  
		  meta1.SetProperty ( kXMP_NS_XMP, "CreatorTool", "XMPCoverage" )
		  meta1.SetProperty ( kXMP_NS_XMP, "Nickname", "TXMP test" )
		  DumpXMPObj ( meta1, "Set xmp:CreatorTool (internal) and xmp:Nickname (external)" )
		  
		  meta1.RemoveProperties (  )
		  DumpXMPObj ( meta1, "Remove all external properties" )
		  
		  meta1.RemoveProperties ( "", "", kXMPUtil_DoAllProperties )
		  DumpXMPObj ( meta1, "Remove all properties, including internal" )
		  
		  meta1.SetProperty ( kXMP_NS_XMP, "CreatorTool", "XMPCoverage" )
		  meta1.SetProperty ( kXMP_NS_XMP, "Nickname", "TXMP test" )
		  DumpXMPObj ( meta1, "Set xmp:CreatorTool and xmp:Nickname again" )
		  
		  meta2 =new XMPMetaMBS ( kSimpleRDF )
		  
		  meta2.SetProperty ( kXMP_NS_XMP, "CreatorTool", "new CreatorTool" )
		  meta2.SetProperty ( kXMP_NS_XMP, "Nickname", "new Nickname" )
		  meta2.SetProperty ( kXMP_NS_XMP, "Format", "new Format" )
		  DumpXMPObj ( meta2, "Create 2nd XMP object with new values" )
		  
		  'meta2.AppendProperties ( meta1 )
		  'DumpXMPObj ( meta1, "Append 2nd to 1st, keeping old values, external only" )
		  '
		  'meta2.SetProperty ( kXMP_NS_XMP, "CreatorTool", "newer CreatorTool" )
		  'meta2.SetProperty ( kXMP_NS_XMP, "Nickname", "newer Nickname" )
		  'meta2.SetProperty ( kXMP_NS_XMP, "Format", "newer Format" )
		  'meta2.AppendProperties ( meta1, kXMPUtil_DoAllProperties )
		  'DumpXMPObj ( meta1, "Append 2nd to 1st, keeping old values, internal also" )
		  '
		  'meta2.SetProperty ( kXMP_NS_XMP, "CreatorTool", "newest CreatorTool" )
		  'meta2.SetProperty ( kXMP_NS_XMP, "Nickname", "newest Nickname" )
		  'meta2.SetProperty ( kXMP_NS_XMP, "Format", "newest Format" )
		  'meta2.AppendProperties ( meta1, kXMPUtil_ReplaceOldValues )
		  'DumpXMPObj ( meta1, "Append 2nd to 1st, replacing old values, external only" )
		  '
		  'meta2.SetProperty ( kXMP_NS_XMP, "CreatorTool", "final CreatorTool" )
		  'meta2.SetProperty ( kXMP_NS_XMP, "Nickname", "final Nickname" )
		  'meta2.SetProperty ( kXMP_NS_XMP, "Format", "final Format" )
		  'meta2.AppendProperties ( meta1, (kXMPUtil_ReplaceOldValues + kXMPUtil_DoAllProperties) )
		  'DumpXMPObj ( meta1, "Append 2nd to 1st, replacing old values, internal also" )
		  
		  // --------------------------------------------------------------------------------------------
		  
		  WriteMajorLabel ( "Test DuplicateSubtree" )
		  
		  meta1 =new XMPMetaMBS( kSimpleRDF )
		  meta2 =new XMPMetaMBS()
		  
		  meta1.DuplicateSubtree ( meta2, kNS1, "ArrayOfStructProp" )
		  DumpXMPObj ( meta2, "DuplicateSubtree to default destination" )
		  
		  meta1.DuplicateSubtree ( meta2, kNS1, "ArrayOfStructProp", kNS2, "NewAoS" )
		  DumpXMPObj ( meta2, "DuplicateSubtree to different destination" )
		  
		  meta1.DuplicateSubtree ( meta1, kNS1, "ArrayOfStructProp", kNS2, "NewAoS" )
		  DumpXMPObj ( meta1, "DuplicateSubtree to different destination in same object" )
		  
		  // --------------------------------------------------------------------------------------------
		  
		  WriteMajorLabel ( "Test EncodeToBase64 and DecodeFromBase64" )
		  out.WriteLine
		  
		  tmpStr1="Hello World"
		  tmpStr2=""
		  
		  tmpStr2=m.EncodeToBase64 ( tmpStr1 )
		  out.WriteLine "EncodeToBase64: "+ tmpStr2
		  
		  tmpStr3=""
		  
		  tmpStr3=m.DecodeFromBase64 ( tmpStr2 )
		  out.WriteLine "DecodeFromBase64: "+ tmpStr3
		  if ( tmpStr1 <> tmpStr3 ) then
		    out.WriteLine "** Error in base 64 round trip"
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DoXMPCoverage2()
		  dim meta1 as XMPMetaMBS
		  dim meta2 as XMPMetaMBS
		  dim meta4 as XMPMetaMBS
		  dim m as new XMPMetaMBS
		  dim t as new MyXMPTextOutputMBS(out)
		  
		  out.WriteLine "Dump predefined namespaces and aliases"
		  
		  call m.DumpNamespaces(t)
		  
		  out.WriteLine
		  
		  ''call m.DumpAliases(t)
		  
		  WriteMajorLabel "Test simple constructors and parsing, setting the instance ID"
		  
		  meta1=new XMPMetaMBS
		  DumpXMPObj meta1, "Empty XMP object"
		  out.WriteLine "Empty object name = "+meta1.Name
		  meta1.name= "New object name"
		  DumpXMPObj meta1, "Set object name"
		  
		  meta2=new XMPMetaMBS(kRDFCoverage)
		  DumpXMPObj ( meta2, "Construct and parse from buffer" )
		  out.WriteLine "RDFCoverage object name = "+meta2.Name
		  
		  meta2.SetProperty kXMP_NS_XMP_MM, "InstanceID", "meta2:Original"
		  DumpXMPObj meta2, "Add instance ID"
		  
		  meta4 = meta2.Clone
		  meta4.SetProperty kXMP_NS_XMP_MM, "InstanceID", "meta4:Clone"
		  DumpXMPObj meta4, "Clone and add instance ID"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DoXMPCoverage3()
		  dim m as new XMPMetaMBS
		  dim tmpStr1 as string
		  dim ok as Boolean
		  
		  WriteMajorLabel "Test XMPMeta object options"
		  
		  'out.WriteLine "Initial object options "+hex(meta2.Options)
		  'meta2.Options=0
		  'out.WriteLine "Final object options "+hex(meta2.Options)
		  
		  // --------------------------------------------------------------------------------------------
		  // Static namespace functions
		  // --------------------------
		  
		  WriteMajorLabel ("Test static namespace functions" )
		  
		  tmpStr1=""
		  ok = m.RegisterNamespace ( kNS2, "ns2", tmpStr1 )
		  out.WriteLine "RegisterNamespace ns2 : "+ YesOrNo ( ok )+" "+tmpStr1
		  
		  tmpStr1=""
		  ok = m.RegisterNamespace ( kNS2, "nsx:", tmpStr1 )
		  out.WriteLine "RegisterNamespace nsx : "+ YesOrNo ( ok )+" "+tmpStr1
		  
		  tmpStr1=""
		  ok = m.GetNamespacePrefix ( kNS1, tmpStr1 )
		  out.WriteLine "GetNamespacePrefix ns1 : "+ FoundOrNot ( ok )+" "+tmpStr1
		  
		  tmpStr1=""
		  ok = m.GetNamespaceURI ( "ns1", tmpStr1 )
		  out.WriteLine "GetNamespaceURI ns1 : "+ FoundOrNot ( ok )+" "+tmpStr1
		  
		  tmpStr1=""
		  ok = m.GetNamespacePrefix ( "bogus", tmpStr1 )
		  out.WriteLine "GetNamespacePrefix bogus : "+ FoundOrNot ( ok ) 
		  
		  tmpStr1=""
		  ok = m.GetNamespaceURI ( "bogus", tmpStr1 )
		  out.WriteLine "GetNamespaceURI bogus : "+ FoundOrNot ( ok ) 
		  
		  call m.DumpNamespaces(new MyXMPTextOutputMBS(out))
		  
		  'm.DeleteNamespace ( kNS2 )
		  call m.DumpNamespaces(new MyXMPTextOutputMBS(out))
		  call m.RegisterNamespace ( kNS2, "ns2", tmpStr1 )
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DoXMPCoverage4()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DoXMPCoverage5()
		  dim ok as Boolean
		  dim meta as XMPMetaMBS
		  dim tmpstr1,tmpStr2 as string
		  dim options as integer
		  
		  // --------------------------------------------------------------------------------------------
		  // Basic set/get methods
		  // ---------------------
		  
		  meta = new XMPMetaMBS
		  
		  WriteMajorLabel ( "Test SetProperty and related methods" )
		  
		  tmpStr1 = "Prop value"
		  meta.SetProperty ( kNS1, "Prop", tmpStr1 )
		  meta.SetProperty ( kNS1, "ns1:XMLProp", "<PropValue/>" )
		  meta.SetProperty ( kNS1, "ns1:URIProp", "URI:value/", kXMP_PropValueIsURI )
		  
		  tmpStr1 = "BagItem value"
		  meta.AppendArrayItem ( kNS1, "Bag", kXMP_PropValueIsArray, tmpStr1 )
		  meta.AppendArrayItem ( kNS1, "ns1:Seq", kXMP_PropArrayIsOrdered, "SeqItem value" )
		  meta.AppendArrayItem ( kNS1, "ns1:Alt", kXMP_PropArrayIsAlternate, "AltItem value" )
		  
		  tmpStr1 = "Field1 value"
		  meta.SetStructField ( kNS1, "Struct", kNS2, "Field1", tmpStr1 )
		  meta.SetStructField ( kNS1, "ns1:Struct", kNS2, "Field2", "Field2 value" )
		  meta.SetStructField ( kNS1, "ns1:Struct", kNS2, "Field3", "Field3 value" )
		  
		  tmpStr1 = "BagItem 3"
		  meta.SetArrayItem ( kNS1, "Bag", 1, tmpStr1 )
		  meta.SetArrayItem ( kNS1, "ns1:Bag", 1, "BagItem 1", kXMP_InsertBeforeItem )
		  meta.SetArrayItem ( kNS1, "ns1:Bag", 1, "BagItem 2", kXMP_InsertAfterItem )
		  meta.AppendArrayItem ( kNS1, "Bag", 0, "BagItem 4" )
		  
		  DumpXMPObj ( meta, "A few basic Set... calls" )
		  
		  tmpStr1=meta.SerializeToBuffer ( kXMP_OmitPacketWrapper, 0 )
		  out.WriteLine
		  out.WriteLine tmpStr1
		  
		  out.WriteLine "CountArrayItems Bag = "+ str(meta.CountArrayItems ( kNS1, "Bag" ) )
		  
		  meta.SetProperty ( kNS1, "QualProp1", "Prop value" )
		  meta.SetQualifier ( kNS1, "QualProp1", kNS2, "Qual1", "Qual1 value" )
		  // *** meta.SetProperty ( kNS1, "QualProp1/Qual2", "Qual2 value", kXMP_PropIsQualifier ); invalid
		  meta.SetProperty ( kNS1, "QualProp1/?ns2:Qual3", "Qual3 value" )
		  meta.SetProperty ( kNS1, "QualProp1/?xml:lang", "x-qual" )
		  
		  meta.SetProperty ( kNS1, "QualProp2", "Prop value" )
		  meta.SetQualifier ( kNS1, "QualProp2", kXMP_NS_XML, "lang", "en-us" )
		  // *** meta.SetProperty ( kNS1, "QualProp2/xml:lang", "x-field", kXMP_PropIsQualifier ); invalid
		  meta.SetProperty ( kNS1, "QualProp2/@xml:lang", "x-attr" )
		  
		  meta.SetProperty ( kNS1, "QualProp3", "Prop value" )
		  meta.SetQualifier ( kNS1, "ns1:QualProp3", kXMP_NS_XML, "xml:lang", "en-us" )
		  meta.SetQualifier ( kNS1, "ns1:QualProp3", kNS2, "ns2:Qual", "Qual value" )
		  
		  meta.SetProperty ( kNS1, "QualProp4", "Prop value" )
		  tmpStr1 = "Qual value"
		  meta.SetQualifier ( kNS1, "QualProp4", kNS2, "Qual", tmpStr1 )
		  meta.SetQualifier ( kNS1, "QualProp4", kXMP_NS_XML, "lang", "en-us" )
		  
		  DumpXMPObj ( meta, "Add some qualifiers" )
		  
		  tmpStr1= meta.SerializeToBuffer ( kXMP_OmitPacketWrapper,0 )
		  out.WriteLine
		  out.WriteLine tmpStr1
		  
		  meta.SetProperty ( kNS1, "QualProp1", "new value" )
		  meta.SetProperty ( kNS1, "QualProp2", "new value" )
		  meta.SetProperty ( kNS1, "QualProp3", "new value" )
		  meta.SetProperty ( kNS1, "QualProp4", "new value" )
		  DumpXMPObj ( meta, "Change values and keep qualifiers" )
		  
		  // ----------------------------------------------------------------------------------------
		  
		  WriteMajorLabel ( "Test GetProperty and related methods" )
		  
		  meta.DeleteProperty ( kNS1, "QualProp1" ) // ! Start with fresh qualifiers.
		  meta.DeleteProperty ( kNS1, "ns1:QualProp2" )
		  meta.DeleteProperty ( kNS1, "ns1:QualProp3" )
		  meta.DeleteProperty ( kNS1, "QualProp4" )
		  
		  meta.SetProperty ( kNS1, "QualProp1", "Prop value" )
		  meta.SetQualifier ( kNS1, "QualProp1", kNS2, "Qual1", "Qual1 value" )
		  
		  meta.SetProperty ( kNS1, "QualProp2", "Prop value" )
		  meta.SetQualifier ( kNS1, "QualProp2", kXMP_NS_XML, "lang", "en-us" )
		  
		  meta.SetProperty ( kNS1, "QualProp3", "Prop value" )
		  meta.SetQualifier ( kNS1, "QualProp3", kXMP_NS_XML, "lang", "en-us" )
		  meta.SetQualifier ( kNS1, "QualProp3", kNS2, "Qual", "Qual value" )
		  
		  meta.SetProperty ( kNS1, "QualProp4", "Prop value" )
		  meta.SetQualifier ( kNS1, "QualProp4", kNS2, "Qual", "Qual value" )
		  meta.SetQualifier ( kNS1, "QualProp4", kXMP_NS_XML, "lang", "en-us" )
		  
		  DumpXMPObj (  meta, "XMP object" )
		  out.WriteLine 
		  
		  tmpStr1=""
		  
		  ok = meta.GetProperty ( kNS1, "Prop", tmpStr1, options )
		  out.WriteLine "GetProperty ns1:Prop : "+ FoundOrNot ( ok )+" "+tmpStr1+" "+hex(options )
		  
		  try
		    tmpStr1=""
		    
		    #pragma BreakOnExceptions false
		    ok = meta.GetProperty ( "", "ns1:Prop", tmpStr1, options )
		    out.WriteLine "#ERROR: No exception for GetProperty with no schema URI : "+ FoundOrNot ( ok )+" "+tmpStr1+" "+hex(options )
		    #pragma BreakOnExceptions true
		    break // error!
		  catch ex1 as XMPExceptionMBS
		    out.WriteLine "GetProperty with no schema URI - threw XMPExceptionMBS: "+ ex1.message
		  end try
		  
		  tmpStr1=""
		  
		  ok = meta.GetProperty ( kNS1, "ns1:XMLProp", tmpStr1, options )
		  out.WriteLine "GetProperty ns1:XMLProp : "+ FoundOrNot ( ok )+" "+tmpStr1+" "+hex(options )
		  
		  tmpStr1=""
		  
		  ok = meta.GetProperty ( kNS1, "ns1:URIProp", tmpStr1, options )
		  out.WriteLine "GetProperty ns1:URIProp : "+ FoundOrNot ( ok )+" "+tmpStr1+" "+hex(options )
		  
		  out.WriteLine 
		  
		  tmpStr1=""
		  
		  ok = meta.GetArrayItem ( kNS1, "Bag", 2, tmpStr1, options )
		  out.WriteLine "GetArrayItem ns1:Bag[2] : "+ FoundOrNot ( ok )+" "+tmpStr1+" "+hex(options )
		  
		  try
		    tmpStr1=""
		    
		    #pragma BreakOnExceptions false
		    ok = meta.GetArrayItem ( "", "ns1:Bag", 1, tmpStr1, options )
		    #pragma BreakOnExceptions true
		    out.WriteLine "#ERROR: No exception for GetArrayItem with no schema URI : "+ FoundOrNot ( ok )+" "+tmpStr1+" "+hex(options )
		    Break // error
		  catch ex2 as XMPExceptionMBS
		    out.WriteLine "GetArrayItem with no schema URI - threw XMPExceptionMBS: "+ex2.message
		  end try
		  
		  tmpStr1=""
		  
		  ok = meta.GetArrayItem ( kNS1, "ns1:Seq", 1, tmpStr1, options )
		  out.WriteLine "GetArrayItem ns1:Seq[1] : "+ FoundOrNot ( ok )+" "+tmpStr1+" "+hex(options )
		  
		  tmpStr1=""
		  
		  ok = meta.GetArrayItem ( kNS1, "ns1:Alt", kXMP_ArrayLastItem, tmpStr1, options )
		  out.WriteLine "GetArrayItem ns1:Alt[1] : "+ FoundOrNot ( ok )+" "+tmpStr1+" "+hex(options )
		  
		  out.WriteLine 
		  
		  tmpStr1=""
		  
		  ok = meta.GetStructField ( kNS1, "Struct", kNS2, "Field1", tmpStr1, options )
		  out.WriteLine "GetStructField ns1:Struct/ns2:Field1 : "+ FoundOrNot ( ok )+" "+tmpStr1+" "+hex(options )
		  
		  tmpStr1=""
		  
		  ok = meta.GetStructField ( kNS1, "ns1:Struct", kNS2, "ns2:Field2", tmpStr1, options )
		  out.WriteLine "GetStructField ns1:Struct/ns2:Field2 : "+ FoundOrNot ( ok )+" "+tmpStr1+" "+hex(options )
		  
		  tmpStr1=""
		  
		  ok = meta.GetStructField ( kNS1, "ns1:Struct", kNS2, "ns2:Field3", tmpStr1, options )
		  out.WriteLine "GetStructField ns1:Struct/ns2:Field3 : "+ FoundOrNot ( ok )+" "+tmpStr1+" "+hex(options )
		  
		  tmpStr1=""
		  
		  ok = meta.GetQualifier ( kNS1, "QualProp1", kNS2, "Qual1", tmpStr1, options )
		  out.WriteLine "GetQualifier ns1:QualProp1/?ns2:Qual1 : "+ FoundOrNot ( ok )+" "+tmpStr1+" "+hex(options )
		  
		  try
		    tmpStr1=""
		    
		    #pragma BreakOnExceptions false
		    ok = meta.GetQualifier ( "", "ns1:QualProp1", kNS2, "Qual1", tmpStr1, options )
		    #pragma BreakOnExceptions true
		    out.WriteLine "#ERROR: No exception for GetQualifier with no schema URI : "+ FoundOrNot ( ok )+" "+tmpStr1+" "+hex(options )
		    Break // error
		  catch ex3 as XMPExceptionMBS
		    out.WriteLine "GetQualifier with no schema URI - threw XMPExceptionMBS: "+ex3.message
		  end try
		  
		  tmpStr1=""
		  
		  ok = meta.GetQualifier ( kNS1, "ns1:QualProp3", kXMP_NS_XML, "xml:lang", tmpStr1, options )
		  out.WriteLine "GetQualifier ns1:QualProp3 : "+ FoundOrNot ( ok )+" "+tmpStr1+" "+hex(options )
		  
		  tmpStr1=""
		  
		  ok = meta.GetQualifier ( kNS1, "ns1:QualProp3", kNS2, "ns2:Qual", tmpStr1, options )
		  out.WriteLine "GetQualifier ns1:QualProp3/?ns2:Qual : "+ FoundOrNot ( ok )+" "+tmpStr1+" "+hex(options )
		  
		  out.WriteLine 
		  
		  tmpStr1 = "junk"
		  ok = meta.GetProperty ( kNS1, "Bag", tmpStr1, options )
		  out.WriteLine "GetProperty ns1:Bag : "+ FoundOrNot ( ok )+" "+tmpStr1+" "+hex(options )
		  
		  tmpStr1 = "junk"
		  ok = meta.GetProperty ( kNS1, "Seq", tmpStr1, options )
		  out.WriteLine "GetProperty ns1:Seq : "+ FoundOrNot ( ok )+" "+tmpStr1+" "+hex(options )
		  
		  tmpStr1 = "junk"
		  ok = meta.GetProperty ( kNS1, "Alt", tmpStr1, options )
		  out.WriteLine "GetProperty ns1:Alt : "+ FoundOrNot ( ok )+" "+tmpStr1+" "+hex(options )
		  
		  tmpStr1 = "junk"
		  ok = meta.GetProperty ( kNS1, "Struct", tmpStr1, options )
		  out.WriteLine "GetProperty ns1:Struct : "+ FoundOrNot ( ok )+" "+tmpStr1+" "+hex(options )
		  
		  out.WriteLine 
		  
		  try
		    tmpStr1 = "junk"
		    #pragma BreakOnExceptions false
		    ok = meta.GetProperty ( "ns:bogus/", "Bogus", tmpStr1, options )
		    #pragma BreakOnExceptions true
		    out.WriteLine "#ERROR: No exception for GetProperty with bogus schema URI: "+FoundOrNot ( ok )+" "+tmpStr1+" "+hex(options )
		    break // error
		  catch ex4 as XMPExceptionMBS
		    out.WriteLine "GetProperty with bogus schema URI - threw XMPExceptionMBS: "+ex4.message
		  end try
		  
		  tmpStr1 = "junk"
		  ok = meta.GetProperty ( kNS1, "Bogus", tmpStr1, options )
		  out.WriteLine "GetProperty ns1:Bogus : "+ FoundOrNot ( ok )
		  
		  tmpStr1 = "junk"
		  ok = meta.GetArrayItem ( kNS1, "Bag", 99, tmpStr1, options )
		  out.WriteLine "GetArrayItem ns1:Bag[99] : "+FoundOrNot ( ok )
		  
		  tmpStr1 = "junk"
		  ok = meta.GetStructField ( kNS1, "Struct", kNS2, "Bogus", tmpStr1, options )
		  out.WriteLine "GetStructField ns1:Struct/ns2:Bogus : "+ FoundOrNot ( ok )
		  
		  tmpStr1 = "junk"
		  ok = meta.GetQualifier ( kNS1, "Prop", kNS2, "Bogus", tmpStr1, options )
		  out.WriteLine "GetQualifier ns1:Prop/?ns2:Bogus : "+FoundOrNot ( ok )
		  
		  // ----------------------------------------------------------------------------------------
		  
		  WriteMajorLabel ( "Test DoesPropertyExist, DeleteProperty, and related methods" )
		  
		  DumpXMPObj ( meta, "XMP object" )
		  out.WriteLine
		  
		  ok = meta.DoesPropertyExist ( kNS1, "Prop" )
		  out.WriteLine "DoesPropertyExist ns1:Prop : "+ YesOrNo ( ok )
		  
		  try
		    #pragma BreakOnExceptions false
		    ok = meta.DoesPropertyExist ( "", "ns1:Bag" )
		    #pragma BreakOnExceptions true
		    out.WriteLine "#ERROR: No exception for DoesPropertyExist with no schema URI: "+ YesOrNo ( ok )
		    Break // error
		  catch ex5 as XMPExceptionMBS
		    out.WriteLine "DoesPropertyExist with no schema URI - threw XMPExceptionMBS: "+ex5.message
		  end try
		  
		  ok = meta.DoesPropertyExist ( kNS1, "ns1:Struct" )
		  out.WriteLine "DoesPropertyExist ns1:Struct : "+ YesOrNo ( ok )
		  
		  out.WriteLine
		  
		  ok = meta.DoesArrayItemExist ( kNS1, "Bag", 2 )
		  out.WriteLine "DoesArrayItemExist ns1:Bag[2] : "+ YesOrNo ( ok )
		  
		  ok = meta.DoesArrayItemExist ( kNS1, "ns1:Seq", kXMP_ArrayLastItem )
		  out.WriteLine "DoesArrayItemExist ns1:Seq[last] : "+ YesOrNo ( ok )
		  
		  ok = meta.DoesStructFieldExist ( kNS1, "Struct", kNS2, "Field1" )
		  out.WriteLine "DoesStructFieldExist ns1:Struct/ns2:Field1 : "+ YesOrNo ( ok )
		  
		  ok = meta.DoesQualifierExist ( kNS1, "QualProp1", kNS2, "Qual1" )
		  out.WriteLine "DoesQualifierExist ns1:QualProp1/?ns2:Qual1 : "+ YesOrNo ( ok )
		  
		  ok = meta.DoesQualifierExist ( kNS1, "QualProp2", kXMP_NS_XML, "lang" )
		  out.WriteLine "DoesQualifierExist ns1:QualProp2/?xml:lang : "+ YesOrNo ( ok )
		  
		  out.WriteLine
		  
		  try
		    #pragma BreakOnExceptions false
		    ok = meta.DoesPropertyExist ( "ns:bogus/", "Bogus" )
		    #pragma BreakOnExceptions true
		    out.WriteLine "#ERROR: No exception for DoesPropertyExist with bogus schema URI: "+ YesOrNo ( ok )
		    break // error
		  catch ex6 as XMPExceptionMBS
		    out.WriteLine "DoesPropertyExist with bogus schema URI - threw XMPExceptionMBS: "+ex6.message
		  end try
		  
		  ok = meta.DoesPropertyExist ( kNS1, "Bogus" )
		  out.WriteLine "DoesPropertyExist ns1:Bogus : "+ YesOrNo ( ok )
		  
		  ok = meta.DoesArrayItemExist ( kNS1, "Bag", 99 )
		  out.WriteLine "DoesArrayItemExist ns1:Bag[99] : "+ YesOrNo ( ok )
		  
		  try
		    #pragma BreakOnExceptions false
		    ok = meta.DoesArrayItemExist ( "", "ns1:Bag", kXMP_ArrayLastItem )
		    #pragma BreakOnExceptions true
		    out.WriteLine "#ERROR: No exception for DoesArrayItemExist with no schema URI: "+ YesOrNo ( ok )
		    break // error
		  catch ex7 as XMPExceptionMBS
		    out.WriteLine "DoesArrayItemExist with no schema URI - threw XMPExceptionMBS: "+ex7.message
		  end try
		  
		  ok = meta.DoesStructFieldExist ( kNS1, "Struct", kNS2, "Bogus" )
		  out.WriteLine "DoesStructFieldExist ns1:Struct/ns2:Bogus : "+ YesOrNo ( ok )
		  
		  ok = meta.DoesQualifierExist ( kNS1, "Prop", kNS2, "Bogus" )
		  out.WriteLine "DoesQualifierExist ns1:Prop/?ns2:Bogus : "+ YesOrNo ( ok )
		  
		  meta.DeleteProperty ( kNS1, "Prop" )
		  meta.DeleteArrayItem ( kNS1, "Bag", 2 )
		  meta.DeleteStructField ( kNS1, "Struct", kNS2, "Field1" )
		  
		  DumpXMPObj ( meta, "Delete Prop, Bag[2], and Struct1/Field1" )
		  
		  meta.DeleteQualifier ( kNS1, "QualProp1", kNS2, "Qual1" )
		  meta.DeleteQualifier ( kNS1, "QualProp2", kXMP_NS_XML, "lang" )
		  meta.DeleteQualifier ( kNS1, "QualProp3", kNS2, "Qual" )
		  meta.DeleteQualifier ( kNS1, "QualProp4", kXMP_NS_XML, "lang" )
		  
		  DumpXMPObj ( meta, "Delete QualProp1/?ns2:Qual1, QualProp2/?xml:lang, QualProp3:/ns2:Qual, and QualProp4/?xml:lang" )
		  
		  meta.DeleteProperty ( kNS1, "Bag" )
		  meta.DeleteProperty ( kNS1, "Struct" )
		  
		  DumpXMPObj ( meta, "Delete all of Bag and Struct" )
		  
		  // --------------------------------------------------------------------------------------------
		  // Localized text set/get methods
		  // ------------------------------
		  
		  meta=new XMPMetaMBS
		  
		  WriteMajorLabel ( "Test SetLocalizedText and GetLocalizedText" )
		  
		  tmpStr1 = "default value"
		  meta.SetLocalizedText ( kNS1, "AltText", "", "x-default", tmpStr1 )
		  DumpXMPObj ( meta, "Set x-default value" )
		  
		  meta.SetLocalizedText ( kNS1, "AltText", "en", "en-us", "en-us value" )
		  DumpXMPObj ( meta, "Set en/en-us value" )
		  
		  meta.SetLocalizedText ( kNS1, "AltText", "en", "en-uk", "en-uk value" )
		  DumpXMPObj ( meta, "Set en/en-uk value" )
		  
		  out.WriteLine
		  
		  tmpStr1=""
		  tmpStr2=""
		  
		  ok = meta.GetLocalizedText ( kNS1, "AltText", "en", "en-ca", tmpStr1, tmpStr2, options)
		  out.WriteLine "GetLocalizedText en/en-ca : "+FoundOrNot ( ok )+" "+ tmpStr1+" "+ tmpStr2+" "+hex( options )
		  
		  tmpStr1 = "junk"
		  ok = meta.GetProperty ( kNS1, "AltText", tmpStr1, options )
		  out.WriteLine "GetProperty ns1:AltText : "+FoundOrNot ( ok )+" "+ tmpStr1+" "+hex(options )
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DoXMPCoverage6()
		  dim kValueWithCR, kValueWithCRLF, kValueWithLF as string
		  dim datevalue as XMPDateTimeMBS
		  dim intValue as integer
		  dim boolValue as Boolean
		  dim floatValue as Double
		  dim datename as string
		  dim ok as Boolean
		  dim meta2,meta3,meta as XMPMetaMBS
		  dim minSize,i,options as integer
		  dim tmpStr1,tmpStr2 as string
		  
		  // --------------------------------------------------------------------------------------------
		  // Binary value set/get methods
		  // ----------------------------
		  
		  meta=new XMPMetaMBS(kDateTimeRDF)
		  
		  datevalue= new XMPDateTimeMBS
		  
		  datevalue.Year=2000
		  datevalue.Month=1
		  datevalue.Day=2
		  datevalue.Hour=3
		  datevalue.Minute=4
		  datevalue.Second=5
		  datevalue.NanoSecond=0
		  datevalue.TimezoneHour=0
		  datevalue.TimezoneMinute=0
		  datevalue.TimezoneSign=0
		  
		  WriteMajorLabel ( "Test SetProperty... and GetProperty... methods (set/get with binary values)" )
		  
		  meta.SetPropertyBoolean( kNS1, "Bool0", false )
		  meta.SetPropertyBoolean ( kNS1, "Bool1", true )
		  meta.SetPropertyInteger ( kNS1, "Int", 42 )
		  meta.SetPropertyFloat ( kNS1, "Float", 4.2 )
		  
		  meta.SetPropertyDate ( kNS1, "Date10", dateValue )
		  dateValue.TimeZoneSign = 1
		  dateValue.TimeZoneHour = 6
		  dateValue.TimeZoneMinute = 7
		  meta.SetPropertyDate ( kNS1, "Date11", dateValue )
		  dateValue.TimeZoneSign = -1
		  meta.SetPropertyDate ( kNS1, "Date12", dateValue )
		  dateValue.nanoSecond = 9
		  meta.SetPropertyDate ( kNS1, "Date13", dateValue )
		  
		  DumpXMPObj ( meta, "A few basic binary Set... calls" )
		  
		  out.WriteLine
		  
		  ok = meta.GetPropertyBoolean ( kNS1, "Bool0", boolValue, options )
		  out.WriteLine "GetPropertyBoolean Bool0 : "+FoundOrNot ( ok )+" "+bool(boolValue)+" "+hex(options )
		  
		  ok = meta.GetPropertyBoolean ( kNS1, "Bool1", boolValue, options )
		  out.WriteLine "GetPropertyBoolean Bool1 : "+FoundOrNot ( ok )+" "+bool(boolValue)+" "+hex(options )
		  
		  ok = meta.GetPropertyInteger ( kNS1, "Int", intValue, options )
		  out.WriteLine "GetPropertyInteger : "+FoundOrNot ( ok )+str(intValue)+" "+hex(options )
		  
		  ok = meta.GetPropertyFloat ( kNS1, "Float", floatValue, options )
		  out.WriteLine "GetPropertyFloat : "+FoundOrNot ( ok )+" "+str(floatValue)+" "+hex(options )
		  
		  out.WriteLine
		  
		  for i=1 to 13
		    dateName="Date"+str(i)
		    ok = meta.GetPropertyDate ( kNS1, dateName, dateValue, options )
		    out.WriteLine "GetProperty_Date ("+datename+") : "+FoundOrNot ( ok )+" "+datevalue.Str+" "+hex(options )
		    meta.SetPropertyDate ( kNS2, dateName, dateValue )
		  next
		  
		  DumpXMPObj ( meta, "Get and re-set the dates" )
		  
		  // --------------------------------------------------------------------------------------------
		  // Parse and serialize methods
		  // ---------------------------
		  
		  WriteMajorLabel ( "Test parsing with multiple buffers and various options" )
		  
		  meta=new XMPMetaMBS
		  for i = 1 to lenb(kSimpleRDF)
		    meta.ParseFromBuffer ( midb(kSimpleRDF,i,1), kXMP_ParseMoreBuffers )
		  next
		  
		  DumpXMPObj ( meta, "Multiple buffer parse" )
		  
		  meta=new XMPMetaMBS
		  for i = 1 to lenb(kSimpleRDF)
		    meta.ParseFromBuffer ( midb(kSimpleRDF,i,1), kXMP_ParseMoreBuffers )
		  next
		  meta.ParseFromBuffer ( "", 0 )
		  DumpXMPObj ( meta, "Multiple buffer parse, empty last buffer" )
		  
		  meta=new XMPMetaMBS
		  for i = 1 to lenb(kSimpleRDF)
		    meta.ParseFromBuffer ( midb(kSimpleRDF,i,1), kXMP_ParseMoreBuffers )
		  next
		  
		  meta.ParseFromBuffer ( "", 0 )
		  DumpXMPObj ( meta, "Multiple buffer parse, null last buffer" )
		  
		  
		  meta=new XMPMetaMBS
		  meta.ParseFromBuffer ( kSimpleRDF, kXMP_RequireXMPMeta )
		  DumpXMPObj ( meta, "Parse and require xmpmeta element, which is missing" )
		  
		  meta=new XMPMetaMBS
		  meta.ParseFromBuffer ( kNamespaceRDF, 0 )
		  DumpXMPObj ( meta, "Parse RDF with multiple nested namespaces" )
		  
		  meta=new XMPMetaMBS
		  meta.ParseFromBuffer ( kXMPMetaRDF, kXMP_RequireXMPMeta )
		  DumpXMPObj ( meta, "Parse and require xmpmeta element, which is present" )
		  
		  meta=new XMPMetaMBS
		  meta.ParseFromBuffer ( kInconsistentRDF, lenb(kInconsistentRDF) )
		  DumpXMPObj ( meta, "Parse and reconcile inconsistent aliases" )
		  
		  try
		    meta=new XMPMetaMBS
		    #pragma BreakOnExceptions false
		    meta.ParseFromBuffer ( kInconsistentRDF, kXMP_StrictAliasing )
		    #pragma BreakOnExceptions true
		    DumpXMPObj ( meta, "ERROR: Parse and do not reconcile inconsistent aliases - should have thrown an exception" )
		    Break // error
		  Catch ex8 as XMPExceptionMBS
		    out.WriteLine "Parse and do not reconcile inconsistent aliases - threw XMPExceptionMBS: "+ex8.message
		  end try
		  
		  WriteMajorLabel ( "Test CR and LF in values" )
		  
		  kValueWithCR = "ASCII "+EndOfLine.Macintosh+" CR"
		  kValueWithLF = "ASCII "+EndOfLine.UNIX+" LF"
		  kValueWithCRLF = "ASCII "+EndOfLine.Windows+" CRLF"
		  
		  meta=new XMPMetaMBS ( kNewlineRDF )
		  
		  meta.SetProperty ( kNS2, "HasCR", kValueWithCR )
		  meta.SetProperty ( kNS2, "HasLF", kValueWithLF )
		  meta.SetProperty ( kNS2, "HasCRLF", kValueWithCRLF )
		  
		  tmpStr1=meta.SerializeToBuffer ( kXMP_OmitPacketWrapper, 0 )
		  out.WriteLine tmpStr1
		  
		  tmpStr1=""
		  tmpStr2=""
		  
		  ok = meta.GetProperty ( kNS1, "HasCR", tmpStr1, options )
		  ok = meta.GetProperty ( kNS2, "HasCR", tmpStr2, options )
		  if ( (tmpStr1 <> kValueWithCR) or (tmpStr2 <> kValueWithCR) ) then
		    out.WriteLine " ## HasCR values are bad" 
		  end if
		  
		  tmpStr1=""
		  tmpStr2=""
		  
		  ok = meta.GetProperty ( kNS1, "HasLF", tmpStr1, options )
		  ok = meta.GetProperty ( kNS2, "HasLF", tmpStr2, options )
		  if ( (tmpStr1 <> kValueWithLF) or (tmpStr2 <> kValueWithLF) ) then
		    out.WriteLine " ## HasLF values are bad" 
		  end if
		  
		  tmpStr1=""
		  tmpStr2=""
		  
		  ok = meta.GetProperty ( kNS1, "HasCRLF", tmpStr1, options )
		  ok = meta.GetProperty ( kNS2, "HasCRLF", tmpStr2, options )
		  if ( (tmpStr1 <> kValueWithCRLF) or (tmpStr2 <> kValueWithCRLF) ) then
		    out.WriteLine " ## HasCRLF values are bad" 
		  end if
		  
		  WriteMajorLabel ( "Test serialization with various options" )
		  
		  meta=new XMPMetaMBS  ( kSimpleRDF )
		  meta.SetProperty ( kNS2, "Another", "Something in another schema" )
		  meta.SetProperty ( kNS2, "Yet/pdf:More", "Yet more in another schema" )
		  
		  DumpXMPObj ( meta, "Parse simple RDF, serialize with various options" )
		  
		  tmpStr1= meta.SerializeToBuffer ( 0,0 )
		  WriteMinorLabel ( "Default serialize" )
		  out.WriteLine tmpStr1
		  
		  VerifyNewlines ( out, tmpStr1, EndOfLine.UNIX )
		  
		  meta2 =new XMPMetaMBS( tmpStr1 )
		  DumpXMPObj ( meta2, "Reparse default serialization" )
		  
		  tmpStr1=""
		  
		  tmpStr1= meta.SerializeToBuffer ( kXMP_OmitPacketWrapper + kXMP_UseCompactFormat, 0 )
		  WriteMinorLabel ( "Compact RDF, no packet serialize" )
		  out.WriteLine tmpStr1
		  
		  meta3 =new XMPMetaMBS(tmpStr1)
		  DumpXMPObj ( meta3, "Reparse compact serialization" )
		  
		  meta2=new XMPMetaMBS
		  meta2.SetProperty ( kXMP_NS_PDF, "Author", "PDF Author" )
		  
		  tmpStr1=""
		  
		  tmpStr1= meta2.SerializeToBuffer ( kXMP_ReadOnlyPacket + kXMP_WriteAliasComments, 0 )
		  WriteMinorLabel ( "Read-only serialize with alias comments" )
		  out.WriteLine tmpStr1
		  
		  meta2.SetProperty ( kXMP_NS_PDF, "Actual", "PDF Actual" )
		  meta2.SetProperty ( kXMP_NS_XMP, "Actual", "XMP Actual" )
		  
		  tmpStr1=""
		  
		  tmpStr1= meta2.SerializeToBuffer ( kXMP_ReadOnlyPacket + kXMP_WriteAliasComments, 0 )
		  WriteMinorLabel ( "Read-only serialize with alias comments (more actuals)" )
		  out.WriteLine tmpStr1
		  
		  tmpStr1=""
		  
		  tmpStr1=meta.SerializeToBuffer ( kXMP_OmitPacketWrapper, 0, EndOfLine.Macintosh,"",0 )
		  WriteMinorLabel ( "CR newline serialize" )
		  out.WriteLine tmpStr1
		  VerifyNewlines ( out, tmpStr1, EndOfLine.Macintosh )
		  
		  tmpStr1=""
		  
		  tmpStr1=meta.SerializeToBuffer ( kXMP_OmitPacketWrapper, 0, EndOfLine.Windows,"",0  )
		  WriteMinorLabel ( "CRLF newline serialize" )
		  out.WriteLine tmpStr1
		  VerifyNewlines ( out, tmpStr1, EndOfLine.Windows)
		  
		  tmpStr1=""
		  
		  tmpStr1=meta.SerializeToBuffer ( kXMP_OmitPacketWrapper, 0, "<->","",0  )
		  WriteMinorLabel ( "Alternate newline serialize" )
		  out.WriteLine tmpStr1
		  
		  tmpStr1=""
		  
		  tmpStr1=meta.SerializeToBuffer ( kXMP_OmitPacketWrapper, 0, "", "#", 3 )
		  WriteMinorLabel ( "Alternate indent serialize" )
		  out.WriteLine tmpStr1
		  
		  tmpStr1=""
		  
		  tmpStr1=meta.SerializeToBuffer ( 0, 10 )
		  WriteMinorLabel ( "Small padding serialize" )
		  out.WriteLine tmpStr1
		  
		  tmpStr1=""
		  
		  tmpStr2=""
		  
		  tmpStr1=meta.SerializeToBuffer (0,0)
		  tmpStr2=meta.SerializeToBuffer ( kXMP_IncludeThumbnailPad,0 )
		  out.WriteLine "Thumbnailpad adds "+str(lenb(tmpstr2)-lenb(tmpstr1))+" bytes"
		  
		  tmpStr1=""
		  
		  tmpStr1=meta.SerializeToBuffer ( kXMP_ReadOnlyPacket, 0 )
		  minSize = lenb(tmpStr1)
		  out.WriteLine "Minimum packet size is "+str(minSize)+" bytes"
		  
		  tmpStr1=""
		  
		  tmpStr1=meta.SerializeToBuffer ( kXMP_ExactPacketLength, minSize+1234 )
		  out.WriteLine "Minimum+1234 packet size is "+str(lenb(tmpstr1))+" bytes"
		  if ( lenb(tmpStr1) <> (minSize + 1234) ) then
		    out.WriteLine "** Bad packet length **"
		  end if
		  
		  tmpStr1=""
		  
		  tmpStr1=meta.SerializeToBuffer ( kXMP_ExactPacketLength, minSize )
		  out.WriteLine "Minimum+0 packet size is "+str(lenb(tmpstr1))+" bytes"
		  if ( lenb(tmpStr1) <> minSize ) then
		    out.WriteLine "** Bad packet length **"
		  end if
		  
		  try
		    tmpStr1=""
		    
		    #pragma BreakOnExceptions false
		    tmpStr1=meta.SerializeToBuffer ( kXMP_ExactPacketLength, minSize-1 )
		    #pragma BreakOnExceptions true
		    out.WriteLine "#ERROR: No exception for minimum-1, size is "+str(lenb(tmpstr1))+" bytes **"
		    Break // error
		  catch ex9 as XMPExceptionMBS
		    out.WriteLine "Serialize in minimum-1 - threw XMPExceptionMBS: "+ex9.message
		  end try
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DoXMPCoverage7()
		  dim iter,iter1,iter2 as XMPIteratorMBS
		  dim tmpStr1 as string
		  dim tmpStr2 as string
		  dim tmpStr3 as string
		  dim opt2 as integer
		  dim tmpStr4 as string
		  dim ok as Boolean
		  dim meta as XMPMetaMBS
		  dim options as integer
		  
		  // --------------------------------------------------------------------------------------------
		  // Iteration methods
		  // -----------------
		  
		  WriteMajorLabel ( "Test iteration methods" )
		  
		  meta=new XMPMetaMBS ( kRDFCoverage )
		  
		  meta.SetProperty  ( kNS2, "Prop", "Prop value" )
		  meta.SetProperty  ( kNS2, "Bag", "", kXMP_PropValueIsArray )
		  meta.SetArrayItem ( kNS2, "Bag", 1, "BagItem 2" )
		  meta.SetArrayItem ( kNS2, "Bag", 1, "BagItem 1", kXMP_InsertBeforeItem )
		  meta.SetArrayItem ( kNS2, "Bag", 2, "BagItem 3", kXMP_InsertAfterItem )
		  
		  DumpXMPObj ( meta, "Parse ""coverage"" RDF, add Bag items out of order" )
		  
		  iter =new XMPIteratorMBS( meta )
		  WriteMinorLabel ( "Default iteration" )
		  
		  while ( true )
		    tmpStr1=""
		    tmpStr2=""
		    tmpStr3=""
		    
		    if ( not iter.NextItem ( tmpStr1, tmpStr2, tmpStr3, options ) ) then
		      exit
		    end if
		    
		    out.WriteLine "  "+tmpStr1+" "+tmpStr2+" = """+tmpStr3+""", "+hex(options )
		    if ( BitwiseAnd (options , kXMP_SchemaNode)=0 ) then
		      tmpStr4=""
		      
		      ok = meta.GetProperty ( tmpStr1, tmpStr2, tmpStr4, opt2 )
		      if ( (not ok) or (tmpStr4 <> tmpStr3) or (opt2 <> options) ) then
		        out.WriteLine "    ** GetProperty failed: "+FoundOrNot(ok)+" "+ tmpStr4+" "+ hex(opt2 )
		      end if
		    end if
		  wend 
		  
		  
		  iter = new XMPIteratorMBS( meta, kXMP_IterOmitQualifiers )
		  WriteMinorLabel ( "Iterate omitting qualifiers" )
		  while ( true )
		    tmpStr1=""
		    tmpStr2=""
		    tmpStr3=""
		    
		    if ( not iter.NextItem ( tmpStr1, tmpStr2, tmpStr3, options ) ) then
		      exit
		    end if
		    
		    out.WriteLine "  "+tmpStr1+" "+tmpStr2+" = """+tmpStr3+""", "+hex(options )
		    if ( BitwiseAnd (options , kXMP_SchemaNode)=0 ) then
		      tmpStr4=""
		      
		      ok = meta.GetProperty ( tmpStr1, tmpStr2, tmpStr4, opt2 )
		      if ( (not ok) or (tmpStr4 <> tmpStr3) or (opt2 <> options) ) then
		        out.WriteLine "    ** GetProperty failed: "+FoundOrNot(ok)+" "+ tmpStr4+" "+ hex(opt2 )
		      end if
		      
		    end if
		  wend
		  
		  
		  iter = new XMPIteratorMBS( meta, kXMP_IterJustLeafName )
		  WriteMinorLabel ( "Iterate with just leaf names" )
		  while ( true )
		    tmpStr1=""
		    tmpStr2=""
		    tmpStr3=""
		    
		    if ( not iter.NextItem ( tmpStr1, tmpStr2, tmpStr3, options ) ) then
		      exit
		    end if
		    out.WriteLine "  "+tmpStr1+" "+tmpStr2+" = """+tmpStr3+""", "+hex(options )
		  wend
		  
		  iter = new XMPIteratorMBS( meta, kXMP_IterJustLeafNodes )
		  WriteMinorLabel ( "Iterate just the leaf nodes" )
		  while ( true )
		    tmpStr1=""
		    tmpStr2=""
		    tmpStr3=""
		    
		    if ( not iter.NextItem ( tmpStr1, tmpStr2, tmpStr3, options ) ) then
		      exit
		    end if
		    
		    out.WriteLine "  "+tmpStr1+" "+tmpStr2+" = """+tmpStr3+""", "+hex(options )
		    if ( BitwiseAnd (options , kXMP_SchemaNode)=0 ) then
		      tmpStr4=""
		      
		      ok = meta.GetProperty ( tmpStr1, tmpStr2, tmpStr4, opt2 )
		      if ( (not ok) or (tmpStr4 <> tmpStr3) or (opt2 <> options) ) then
		        out.WriteLine "    ** GetProperty failed: "+FoundOrNot(ok)+" "+ tmpStr4+" "+ hex(opt2 )
		      end if
		    end if
		  wend
		  
		  iter = new XMPIteratorMBS( meta, kXMP_IterJustChildren )
		  WriteMinorLabel ( "Iterate just the schema nodes" )
		  while ( true )
		    tmpStr1=""
		    tmpStr2=""
		    tmpStr3=""
		    
		    if ( not iter.NextItem ( tmpStr1, tmpStr2, tmpStr3, options ) ) then 
		      exit
		    end if
		    
		    out.WriteLine "  "+tmpStr1+" "+tmpStr2+" = """+tmpStr3+""", "+hex(options )
		  wend
		  
		  iter = new XMPIteratorMBS( meta, kNS2 )
		  WriteMinorLabel ( "Iterate the ns2: namespace" )
		  while ( true )
		    tmpStr1=""
		    tmpStr2=""
		    tmpStr3=""
		    
		    if ( not iter.NextItem ( tmpStr1, tmpStr2, tmpStr3, options ) ) then
		      exit
		    end if
		    
		    out.WriteLine "  "+tmpStr1+" "+tmpStr2+" = """+tmpStr3+""", "+hex(options )
		    if ( BitwiseAnd (options , kXMP_SchemaNode)=0 ) then
		      tmpStr4=""
		      
		      ok = meta.GetProperty ( tmpStr1, tmpStr2, tmpStr4, opt2 )
		      if ( (not ok) or (tmpStr4 <> tmpStr3) or (opt2 <> options) ) then
		        out.WriteLine "    ** GetProperty failed: "+FoundOrNot(ok)+" "+ tmpStr4+" "+ hex(opt2 )
		      end if
		    end if
		  wend 
		  
		  iter = new XMPIteratorMBS( meta, kNS2, "Bag" )
		  WriteMinorLabel ( "Start at ns2:Bag" )
		  while ( true )
		    tmpStr1=""
		    tmpStr2=""
		    tmpStr3=""
		    
		    if ( not iter.NextItem ( tmpStr1, tmpStr2, tmpStr3, options ) ) then
		      exit
		    end if
		    
		    out.WriteLine "  "+tmpStr1+" "+tmpStr2+" = """+tmpStr3+""", "+hex(options )
		    if ( BitwiseAnd (options , kXMP_SchemaNode)=0 ) then
		      tmpStr4=""
		      
		      ok = meta.GetProperty ( tmpStr1, tmpStr2, tmpStr4, opt2 )
		      if ( (not ok) or (tmpStr4 <> tmpStr3) or (opt2 <> options) ) then
		        out.WriteLine "    ** GetProperty failed: "+FoundOrNot(ok)+" "+ tmpStr4+" "+ hex(opt2 )
		      end if
		    end if
		  wend
		  
		  iter = new XMPIteratorMBS( meta, kNS2, "NestedStructProp/ns1:Outer" )
		  WriteMinorLabel ( "Start at ns2:NestedStructProp/ns1:Outer" )
		  while ( true )
		    tmpStr1=""
		    tmpStr2=""
		    tmpStr3=""
		    
		    if ( not iter.NextItem ( tmpStr1, tmpStr2, tmpStr3, options ) ) then
		      exit
		    end if
		    
		    out.WriteLine "  "+tmpStr1+" "+tmpStr2+" = """+tmpStr3+""", "+hex(options )
		    if ( BitwiseAnd (options , kXMP_SchemaNode)=0 ) then
		      tmpStr4=""
		      
		      ok = meta.GetProperty ( tmpStr1, tmpStr2, tmpStr4, opt2 )
		      if ( (not ok) or (tmpStr4 <> tmpStr3) or (opt2 <> options) ) then
		        out.WriteLine "    ** GetProperty failed: "+FoundOrNot(ok)+" "+ tmpStr4+" "+ hex(opt2 )
		      end if
		    end if
		  wend
		  
		  iter = new XMPIteratorMBS( meta, "ns:empty/" )
		  WriteMinorLabel ( "Iterate an empty namespace" )
		  while ( true )
		    tmpStr1=""
		    tmpStr2=""
		    tmpStr3=""
		    
		    if ( not iter.NextItem ( tmpStr1, tmpStr2, tmpStr3, options ) ) then 
		      exit
		    end if
		    
		    out.WriteLine "  "+tmpStr1+" "+tmpStr2+" = """+tmpStr3+""", "+hex(options )
		    if ( BitwiseAnd (options , kXMP_SchemaNode)=0 ) then
		      tmpStr4=""
		      
		      ok = meta.GetProperty ( tmpStr1, tmpStr2, tmpStr4, opt2 )
		      if ( (not ok) or (tmpStr4 <> tmpStr3) or (opt2 <> options) ) then
		        out.WriteLine "    ** GetProperty failed: "+FoundOrNot(ok)+" "+ tmpStr4+" "+ hex(opt2 )
		      end if
		    end if
		    
		  wend
		  
		  iter = new XMPIteratorMBS( meta, kNS2, "", kXMP_IterJustChildren + kXMP_IterJustLeafName )
		  WriteMinorLabel ( "Iterate the top of the ns2: namespace with just leaf names" )
		  while ( true )
		    tmpStr1=""
		    tmpStr2=""
		    tmpStr3=""
		    
		    if ( not iter.NextItem ( tmpStr1, tmpStr2, tmpStr3, options ) ) then
		      exit
		    end if
		    
		    out.WriteLine "  "+tmpStr1+" "+tmpStr2+" = """+tmpStr3+""", "+hex(options )
		  wend
		  
		  iter = new XMPIteratorMBS ( meta, kNS2, "", kXMP_IterJustChildren + kXMP_IterJustLeafNodes )
		  WriteMinorLabel ( "Iterate the top of the ns2: namespace visiting just leaf nodes" )
		  while ( true )
		    tmpStr1=""
		    tmpStr2=""
		    tmpStr3=""
		    
		    if ( not iter.NextItem ( tmpStr1, tmpStr2, tmpStr3, options ) ) then 
		      exit
		    end if
		    
		    out.WriteLine "  "+tmpStr1+" "+tmpStr2+" = """+tmpStr3+""", "+hex(options )
		    if ( BitwiseAnd (options , kXMP_SchemaNode)=0 ) then
		      tmpStr4=""
		      
		      ok = meta.GetProperty ( tmpStr1, tmpStr2, tmpStr4, opt2 )
		      if ( (not ok) or (tmpStr4 <> tmpStr3) or (opt2 <> options) ) then
		        out.WriteLine "    ** GetProperty failed: "+FoundOrNot(ok)+" "+ tmpStr4+" "+ hex(opt2 )
		      end if
		    end if
		  wend
		  
		  iter = new XMPIteratorMBS ( meta, kNS2, "Bag", kXMP_IterJustChildren )
		  WriteMinorLabel ( "Iterate just the children of ns2:Bag" )
		  while ( true )
		    tmpStr1=""
		    tmpStr2=""
		    tmpStr3=""
		    
		    if ( not iter.NextItem ( tmpStr1, tmpStr2, tmpStr3, options ) ) then
		      exit
		    end if
		    
		    out.WriteLine "  "+tmpStr1+" "+tmpStr2+" = """+tmpStr3+""", "+hex(options )
		    if ( BitwiseAnd (options , kXMP_SchemaNode)=0 ) then
		      tmpStr4=""
		      
		      ok = meta.GetProperty ( tmpStr1, tmpStr2, tmpStr4, opt2 )
		      if ( (not ok) or (tmpStr4 <> tmpStr3) or (opt2 <> options) ) then
		        out.WriteLine "    ** GetProperty failed: "+FoundOrNot(ok)+" "+ tmpStr4+" "+ hex(opt2 )
		      end if
		    end if
		  wend
		  
		  iter = new XMPIteratorMBS ( meta, kNS2, "Bag", kXMP_IterJustChildren + kXMP_IterJustLeafName )
		  WriteMinorLabel ( "Iterate just the children of ns2:Bag with just leaf names" )
		  while ( true )
		    tmpStr1=""
		    tmpStr2=""
		    tmpStr3=""
		    
		    if ( not iter.NextItem ( tmpStr1, tmpStr2, tmpStr3, options ) ) then
		      exit
		    end if
		    
		    out.WriteLine "  "+tmpStr1+" "+tmpStr2+" = """+tmpStr3+""", "+hex(options )
		  wend
		  
		  iter = new XMPIteratorMBS ( meta, kNS2, "NestedStructProp/ns1:Outer/ns1:Middle", kXMP_IterJustChildren )
		  WriteMinorLabel ( "Iterate just the children of ns2:NestedStructProp/ns1:Outer/ns1:Middle" )
		  while ( true )
		    tmpStr1=""
		    tmpStr2=""
		    tmpStr3=""
		    
		    if ( not iter.NextItem ( tmpStr1, tmpStr2, tmpStr3, options ) ) then
		      exit
		    end if
		    
		    out.WriteLine "  "+tmpStr1+" "+tmpStr2+" = """+tmpStr3+""", "+hex(options )
		    if ( BitwiseAnd (options , kXMP_SchemaNode)=0 ) then
		      tmpStr4=""
		      
		      ok = meta.GetProperty ( tmpStr1, tmpStr2, tmpStr4, opt2 )
		      if ( (not ok) or (tmpStr4 <> tmpStr3) or (opt2 <> options) ) then
		        out.WriteLine "    ** GetProperty failed: "+FoundOrNot(ok)+" "+ tmpStr4+" "+ hex(opt2 )
		      end if
		    end if
		  wend
		  
		  iter = new XMPIteratorMBS( meta )
		  WriteMinorLabel ( "Skip children of ArrayProp2, and siblings after StructProp" )
		  while ( true )
		    tmpStr1=""
		    tmpStr2=""
		    tmpStr3=""
		    
		    if ( not iter.NextItem ( tmpStr1, tmpStr2, tmpStr3, options ) ) then
		      exit
		    end if
		    
		    out.WriteLine "  "+tmpStr1+" "+tmpStr2+" = """+tmpStr3+""", "+hex(options )
		    if ( BitwiseAnd (options , kXMP_SchemaNode)=0 ) then
		      tmpStr4=""
		      
		      ok = meta.GetProperty ( tmpStr1, tmpStr2, tmpStr4, opt2 )
		      if ( (not ok) or (tmpStr4 <> tmpStr3) or (opt2 <> options) ) then
		        out.WriteLine "    ** GetProperty failed: "+FoundOrNot(ok)+" "+ tmpStr4+" "+ hex(opt2 )
		      end if
		      
		      if ( tmpStr2 = "ns1:ArrayProp2" ) then
		        iter.Skip ( kXMP_IterSkipSubtree )
		      end if
		      
		      if ( tmpStr2 = "ns1:StructProp" ) then
		        iter.Skip ( kXMP_IterSkipSiblings )
		      end if
		    end if
		  wend
		  
		  meta = new XMPMetaMBS
		  
		  meta.SetProperty ( kXMP_NS_PDF, "Author", "PDF Author" )
		  meta.SetProperty ( kXMP_NS_PDF, "PDFProp", "PDF Prop" )
		  meta.SetProperty ( kXMP_NS_XMP, "XMPProp", "XMP Prop" )
		  meta.SetProperty ( kXMP_NS_DC, "DCProp", "DC Prop" )
		  
		  iter1=new XMPIteratorMBS ( meta )
		  WriteMinorLabel ( "Iterate without showing aliases" )
		  while ( true )
		    tmpStr1=""
		    tmpStr2=""
		    tmpStr3=""
		    
		    if ( not iter1.NextItem ( tmpStr1, tmpStr2, tmpStr3, options ) ) then
		      exit
		    end if
		    
		    out.WriteLine "  "+tmpStr1+" "+tmpStr2+" = """+tmpStr3+""", "+hex(options )
		    if ( BitwiseAnd (options , kXMP_SchemaNode)=0 ) then
		      tmpStr4=""
		      
		      options = kXMP_PropHasAliases // So the comparison below works.
		      ok = meta.GetProperty ( tmpStr1, tmpStr2, tmpStr4, opt2 )
		      if ( (not ok) or (tmpStr4 <> tmpStr3) or (opt2 <> options) ) then
		        out.WriteLine "    ** GetProperty failed: "+FoundOrNot(ok)+" "+ tmpStr4+" "+ hex(opt2 )
		      end if
		    end if
		  wend
		  
		  iter2=new XMPIteratorMBS ( meta, kXMP_IterIncludeAliases )
		  WriteMinorLabel ( "Iterate showing aliases" )
		  while ( true )
		    tmpStr1=""
		    tmpStr2=""
		    tmpStr3=""
		    
		    if ( not iter2.NextItem ( tmpStr1, tmpStr2, tmpStr3, options ) ) then
		      exit
		    end if
		    
		    out.WriteLine "  "+tmpStr1+" "+tmpStr2+" = """+tmpStr3+""", "+hex(options )
		    if ( BitwiseAnd (options , kXMP_SchemaNode)=0 ) then
		      tmpStr4=""
		      
		      ok = meta.GetProperty ( tmpStr1, tmpStr2, tmpStr4, opt2 )
		      if ( (not ok) or (tmpStr4 <> tmpStr3)  ) then
		        out.WriteLine "    ** GetProperty failed: "+FoundOrNot(ok)+" "+ tmpStr4+" "+ hex(opt2 )
		      end if
		    end if
		  wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DoXMPCoverage8()
		  dim tmpStr1 as string
		  dim tmpStr2 as string
		  dim meta as XMPMetaMBS
		  dim ok as Boolean
		  dim options as integer
		  
		  // --------------------------------------------------------------------------------------------
		  // XPath composition utilities
		  // ---------------------------
		  
		  WriteMajorLabel ( "Test XPath composition utilities" )
		  
		  meta =new XMPMetaMBS( kSimpleRDF)
		  DumpXMPObj ( meta, "Parse simple RDF" )
		  out.WriteLine
		  
		  tmpStr1= meta.ComposeArrayItemPath ( kNS1, "ArrayProp", 2 )
		  out.WriteLine "ComposeArrayItemPath ns1:ArrayProp[2] : "+tmpStr1
		  meta.SetProperty ( kNS1, tmpStr1, "new ns1:ArrayProp[2] value" )
		  
		  out.WriteLine
		  
		  tmpStr1=meta.ComposeStructFieldPath ( kNS1, "StructProp", kNS2, "Field3" )
		  out.WriteLine "ComposeStructFieldPath ns1:StructProp/ns2:Field3 : "+tmpStr1
		  meta.SetProperty ( kNS1, tmpStr1, "new ns1:StructProp/ns2:Field3 value" )
		  
		  tmpStr1=meta.ComposeQualifierPath ( kNS1, "QualProp", kNS2, "Qual" )
		  out.WriteLine "ComposeQualifierPath ns1:QualProp/?ns2:Qual : "+tmpStr1
		  meta.SetProperty ( kNS1, tmpStr1, "new ns1:QualProp/?ns2:Qual value" )
		  
		  out.WriteLine
		  
		  tmpStr1=meta.ComposeQualifierPath ( kNS1, "AltTextProp", kXMP_NS_XML, "lang" )
		  out.WriteLine "ComposeQualifierPath ns1:AltTextProp/?xml:lang : "+tmpStr1
		  meta.SetProperty ( kNS1, tmpStr1, "new ns1:AltTextProp/?xml:lang value" )
		  
		  tmpStr2 = "x-two"
		  tmpStr1= meta.ComposeLangSelector ( kNS1, "AltTextProp", tmpStr2 )
		  out.WriteLine "ComposeLangSelector ns1:AltTextProp['x-two'] : "+tmpStr1
		  meta.SetProperty ( kNS1, tmpStr1, "new ns1:AltTextProp['x-two'] value" )
		  
		  out.WriteLine
		  
		  out.WriteLine "Check field selector usage" 
		  
		  tmpStr1=""
		  
		  ok = meta.GetProperty ( kNS1, "ArrayOfStructProp[ns2:Field1='Item-2']", tmpStr1, options )
		  out.WriteLine "GetProperty ArrayOfStructProp[ns2:Field1='Item-2'] : "+FoundOrNot ( ok )+" "+tmpStr1+" "+hex(options )
		  
		  tmpStr1=""
		  
		  ok = meta.GetProperty ( kNS1, "ArrayOfStructProp[ns2:Field1='Item-2']/ns2:Field2", tmpStr1, options )
		  out.WriteLine "GetProperty ArrayOfStructProp[ns2:Field1='Item-2']/ns2:Field2 : "+FoundOrNot ( ok )+" "+tmpStr1+" "+hex(options )
		  
		  tmpStr2 = "Item-2"
		  tmpStr1=meta.ComposeFieldSelector ( kNS1, "ArrayOfStructProp", kNS2, "Field1", tmpStr2 )
		  out.WriteLine "ComposeFieldSelector ns1:ArrayOfStructProp[ns2:Field1=Item-2] : "+tmpStr1
		  
		  tmpStr2=meta.ComposeStructFieldPath ( kNS1, tmpStr1, kNS2, "Field2" )
		  out.WriteLine "ComposeStructFieldPath ns1:ArrayOfStructProp[ns2:Field1=Item-2]/ns2:Field2 : "+tmpStr2
		  meta.SetProperty ( kNS1, tmpStr2, "new ns1:ArrayOfStructProp[ns2:Field1=Item-2]/ns2:Field2 value" )
		  
		  DumpXMPObj ( meta, "Modified simple RDF" )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DoXMPCoverage9()
		  dim tmpStr1 as string
		  dim m as new XMPMetaMBS
		  dim ok as Boolean
		  dim int1 as integer
		  dim date1 as XMPDateTimeMBS
		  dim date2 as XMPDateTimeMBS
		  dim float1 as Double
		  
		  // --------------------------------------------------------------------------------------------
		  // Value conversion utilities
		  // --------------------------
		  
		  WriteMajorLabel ( "Test value conversion utilities" )
		  out.WriteLine
		  
		  tmpStr1=""
		  
		  tmpStr1= m.ConvertFromBool ( true )
		  out.WriteLine "ConverFromBool true "+tmpStr1
		  tmpStr1=""
		  
		  tmpStr1=m.ConvertFromBool ( false )
		  out.WriteLine "ConverFromBool false "+tmpStr1
		  
		  out.WriteLine
		  
		  ok = m.ConvertToBool ( kXMP_TrueStr )
		  out.WriteLine "ConverToBool kXMP_TrueStr: "+bool(ok)
		  ok = m.ConvertToBool ( kXMP_FalseStr )
		  out.WriteLine "ConverToBool kXMP_FalseStr: "+bool(ok)
		  
		  out.WriteLine
		  
		  tmpStr1 = "true"
		  ok = m.ConvertToBool ( tmpStr1 )
		  out.WriteLine "ConverToBool true : "+bool(ok)
		  ok = m.ConvertToBool ( "TRUE" )
		  out.WriteLine "ConverToBool TRUE : "+bool(ok)
		  ok = m.ConvertToBool ( "t" )
		  out.WriteLine "ConverToBool t : "+bool(ok)
		  ok = m.ConvertToBool ( "1" )
		  out.WriteLine "ConverToBool 1 : "+bool(ok)
		  
		  out.WriteLine
		  
		  ok = m.ConvertToBool ( "false" )
		  out.WriteLine "ConverToBool false : "+bool(ok)
		  ok = m.ConvertToBool ( "FALSE" )
		  out.WriteLine "ConverToBool FALSE : "+bool(ok)
		  ok = m.ConvertToBool ( "f" )
		  out.WriteLine "ConverToBool f : "+bool(ok)
		  ok = m.ConvertToBool ( "0" )
		  out.WriteLine "ConverToBool 0 : "+bool(ok)
		  
		  out.WriteLine
		  
		  tmpStr1=""
		  
		  tmpStr1= m.ConvertFromInt ( 0, "" )
		  out.WriteLine "ConverFromInt 0 : "+tmpStr1
		  tmpStr1=""
		  
		  tmpStr1= m.ConvertFromInt ( 42, "" )
		  out.WriteLine "ConverFromInt 42 : "+tmpStr1
		  tmpStr1=""
		  tmpStr1= m.ConvertFromInt ( -42, "" )
		  out.WriteLine "ConverFromInt -42 : "+tmpStr1
		  tmpStr1=""
		  
		  tmpStr1= m.ConvertFromInt ( &h7FFFFFFF, "" )
		  out.WriteLine "ConverFromInt &h7FFFFFFF : "+tmpStr1
		  tmpStr1=""
		  
		  tmpStr1= m.ConvertFromInt ( &h80000000, "" )
		  out.WriteLine "ConverFromInt &h80000000 : "+tmpStr1
		  tmpStr1=""
		  
		  tmpStr1= m.ConvertFromInt ( &h7FFFFFFF, "%X" )
		  out.WriteLine "ConverFromInt &h7FFFFFFF as hex : "+tmpStr1
		  tmpStr1=""
		  
		  tmpStr1= m.ConvertFromInt ( &h80000000, "%X" )
		  out.WriteLine "ConverFromInt &h80000000 as hex : "+tmpStr1
		  
		  out.WriteLine
		  
		  tmpStr1 = "0"
		  int1 = m.ConvertToInt ( tmpStr1 )
		  out.WriteLine "ConvertToInt 0 : "+str(int1)
		  int1 = m.ConvertToInt ( "42" )
		  out.WriteLine "ConvertToInt 42 : "+str(int1)
		  int1 = m.ConvertToInt ( "-42" )
		  out.WriteLine "ConvertToInt -42 : "+str(int1)
		  int1 = m.ConvertToInt ( "0x7FFFFFFF" )
		  out.WriteLine "ConvertToInt &h7FFFFFFF : "+str(int1)
		  int1 = m.ConvertToInt ( "0x80000000" )
		  out.WriteLine "ConvertToInt &h80000000 : "+str(int1)
		  int1 = m.ConvertToInt ( "0x7FFFFFFF" )
		  out.WriteLine "ConvertToInt &h7FFFFFFF as hex : "+hex(int1)
		  int1 = m.ConvertToInt ( "0x80000000" )
		  out.WriteLine "ConvertToInt &h80000000 as hex : "+hex(int1)
		  
		  out.WriteLine
		  
		  tmpStr1=""
		  
		  tmpStr1= m.ConvertFromFloat ( 0, "" )
		  out.WriteLine "ConverFromFloat 0 : "+tmpStr1
		  tmpStr1=""
		  
		  tmpStr1= m.ConvertFromFloat ( 4.2, "" )
		  out.WriteLine "ConverFromFloat 4.2 : "+tmpStr1
		  tmpStr1=""
		  
		  tmpStr1= m.ConvertFromFloat ( -4.2, "" )
		  out.WriteLine "ConverFromFloat -4.2 : "+tmpStr1
		  tmpStr1=""
		  
		  tmpStr1= m.ConvertFromFloat ( &h7FFFFFFF, "" )
		  out.WriteLine "ConverFromFloat 0x7FFFFFFF : "+tmpStr1
		  tmpStr1=""
		  
		  tmpStr1= m.ConvertFromFloat ( &h80000000, "" )
		  out.WriteLine "ConverFromFloat 0x80000000 : "+tmpStr1
		  tmpStr1=""
		  
		  tmpStr1= m.ConvertFromFloat ( &h7FFFFFFF, "%f" )
		  out.WriteLine "ConverFromFloat 0x7FFFFFFF as f : "+tmpStr1
		  tmpStr1=""
		  
		  tmpStr1= m.ConvertFromFloat ( &h80000000, "%f" )
		  out.WriteLine "ConverFromFloat 0x80000000 as f : "+tmpStr1
		  
		  out.WriteLine
		  
		  
		  tmpStr1 = "0"
		  float1 = m.ConvertToFloat ( tmpStr1 )
		  out.WriteLine "ConvertToFloat 0 : "+str(float1 )
		  float1 = m.ConvertToFloat ( "4.2" )
		  out.WriteLine "ConvertToFloat 4.2 : "+str(float1 )
		  float1 = m.ConvertToFloat ( "-4.2" )
		  out.WriteLine "ConvertToFloat -4.2 : "+str(float1 )
		  
		  out.WriteLine
		  
		  date1=new XMPDateTimeMBS
		  date1.Year=2006
		  date1.Month=1
		  date1.day=31
		  date1.Hour=12
		  date1.Minute=34
		  date1.Second=56
		  date1.TimezoneSign=-1
		  date1.TimezoneHour=8
		  date1.TimezoneMinute=0
		  date1.NanoSecond=0
		  
		  tmpStr1=m.ConvertFromDate ( date1 )
		  out.WriteLine "ConvertFromDate 2000 Jan 31 12:34:56 PST : "+tmpStr1
		  
		  date2=m.ConvertToDate ( tmpStr1 )
		  out.WriteLine "ConvertToDate : "+str(date2.Year)+"-"+str(date2.Month)+"-"+str(date2.Day)+" "+str(date2.Hour)+":"+str(date2.Minute)+":"+str(date2.Second)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DumpXMPObj(meta as xmpmetambs, title as string)
		  dim t as new MyXMPTextOutputMBS(out)
		  
		  WriteMinorLabel title
		  
		  call meta.DumpObject(t)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FoundOrNot(b as boolean) As string
		  if b then
		    Return "found"
		  else
		    Return "not found"
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub VerifyNewlines(out as textoutputStream, s as string, eol as string)
		  dim t as string
		  
		  t=ReplaceLineEndings(s,eol)
		  
		  if StrComp(s,t,0)=0 then
		    'ok
		  else
		    out.Write "** Wrong newline in text!"
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub WriteMajorLabel(title as string)
		  out.WriteLine
		  out.WriteLine "// ============================================================================="
		  out.WriteLine "// "+title
		  out.WriteLine "// ============================================================================="
		  out.WriteLine
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub WriteMinorLabel(title as string)
		  dim s as string
		  dim i,c as integer
		  
		  c=len(title)
		  s="--"
		  for i=1 to c
		    s=s+"-"
		  next
		  
		  out.WriteLine
		  out.WriteLine "//"+s
		  out.WriteLine "// "+title+":"
		  out.WriteLine
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function YesOrNo(b as boolean) As string
		  if b then
		    Return "yes"
		  else
		    Return "no"
		  end if
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected out As textoutputStream
	#tag EndProperty


	#tag Constant, Name = kDateTimeRDF, Type = String, Dynamic = False, Default = \"<rdf:RDF xmlns:rdf\x3D\'http://www.w3.org/1999/02/22-rdf-syntax-ns#\'>\r  <rdf:Description rdf:about\x3D\'Test:APICoverage/kDateTimeRDF\' xmlns:ns1\x3D\'ns:test1/\'>\r\r    <ns1:Date1>2003</ns1:Date1>\r    <ns1:Date2>2003-12</ns1:Date2>\r    <ns1:Date3>2003-12-31</ns1:Date3>\r\r    <ns1:Date4>2003-12-31T12:34Z</ns1:Date4>\r    <ns1:Date5>2003-12-31T12:34:56Z</ns1:Date5>\r\r    <ns1:Date6>2003-12-31T12:34:56.001Z</ns1:Date6>\r    <ns1:Date7>2003-12-31T12:34:56.000000001Z</ns1:Date7>\r\r    <ns1:Date8>2003-12-31T10:04:56-02:30</ns1:Date8>\r    <ns1:Date9>2003-12-31T15:49:56+03:15</ns1:Date9>\r\r  </rdf:Description>\r</rdf:RDF>\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kInconsistentRDF, Type = String, Dynamic = False, Default = \"<rdf:RDF xmlns:rdf\x3D\'http://www.w3.org/1999/02/22-rdf-syntax-ns#\'>\r  <rdf:Description rdf:about\x3D\'Test:APICoverage/kInconsistentRDF\'\r                   xmlns:pdf\x3D\'http://ns.adobe.com/pdf/1.3/\'\r                   xmlns:xmp\x3D\'http://ns.adobe.com/xap/1.0/\'\r                   xmlns:dc\x3D\'http://purl.org/dc/elements/1.1/\'>\r\r    <pdf:Author>PDF Author</pdf:Author>\r    <xmp:Author>XMP Author</xmp:Author>\r\r    <xmp:Authors>\r      <rdf:Seq>\r        <rdf:li>XMP Authors [1]</rdf:li>\r      </rdf:Seq>\r    </xmp:Authors>\r\r    <dc:creator>\r      <rdf:Seq>\r        <rdf:li>DC Creator [1]</rdf:li>\r      </rdf:Seq>\r    </dc:creator>\r\r  </rdf:Description>\r</rdf:RDF>", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kNamespaceRDF, Type = String, Dynamic = False, Default = \"<rdf:RDF xmlns:rdf\x3D\'http://www.w3.org/1999/02/22-rdf-syntax-ns#\'>\r  <rdf:Description rdf:about\x3D\'Test:APICoverage/kNamespaceRDF\' xmlns:ns1\x3D\'ns:test1/\'>\r\r    <ns1:NestedStructProp rdf:parseType\x3D\'Resource\'>\r      <ns2:Outer rdf:parseType\x3D\'Resource\' xmlns:ns2\x3D\'ns:test2/\' xmlns:ns3\x3D\'ns:test3/\'>\r        <ns3:Middle rdf:parseType\x3D\'Resource\' xmlns:ns4\x3D\'ns:test4/\'>\r          <ns4:Inner rdf:parseType\x3D\'Resource\' xmlns:ns5\x3D\'ns:test5/\' xmlns:ns6\x3D\'ns:test6/\'>\r            <ns5:Field1>Field1 value</ns5:Field1>\r            <ns6:Field2>Field2 value</ns6:Field2>\r          </ns4:Inner>\r        </ns3:Middle>\r      </ns2:Outer>\r    </ns1:NestedStructProp>\r\r  </rdf:Description>\r</rdf:RDF>", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kNewlineRDF, Type = String, Dynamic = False, Default = \"<rdf:RDF xmlns:rdf\x3D\'http://www.w3.org/1999/02/22-rdf-syntax-ns#\'>\r  <rdf:Description rdf:about\x3D\'Test:APICoverage/kNewlineRDF\' xmlns:ns1\x3D\'ns:test1/\'>\r\r    <ns1:HasCR>ASCII &#xD; CR</ns1:HasCR>\r    <ns1:HasLF>ASCII &#xA; LF</ns1:HasLF>\r    <ns1:HasCRLF>ASCII &#xD;&#xA; CRLF</ns1:HasCRLF>\r\r  </rdf:Description>\r</rdf:RDF>", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kNS1, Type = String, Dynamic = False, Default = \"ns:test1/", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kNS2, Type = String, Dynamic = False, Default = \"ns:test2/", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kRDFCoverage, Type = String, Dynamic = False, Default = \"<rdf:RDF xmlns:rdf\x3D\'http://www.w3.org/1999/02/22-rdf-syntax-ns#\'>\r  <rdf:Description rdf:about\x3D\'Test:APICoverage/kRDFCoverage\' xmlns:ns1\x3D\'ns:test1/\' xmlns:ns2\x3D\'ns:test2/\'>\r\r    <ns1:SimpleProp1>Simple1 value</ns1:SimpleProp1>\r    <ns1:SimpleProp2 xml:lang\x3D\'x-default\'>Simple2 value</ns1:SimpleProp2>\r\r    <ns1:ArrayProp1>\r      <rdf:Bag>\r        <rdf:li>Item1.1 value</rdf:li>\r        <rdf:li>Item1.2 value</rdf:li>\r      </rdf:Bag>\r    </ns1:ArrayProp1>\r\r    <ns1:ArrayProp2>\r      <rdf:Alt>\r        <rdf:li xml:lang\x3D\'x-one\'>Item2.1 value</rdf:li>\r        <rdf:li xml:lang\x3D\'x-two\'>Item2.2 value</rdf:li>\r      </rdf:Alt>\r    </ns1:ArrayProp2>\r\r    <ns1:ArrayProp3>\r      <rdf:Alt>\r        <rdf:li xml:lang\x3D\'x-one\'>Item3.1 value</rdf:li>\r        <rdf:li>Item3.2 value</rdf:li>\r      </rdf:Alt>\r    </ns1:ArrayProp3>\r\r    <ns1:ArrayProp4>\r      <rdf:Alt>\r        <rdf:li>Item4.1 value</rdf:li>\r        <rdf:li xml:lang\x3D\'x-two\'>Item4.2 value</rdf:li>\r      </rdf:Alt>\r    </ns1:ArrayProp4>\r\r    <ns1:ArrayProp5>\r      <rdf:Alt>\r        <rdf:li xml:lang\x3D\'x-xxx\'>Item5.1 value</rdf:li>\r        <rdf:li xml:lang\x3D\'x-xxx\'>Item5.2 value</rdf:li>\r      </rdf:Alt>\r    </ns1:ArrayProp5>\r\r    <ns1:StructProp rdf:parseType\x3D\'Resource\'>\r      <ns2:Field1>Field1 value</ns2:Field1>\r      <ns2:Field2>Field2 value</ns2:Field2>\r    </ns1:StructProp>\r\r    <ns1:QualProp1 rdf:parseType\x3D\'Resource\'>\r      <rdf:value>Prop value</rdf:value>\r      <ns2:Qual>Qual value</ns2:Qual>\r    </ns1:QualProp1>\r\r    <ns1:QualProp2 rdf:parseType\x3D\'Resource\'>\r      <rdf:value xml:lang\x3D\'x-default\'>Prop value</rdf:value>\r      <ns2:Qual>Qual value</ns2:Qual>\r    </ns1:QualProp2>\r\r    <!-- NOTE: QualProp3 is not quite kosher. Normally a qualifier on a struct is attached to the -->\r    <!-- struct node in the XMP tree\x2C and the same for an array. See QualProp4 and QualProp5. But -->\r    <!-- for the pseudo-struct of a qualified simple property there is no final struct node that  -->\r    <!-- can own the qualifier. Instead the qualifier is attached to the value. The alternative   -->\r    <!-- of attaching the qualifier to the value and all other qualifiers is not compelling. This -->\r    <!-- issue only arises for xml:lang\x2C it is the only qualifier that RDF has as an attribute.   -->\r\r    <ns1:QualProp3 xml:lang\x3D\'x-default\' rdf:parseType\x3D\'Resource\'>\r      <rdf:value>Prop value</rdf:value>\r      <ns2:Qual>Qual value</ns2:Qual>\r    </ns1:QualProp3>\r\r    <ns1:QualProp4 xml:lang\x3D\'x-default\' rdf:parseType\x3D\'Resource\'>\r      <ns2:Field1>Field1 value</ns2:Field1>\r      <ns2:Field2>Field2 value</ns2:Field2>\r    </ns1:QualProp4>\r\r    <ns1:QualProp5 xml:lang\x3D\'x-default\'>\r      <rdf:Bag>\r        <rdf:li>Item1.1 value</rdf:li>\r        <rdf:li>Item1.2 value</rdf:li>\r      </rdf:Bag>\r    </ns1:QualProp5>\r\r    <ns2:NestedStructProp rdf:parseType\x3D\'Resource\'>\r      <ns1:Outer rdf:parseType\x3D\'Resource\'>\r        <ns1:Middle rdf:parseType\x3D\'Resource\'>\r          <ns1:Inner rdf:parseType\x3D\'Resource\'>\r            <ns1:Field1>Field1 value</ns1:Field1>\r            <ns2:Field2>Field2 value</ns2:Field2>\r          </ns1:Inner>\r        </ns1:Middle>\r      </ns1:Outer>\r    </ns2:NestedStructProp>\r\r  </rdf:Description>\r</rdf:RDF>", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSimpleRDF, Type = String, Dynamic = False, Default = \"<rdf:RDF xmlns:rdf\x3D\'http://www.w3.org/1999/02/22-rdf-syntax-ns#\'>\r  <rdf:Description rdf:about\x3D\'Test:APICoverage/kSimpleRDF\' xmlns:ns1\x3D\'ns:test1/\' xmlns:ns2\x3D\'ns:test2/\'>\r\r    <ns1:SimpleProp>Simple value</ns1:SimpleProp>\r\r    <ns1:ArrayProp>\r      <rdf:Bag>\r        <rdf:li>Item1 value</rdf:li>\r        <rdf:li>Item2 value</rdf:li>\r      </rdf:Bag>\r    </ns1:ArrayProp>\r\r    <ns1:StructProp rdf:parseType\x3D\'Resource\'>\r      <ns2:Field1>Field1 value</ns2:Field1>\r      <ns2:Field2>Field2 value</ns2:Field2>\r    </ns1:StructProp>\r\r    <ns1:QualProp rdf:parseType\x3D\'Resource\'>\r      <rdf:value>Prop value</rdf:value>\r      <ns2:Qual>Qual value</ns2:Qual>\r    </ns1:QualProp>\r\r    <ns1:AltTextProp>\r      <rdf:Alt>\r        <rdf:li xml:lang\x3D\'x-one\'>x-one value</rdf:li>\r        <rdf:li xml:lang\x3D\'x-two\'>x-two value</rdf:li>\r      </rdf:Alt>\r    </ns1:AltTextProp>\r\r    <ns1:ArrayOfStructProp>\r      <rdf:Bag>\r        <rdf:li rdf:parseType\x3D\'Resource\'>\r          <ns2:Field1>Item-1</ns2:Field1>\r          <ns2:Field2>Field 1.2 value</ns2:Field2>\r        </rdf:li>\r        <rdf:li rdf:parseType\x3D\'Resource\'>\r          <ns2:Field1>Item-2</ns2:Field1>\r          <ns2:Field2>Field 2.2 value</ns2:Field2>\r        </rdf:li>\r      </rdf:Bag>\r    </ns1:ArrayOfStructProp>\r\r  </rdf:Description>\r</rdf:RDF>", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kXMPMetaRDF, Type = String, Dynamic = False, Default = \"<x:Outermost xmlns:x\x3D\'adobe:ns:meta/\'>\r\r<rdf:RDF xmlns:rdf\x3D\'http://www.w3.org/1999/02/22-rdf-syntax-ns#\'>\r  <rdf:Description rdf:about\x3D\'Test:APICoverage/kBogusLeadingRDF\' xmlns:ns1\x3D\'ns:test1/\'>\r    <ns1:BogusLeadingProp>bogus packet</ns1:BogusLeadingProp>\r  </rdf:Description>\r</rdf:RDF>\r\r<x:xmpmeta>\r<rdf:RDF xmlns:rdf\x3D\'http://www.w3.org/1999/02/22-rdf-syntax-ns#\'>\r  <rdf:Description rdf:about\x3D\'Test:APICoverage/kXMPMetaRDF\' xmlns:ns1\x3D\'ns:test1/\'>\r    <ns1:XMPMetaProp>xmpmeta packet</ns1:XMPMetaProp>\r  </rdf:Description>\r</rdf:RDF>\r</x:xmpmeta>\r\r<rdf:RDF xmlns:rdf\x3D\'http://www.w3.org/1999/02/22-rdf-syntax-ns#\'>\r  <rdf:Description rdf:about\x3D\'Test:APICoverage/kBogusTrailingRDF\' xmlns:ns1\x3D\'ns:test1/\'>\r    <ns1:BogusTrailingProp>bogus packet</ns1:BogusTrailingProp>\r  </rdf:Description>\r</rdf:RDF>\r\r</x:Outermost>", Scope = Protected
	#tag EndConstant


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
			InitialValue="2147483648"
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
