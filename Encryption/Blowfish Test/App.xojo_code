#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  Test1
		  Test2
		  Test3
		  Test4
		  Test5
		  Test6
		  Test7
		  Test8
		  Test9
		  Test10
		  
		  MsgBox "Everything ok if no error was reported."
		  quit
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub Test1()
		  dim m as MemoryBlock
		  dim b as BlowfishMBS
		  
		  m=NewMemoryBlock(8)
		  m.UInt32Value(0)=1
		  m.UInt32Value(4)=2
		  
		  b=new BlowfishMBS
		  
		  b.SetKey "TESTKEY"
		  b.Encrypt m
		  
		  if m.UInt32Value(0)=&hDF333FD2 and m.UInt32Value(4)=&h30A71BB4 then
		    //MsgBox "ok"
		  else
		    MsgBox "failed to decrypt 1a"
		  end if
		  
		  b.Decrypt m
		  
		  if m.UInt32Value(0)=1 and m.UInt32Value(4)=2 then
		    //MsgBox "ok"
		  else
		    MsgBox "failed to decrypt 1b"
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test10()
		  dim temp as MemoryBlock
		  dim b as BlowfishMBS
		  dim r,i1,i2,o1,o2,r1,r2 as string
		  
		  i1="Security is someti"
		  i2="mes possible. "
		  
		  b=new BlowfishMBS
		  b.SetKey "TESTKEY"
		  o1=b.EncryptOFB64(i1,temp)
		  o2=b.EncryptOFB64(i2,temp)
		  
		  // output is platform independend
		  // MsgBox EncodingToHexMBS(m.StringValue(0,32))
		  
		  temp=nil // reset
		  
		  b=new BlowfishMBS
		  b.SetKey "TESTKEY"
		  r1=b.DecryptOFB64(o1,temp)
		  r2=b.DecryptOFB64(o2,temp)
		  
		  r=r1+r2
		  // MsgBox r
		  
		  if r="Security is sometimes possible. " then
		    //MsgBox "ok"
		  else
		    MsgBox "failed to decrypt 10"
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test2()
		  dim m as MemoryBlock
		  dim b as BlowfishMBS
		  
		  m=NewMemoryBlock(8)
		  m.StringValue(0,8)="Security"
		  
		  b=new BlowfishMBS
		  
		  b.SetKey "TESTKEY"
		  b.Encrypt m
		  
		  // output is platform dependend
		  // MsgBox EncodingToHexMBS(m.StringValue(0,8))
		  
		  b.Decrypt m
		  
		  if m.StringValue(0,8)="Security" then
		    // MsgBox "ok"
		  else
		    MsgBox "failed to decrypt 2"
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test3()
		  dim m as MemoryBlock
		  dim b as BlowfishMBS
		  
		  m=NewMemoryBlock(8)
		  m.StringValue(0,8)="Security"
		  
		  b=new BlowfishMBS
		  
		  b.SetKey "TESTKEY"
		  b.EncryptECB m,m,0
		  
		  // output is platform independend
		  // MsgBox EncodingToHexMBS(m.StringValue(0,8))
		  
		  b.DecryptECB m,m,0
		  
		  if m.StringValue(0,8)="Security" then
		    //MsgBox "ok"
		  else
		    MsgBox "failed to decrypt 3"
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test4()
		  dim i,o,r as string
		  dim b as BlowfishMBS
		  
		  i="Security"
		  
		  b=new BlowfishMBS
		  
		  b.SetKey "TESTKEY"
		  o=b.EncryptECB(i)
		  
		  // output is platform independend
		  // MsgBox EncodingToHexMBS(m.StringValue(0,8))
		  
		  r=b.DecryptECB(o)
		  
		  if r="Security" then
		    // MsgBox "ok"
		  else
		    MsgBox "failed to decrypt 4"
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test5()
		  dim m,temp as MemoryBlock
		  dim b as BlowfishMBS
		  
		  temp=NewMemoryBlock(8)
		  
		  m=NewMemoryBlock(32)
		  m.StringValue(0,32)="Security is sometimes possible. "
		  
		  b=new BlowfishMBS
		  b.SetKey "TESTKEY"
		  b.EncryptCBC m,m, 0,8,temp
		  b.EncryptCBC m,m, 8,8,temp
		  b.EncryptCBC m,m,16,8,temp
		  b.EncryptCBC m,m,24,8,temp
		  
		  // output is platform independend
		  // MsgBox EncodingToHexMBS(m.StringValue(0,32))
		  
		  temp=NewMemoryBlock(8)
		  
		  b=new BlowfishMBS
		  b.SetKey "TESTKEY"
		  b.DecryptCBC m,m, 0,8,temp
		  b.DecryptCBC m,m, 8,8,temp
		  b.DecryptCBC m,m,16,8,temp
		  b.DecryptCBC m,m,24,8,temp
		  
		  'MsgBox m.StringValue(0,32)
		  
		  if m.StringValue(0,32)="Security is sometimes possible. " then
		    //MsgBox "ok"
		  else
		    MsgBox "failed to decrypt 5"
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test6()
		  dim temp as MemoryBlock
		  dim b as BlowfishMBS
		  dim r,i1,i2,o1,o2,r1,r2 as string
		  
		  i1="Security"
		  i2=" is sometimes possible. "
		  
		  b=new BlowfishMBS
		  b.SetKey "TESTKEY"
		  o1=b.EncryptCBC(i1,temp)
		  o2=b.EncryptCBC(i2,temp)
		  
		  // output is platform independend
		  // MsgBox EncodingToHexMBS(m.StringValue(0,32))
		  
		  temp=nil // reset
		  
		  b=new BlowfishMBS
		  b.SetKey "TESTKEY"
		  r1=b.DecryptCBC(o1,temp)
		  r2=b.DecryptCBC(o2,temp)
		  
		  r=r1+r2
		  // MsgBox r
		  
		  if r="Security is sometimes possible. " then
		    //MsgBox "ok"
		  else
		    MsgBox "failed to decrypt 6"
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test7()
		  dim m,temp as MemoryBlock
		  dim b as BlowfishMBS
		  dim n as integer
		  
		  temp=NewMemoryBlock(8)
		  
		  m=NewMemoryBlock(32)
		  m.StringValue(0,32)="Security is sometimes possible. "
		  
		  n=0
		  b=new BlowfishMBS
		  b.SetKey "TESTKEY"
		  b.EncryptCFB64 m,m, 0,8,temp,n
		  b.EncryptCFB64 m,m, 8,7,temp,n
		  b.EncryptCFB64 m,m,15,9,temp,n
		  b.EncryptCFB64 m,m,24,8,temp,n
		  
		  // output is platform independend
		  // MsgBox EncodingToHexMBS(m.StringValue(0,32))
		  
		  temp=NewMemoryBlock(8)
		  
		  n=0
		  b=new BlowfishMBS
		  b.SetKey "TESTKEY"
		  b.DecryptCFB64 m,m, 0,8,temp,n
		  b.DecryptCFB64 m,m, 8,7,temp,n
		  b.DecryptCFB64 m,m,15,9,temp,n
		  b.DecryptCFB64 m,m,24,8,temp,n
		  
		  'MsgBox m.StringValue(0,32)
		  
		  if m.StringValue(0,32)="Security is sometimes possible. " then
		    //MsgBox "ok"
		  else
		    MsgBox "failed to decrypt 7"
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test8()
		  dim temp as MemoryBlock
		  dim b as BlowfishMBS
		  dim r,i1,i2,o1,o2,r1,r2 as string
		  
		  i1="Security is someti"
		  i2="mes possible. "
		  
		  b=new BlowfishMBS
		  b.SetKey "TESTKEY"
		  o1=b.EncryptCFB64(i1,temp)
		  o2=b.EncryptCFB64(i2,temp)
		  
		  // output is platform independend
		  // MsgBox EncodingToHexMBS(m.StringValue(0,32))
		  
		  temp=nil // reset
		  
		  b=new BlowfishMBS
		  b.SetKey "TESTKEY"
		  r1=b.DecryptCFB64(o1,temp)
		  r2=b.DecryptCFB64(o2,temp)
		  
		  r=r1+r2
		  // MsgBox r
		  
		  if r="Security is sometimes possible. " then
		    //MsgBox "ok"
		  else
		    MsgBox "failed to decrypt 8"
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test9()
		  dim m,temp as MemoryBlock
		  dim b as BlowfishMBS
		  dim n as integer
		  
		  temp=NewMemoryBlock(8)
		  
		  m=NewMemoryBlock(32)
		  m.StringValue(0,32)="Security is sometimes possible. "
		  
		  n=0
		  b=new BlowfishMBS
		  b.SetKey "TESTKEY"
		  b.EncryptOFB64 m,m, 0,8,temp,n
		  b.EncryptOFB64 m,m, 8,7,temp,n
		  b.EncryptOFB64 m,m,15,9,temp,n
		  b.EncryptOFB64 m,m,24,8,temp,n
		  
		  // output is platform independend
		  // MsgBox EncodingToHexMBS(m.StringValue(0,32))
		  
		  temp=NewMemoryBlock(8)
		  
		  n=0
		  b=new BlowfishMBS
		  b.SetKey "TESTKEY"
		  b.DecryptOFB64 m,m, 0,8,temp,n
		  b.DecryptOFB64 m,m, 8,7,temp,n
		  b.DecryptOFB64 m,m,15,9,temp,n
		  b.DecryptOFB64 m,m,24,8,temp,n
		  
		  'MsgBox m.StringValue(0,32)
		  
		  if m.StringValue(0,32)="Security is sometimes possible. " then
		    //MsgBox "ok"
		  else
		    MsgBox "failed to decrypt 9"
		  end if
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
