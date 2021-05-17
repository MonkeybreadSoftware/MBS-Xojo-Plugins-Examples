#tag Module
Protected Module OAuthUtil
	#tag Method, Flags = &h0
		Function AccessToken(tknMthd As Integer) As Integer
		  Dim tokenURL As String ="https://api.twitter.com/oauth/access_token"
		  Select Case tknMthd
		  Case 1
		    tokenURL="https://api.twitter.com/oauth/access_token"
		  End Select
		  
		  Dim str1,str2,str3 As String
		  
		  str1=tokenURL
		  str1=EncodeURLComponent(str1)
		  str1="POST&"+str1+"&"
		  
		  str2="oauth_consumer_key="+gConsumer_Key
		  str2=str2+"&oauth_nonce="+RandomString(32)
		  str2=str2+"&oauth_signature_method=HMAC-SHA1"
		  str2=str2+"&oauth_timestamp="+MakeTimeStamp//1274401561
		  str2=str2+"&oauth_token="+gOAuth_Request_Token
		  str2=str2+"&oauth_verifier="+gOAuth_Verifier
		  str2=str2+"&oauth_version=1.0"
		  
		  str3=gConsumer_Secret+"&"+gOAuth_Request_Token_Secret//oauth_consumer_secret
		  Dim signature_base_string As String = str1+EncodeURLComponent(str2)
		  
		  Dim sha1class As New SHA1MBS
		  Dim hmacsha1 As String= sha1class.HMAC(str3,signature_base_string)
		  Dim signature_string As String = EncodeBase64(hmacsha1)
		  signature_string = EncodeURLComponent(signature_string)
		  
		  Dim res As String
		  
		  Select Case tknMthd
		  Case 1//Socket
		    Dim hsock as new HTTPSecureSocket
		    hsock.Secure = true
		    if gHttpProxyUse then
		      hsock.HTTPProxyAddress=gHttpProxyAdress
		      hsock.HTTPProxyPort=gHttpProxyPort
		    end if
		    
		    Dim str4 as String
		    str4="OAuth realm=""OAuth"", "
		    str4=str4+ReplaceAll(ReplaceAll(str2,"&",""", "),"=","=""")+", "
		    str4=str4+ "oauth_signature="""+signature_string+""""
		    hsock.SetRequestHeader("Authorization", str4)
		    
		    res=hsock.Post(tokenURL, 20)
		    gOAuthStatus=hsock.ErrorCode
		    
		  Else//CURL
		    dim header(-1) as string
		    dim c as new MyCURL
		    c.OptionVerbose=true
		    c.OptionURL = tokenURL+"?"+str2+"&oauth_signature="+signature_string
		    c.OptionCustomRequest="POST"
		    
		    if gHttpProxyUse then
		      c.OptionProxy=gHttpProxyAdress
		      c.OptionProxyPort=gHttpProxyPort
		    end if
		    
		    //header.Append "Content-Type: text/xml"
		    header.Append "application/x-www-form-urlencoded"
		    header.Append ""
		    c.SetOptionHTTPHeader header
		    
		    gOAuthStatus=c.Perform
		    res=c.OutputData
		    
		  End Select
		  
		  gOAuth_Access_Token=NthField(NthField(res,"oauth_token=",2),"&",1)
		  gOAuth_Access_Token_Secret=NthField(NthField(res,"oauth_token_secret=",2),"&",1)
		  gScreen_Name=NthField(NthField(res,"screen_name=",2),"&",1)
		  
		  Return gOAuthStatus
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DecodeUnicodeString(s As String) As String
		  'dim h as string = "30c8"
		  'dim s as string = encodings.utf8.chr(val("&h"+h))
		  
		  
		  Dim t As String
		  if Instr(s,"\u")>0 then
		    do
		      if MidB(s,1,2)="\u" then
		        t=t+encodings.utf8.chr(val("&h"+MidB(s,3,4)))
		        s=MidB(s,7)
		      else
		        t=t+MidB(s,1,1)
		        s=MidB(s,2)
		      end if
		    Loop Until s=""
		    return t
		  end if
		  return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoTweet(m As String, f As FolderItem, v As Integer=kTwitpicV2)
		  if f<>Nil then
		    Dim d As UploadCURL=GetTwitPicCURL(f,m,v)
		    gOAuthStatus=d.Perform
		    //Post for v2
		    m=""//erase message
		    if v=kTwitpicV2 then m=GetPostMsgV2(d.result)
		  end if
		  
		  if m<>"" then
		    //post only or twitpic api v2
		    Dim c As MyCURL=GetTwitterCURL("POST","http://twitter.com/statuses/update.xml","","status="+EncodeURLComponent(m))
		    gOAuthStatus=c.Perform
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetOAuthPin(s As String) As String
		  Dim idoauthpin As String
		  
		  idoauthpin="<div id=""oauth_pin"">"//<div id="oauth_pin">
		  //<DIV id=oauth_pin>7954217 </DIV></DIV></DIV></DIV>
		  if InStr(s,idoauthpin)<=0 then idoauthpin="<DIV id=oauth_pin>"
		  
		  s=ReplaceLineEndings(s,EndOfLine)
		  s=ReplaceAll(s,EndOfLine,"")
		  s=ReplaceAll(s,chr(9),"")
		  s=Trim(NthField(NthField(s,idoauthpin,2),"</div>",1))
		  s=ReplaceAll(s," ","")
		  //20110718
		  if InStrB(s,"<code>")>0 then
		    s=NthField(s,"<code>",2)
		    s=NthField(s,"</code>",1)
		  end if
		  return s
		  
		  '<div id="oauth_pin">
		  '0474650
		  '</div>
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPostMsgV2(r As String) As String
		  if gOAuthStatus<>0 then return ""
		   
		  Dim m As String
		  
		  //Post for v2
		  Dim j,k,l As JSONMBS
		  Dim u As String
		  j=new JSONMBS(r)
		  if j<>Nil then
		    k=j.ChildNode
		    While k<>Nil
		      if k.ValueString="text" then
		        l=k.ChildNode
		        if l<>Nil then m=DecodeUnicodeString(l.ValueString)
		      elseif k.ValueString="url" then
		        l=k.ChildNode
		        if l<>Nil then u=l.ValueString //ReplaceAll(l.Text,"\/","/")
		      end if
		      k=k.NextNode
		    Wend
		  end if
		  if u<>"" then//url of twitpic
		    m=(m+" "+u)//post data
		    m=ReplaceAll(m,"\/","/")
		  else
		    m=""
		  end if
		  
		  return m
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTwitPicCURL(f As FolderItem, m As String, v As Integer=kTwitpicV2) As UploadCURL
		  Select Case v
		  Case kTwitpicV1
		    //Upload and Post
		    return GetTwitPicCURLV1(f,m)
		  Case kTwitpicV2
		    //Upload only
		    return GetTwitPicCURLV2(f,m)
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTwitPicCURLV1(f As FolderItem, m As String) As UploadCURL
		  dim d as UploadCURL
		  
		  const CURLFORM_NOTHING = 0
		  const CURLFORM_COPYNAME = 1
		  const CURLFORM_PTRNAME = 2
		  const CURLFORM_NAMELENGTH = 3
		  const CURLFORM_COPYCONTENTS = 4
		  const CURLFORM_PTRCONTENTS = 5
		  const CURLFORM_CONTENTSLENGTH = 6
		  const CURLFORM_FILECONTENT = 7
		  const CURLFORM_ARRAY = 8
		  const CURLFORM_FILE = 10
		  const CURLFORM_BUFFER = 11
		  const CURLFORM_BUFFERPTR = 12
		  const CURLFORM_BUFFERLENGTH = 13
		  const CURLFORM_CONTENTTYPE = 14
		  const CURLFORM_CONTENTHEADER = 15
		  const CURLFORM_FILENAME = 16
		  
		  d=new UploadCURL
		  d.OptionURL="http://api.twitpic.com/1/uploadAndPost.json"
		  d.OptionVerbose=True
		  
		  // add a section named filMyFile
		  // with a file named file.name
		  // and binary content in buf
		  d.FormAdd(CURLFORM_COPYNAME, "consumer_token", CURLFORM_COPYCONTENTS, gConsumer_Key)
		  d.FormAdd(CURLFORM_COPYNAME, "consumer_secret", CURLFORM_COPYCONTENTS, gConsumer_Secret)
		  d.FormAdd(CURLFORM_COPYNAME, "oauth_token", CURLFORM_COPYCONTENTS, gOAuth_Access_Token)
		  d.FormAdd(CURLFORM_COPYNAME, "oauth_secret", CURLFORM_COPYCONTENTS, gOAuth_Access_Token_Secret)
		  if m<>"" then d.FormAdd(CURLFORM_COPYNAME, "message", CURLFORM_COPYCONTENTS, m)
		  d.FormAdd(CURLFORM_COPYNAME, "key", CURLFORM_COPYCONTENTS, gTwitPic_Api_Key)
		  d.FormAdd(CURLFORM_COPYNAME, "media", CURLFORM_FILE, f.UnixpathMBS)
		  d.FormFinish
		  
		  if gHttpProxyUse then//Proxy
		    d.OptionProxy=gHttpProxyAdress
		    d.OptionProxyPort=gHttpProxyPort
		  end if
		  
		  dim header(-1) as string
		  //header.Append "Content-Type: text/xml"
		  header.Append "application/x-www-form-urlencoded"
		  header.Append ""
		  d.SetOptionHTTPHeader header
		  
		  return d
		  'e=d.Perform
		  '
		  'ListBox1.AddRow "Result: "+str(e)
		  'ListBox1.AddRow d.GetInfoContentType
		  '
		  'dim r as string = d.result
		  '
		  'Result.text=r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTwitPicCURLV2(f As FolderItem, m As String) As UploadCURL
		  
		  dim d as UploadCURL
		  dim h(0) as string
		  
		  Dim str1,str2,str3 As String
		  
		  Dim CONSUMER_KEY As String=gConsumer_Key
		  Dim CONSUMER_SECRET As String= gConsumer_Secret
		  Dim ACCESS_TOKEN As String=gOAuth_Access_Token
		  Dim ACCESS_TOKEN_SECRET As String=gOAuth_Access_Token_Secret
		  Dim NONCE As String=RandomString(32)
		  Dim TIMESTAMP As String=MakeTimeStamp
		  
		  str1="https://api.twitter.com/1/account/verify_credentials.json"
		  str1=EncodeURLComponent(str1)
		  str1="GET"+"&"+str1+"&"
		  
		  str2=str2+"oauth_consumer_key="+CONSUMER_KEY
		  str2=str2+"&oauth_nonce="+NONCE
		  str2=str2+"&oauth_signature_method=HMAC-SHA1"
		  str2=str2+"&oauth_timestamp="+TIMESTAMP
		  str2=str2+"&oauth_token="+ACCESS_TOKEN
		  str2=str2+"&oauth_version=1.0"
		  
		  str3=CONSUMER_SECRET+"&"+ACCESS_TOKEN_SECRET
		  Dim signature_base_string As String = str1+EncodeURLComponent(str2)
		  Dim sha1class As New SHA1MBS
		  Dim hmacsha1 As String= sha1class.HMAC(str3,signature_base_string)
		  Dim signature_string As String = EncodeBase64(hmacsha1)
		  signature_string = EncodeURLComponent(signature_string)
		  
		  h.Append "X-Verify-Credentials-Authorization: OAuth realm=""http://api.twitter.com/"", "+_
		  "oauth_consumer_key="""+CONSUMER_KEY+""", "+_
		  "oauth_signature_method=""HMAC-SHA1"", "+_
		  "oauth_token="""+ACCESS_TOKEN+""", "+_
		  "oauth_timestamp="""+TIMESTAMP+""", "+_
		  "oauth_nonce="""+NONCE+""", "+_
		  "oauth_version=""1.0"", "+_
		  "oauth_signature="""+signature_string+""""
		  h.Append "X-Auth-Service-Provider: https://api.twitter.com/1/account/verify_credentials.json"
		  
		  const CURLFORM_NOTHING = 0
		  const CURLFORM_COPYNAME = 1
		  const CURLFORM_PTRNAME = 2
		  const CURLFORM_NAMELENGTH = 3
		  const CURLFORM_COPYCONTENTS = 4
		  const CURLFORM_PTRCONTENTS = 5
		  const CURLFORM_CONTENTSLENGTH = 6
		  const CURLFORM_FILECONTENT = 7
		  const CURLFORM_ARRAY = 8
		  const CURLFORM_FILE = 10
		  const CURLFORM_BUFFER = 11
		  const CURLFORM_BUFFERPTR = 12
		  const CURLFORM_BUFFERLENGTH = 13
		  const CURLFORM_CONTENTTYPE = 14
		  const CURLFORM_CONTENTHEADER = 15
		  const CURLFORM_FILENAME = 16
		  
		  d=new UploadCURL
		  d.OptionURL="http://api.twitpic.com/2/upload.json"
		  d.OptionVerbose=True
		  d.SetOptionHTTPHeader h
		  
		  // add a section named filMyFile
		  // with a file named file.name
		  // and binary content in buf
		  d.FormAdd(CURLFORM_COPYNAME, "key", CURLFORM_COPYCONTENTS, gTwitPic_Api_Key)
		  d.FormAdd(CURLFORM_COPYNAME, "media", CURLFORM_FILE, f.UnixpathMBS)
		  if m<>"" then d.FormAdd(CURLFORM_COPYNAME, "message", CURLFORM_COPYCONTENTS, m)
		  d.FormFinish
		  
		  'dim b as BinaryStream
		  'b=mFile.OpenAsBinaryFile(false)
		  'd.data=b.Read(b.Length)
		  'd.OptionUpload=true
		  'd.OptionInFileSize=b.Length
		  
		  if gHttpProxyUse then//Proxy
		    d.OptionProxy=gHttpProxyAdress
		    d.OptionProxyPort=gHttpProxyPort
		  end if
		  
		  return d
		  
		  'e=d.Perform
		  '
		  'ListBox1.AddRow "Result: "+str(e)
		  'ListBox1.AddRow d.GetInfoContentType
		  '
		  'dim r as string = d.result
		  '
		  'Result.text=r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTwitterCURL(type As String, api As String, optionA As String, optionB As String) As MyCURL
		  Dim str1,str2,str3 As String
		  
		  str1=api
		  str1=EncodeURLComponent(str1)
		  str1=type+"&"+str1+"&"
		  
		  if optionA<>"" then str2=optionA+"&"
		  str2=str2+"oauth_consumer_key="+gConsumer_Key
		  str2=str2+"&oauth_nonce="+RandomString(32)
		  str2=str2+"&oauth_signature_method=HMAC-SHA1"
		  str2=str2+"&oauth_timestamp="+MakeTimeStamp//1274401561
		  str2=str2+"&oauth_token="+gOAuth_Access_Token
		  str2=str2+"&oauth_version=1.0"
		  if optionB<>"" then str2=str2+"&"+optionB
		  
		  str3=gConsumer_Secret+"&"+gOAuth_Access_Token_Secret
		  Dim signature_base_string As String = str1+EncodeURLComponent(str2)
		  
		  Dim sha1class As New SHA1MBS
		  Dim hmacsha1 As String= sha1class.HMAC(str3,signature_base_string)
		  Dim signature_string As String = EncodeBase64(hmacsha1)
		  signature_string = EncodeURLComponent(signature_string)
		  
		  dim header(-1) as string
		  dim c as new MyCURL
		  c.OptionVerbose=true
		  c.OptionURL = api+"?"+str2+"&oauth_signature="+signature_string
		  c.OptionCustomRequest=type//"POST"
		  
		  if gHttpProxyUse then//Proxy
		    c.OptionProxy=gHttpProxyAdress
		    c.OptionProxyPort=gHttpProxyPort
		  end if
		  
		  //header.Append "Content-Type: text/xml"
		  header.Append "application/x-www-form-urlencoded"
		  header.Append ""
		  c.SetOptionHTTPHeader header
		  
		  return c
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakeTimeStamp() As String
		  dim d as New date
		  dim d2 as New Date(1970,1,1)
		  dim timestamp as String
		  d2.TotalSeconds = d2.TotalSeconds + (d2.GMTOffset * 3600)
		  timestamp = Format((d.TotalSeconds -  d2.TotalSeconds),"#")
		  return timestamp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RandomString(n As Integer) As String
		  if n<1 then n=1
		  Dim i,v As Integer
		  Dim s,t As String
		  if gOAuthRandom=Nil then gOAuthRandom=New Random
		  for i=1 to n
		    v=gOAuthRandom.InRange(&h30,&h7A)
		    t=chr(v)
		    if v>&h39 and v<&h50 then
		      t=chr(gOAuthRandom.InRange(&h30,&h39))
		    elseif v<&h61 then
		      t=chr(gOAuthRandom.InRange(&h61,&h7A))
		    end if
		    s=s+t
		  next
		  return s 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RequestToken(tknMthd As Integer) As Integer
		  Dim tokenURL As String ="http://api.twitter.com/oauth/request_token"
		  Select Case tknMthd
		  Case 1
		    tokenURL="https://api.twitter.com/oauth/request_token"
		  End Select
		  
		  Dim str1,str2,str3 As String
		  
		  str1 = tokenURL
		  str1 = EncodeURLComponent(str1)
		  str1 = "POST&" + str1 + "&"
		  
		  str2 = "oauth_consumer_key="+gConsumer_Key
		  str2 = str2 + "&oauth_nonce="+RandomString(32)
		  str2 = str2 + "&oauth_signature_method=HMAC-SHA1"
		  str2 = str2 + "&oauth_timestamp="+MakeTimeStamp//1274401561
		  str2 = str2 + "&oauth_version=1.0"
		  
		  str3 = gConsumer_Secret+"&"
		  Dim signature_base_string As String = str1 + EncodeURLComponent(str2)
		  Dim sha1class As New SHA1MBS
		  Dim hmacsha1 As String= sha1class.HMAC(str3,signature_base_string)
		  Dim signature_string As String = EncodeBase64(hmacsha1)
		  signature_string = EncodeURLComponent(signature_string)
		  
		  Dim res As String
		  gOAuth_Request_Token=""
		  gOAuth_Request_Token_Secret=""
		  
		  Select Case tknMthd
		  Case 1//Socket
		    Dim hsock as new HTTPSecureSocket
		    hsock.Secure = true
		    
		    if gHttpProxyUse then
		      hsock.HTTPProxyAddress=gHttpProxyAdress
		      hsock.HTTPProxyPort=gHttpProxyPort
		    end if
		    
		    Dim str4 as String
		    str4="OAuth realm=""OAuth"", "
		    str4=str4+ReplaceAll(ReplaceAll(str2,"&",""", "),"=","=""")+""", "
		    str4=str4+"oauth_signature="""+signature_string+""""
		    hsock.SetRequestHeader("Authorization", str4)
		    
		    res=hsock.Post(tokenURL, 20)
		    gOAuthStatus=hsock.ErrorCode
		    
		  Else//CURL
		    dim header(-1) as string
		    dim c as new MyCURL
		    c.OptionVerbose=true
		    c.OptionURL = tokenURL+"?" + str2 + "&oauth_signature=" + signature_string
		    c.OptionCustomRequest="POST"
		    
		    if gHttpProxyUse then
		      c.OptionProxy=gHttpProxyAdress
		      c.OptionProxyPort=gHttpProxyPort
		    end if
		    
		    //header.Append "Content-Type: text/xml"
		    header.Append "application/x-www-form-urlencoded"
		    header.Append ""
		    c.SetOptionHTTPHeader header
		    
		    gOAuthStatus=c.Perform
		    res=c.OutputData
		    
		  End Select
		  
		  gOAuth_Request_Token=NthField(NthField(res,"oauth_token=",2),"&",1)
		  gOAuth_Request_Token_secret=NthField(NthField(res,"oauth_token_secret=",2),"&",1)
		  
		  Return gOAuthStatus
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		gConsumer_Key As String
	#tag EndProperty

	#tag Property, Flags = &h0
		gConsumer_Secret As String
	#tag EndProperty

	#tag Property, Flags = &h0
		gHttpProxyAdress As String
	#tag EndProperty

	#tag Property, Flags = &h0
		gHttpProxyPort As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		gHttpProxyUse As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		gOAuthRandom As Random
	#tag EndProperty

	#tag Property, Flags = &h0
		gOAuthStatus As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		gOAuth_Access_Token As String
	#tag EndProperty

	#tag Property, Flags = &h0
		gOAuth_Access_Token_Secret As String
	#tag EndProperty

	#tag Property, Flags = &h0
		gOAuth_Request_Token As String
	#tag EndProperty

	#tag Property, Flags = &h0
		gOAuth_Request_Token_Secret As String
	#tag EndProperty

	#tag Property, Flags = &h0
		gOAuth_Verifier As String
	#tag EndProperty

	#tag Property, Flags = &h0
		gScreen_Name As String
	#tag EndProperty

	#tag Property, Flags = &h0
		gTwitPic_Api_Key As String
	#tag EndProperty


	#tag Constant, Name = kTwitpicV1, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTwitpicV2, Type = Double, Dynamic = False, Default = \"1", Scope = Public
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
			Name="gConsumer_Key"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gConsumer_Secret"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gHttpProxyUse"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="gHttpProxyAdress"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gHttpProxyPort"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="gOAuth_Request_Token"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gOAuth_Request_Token_Secret"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gOAuthStatus"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="gOAuth_Verifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gOAuth_Access_Token"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gOAuth_Access_Token_Secret"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gScreen_Name"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gTwitPic_Api_Key"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
