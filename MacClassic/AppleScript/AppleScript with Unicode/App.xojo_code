#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim a as AppleScriptMBS
		  dim b as AppleScriptMBS
		  dim t as TextConverter
		  dim s as String
		  
		  a=new AppleScriptMBS
		  
		  if not a.CanUnicodeText then
		    MsgBox "We need Apple Script 1.3 or newer for Unicode text handling."
		  end if
		  
		  a.UnicodeText=true // use it
		  
		  // compile this source code
		  s="display dialog ""Hello World!"""
		  
		  // MsgBox str(lenb(s)) // 29
		  
		  t=GetTextConverter(GetTextEncoding(0),GetTextEncoding(256))
		  s=t.convert(s)
		  
		  // MsgBox str(lenb(s)) // 58 if it's now unicode (16bit, not UTF8!)
		  
		  a.Compile s
		  
		  b=new AppleScriptMBS
		  
		  // now we copy the binary code to another object
		  b.Binary=a.Binary
		  
		  // and run it
		  b.Execute
		  
		  // now decompile
		  
		  s=b.Source
		  
		  MsgBox str(lenb(s)) // 29 if returned as MacRoman and 58 if returned as Unicode
		  MsgBox s
		  
		  Quit
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
