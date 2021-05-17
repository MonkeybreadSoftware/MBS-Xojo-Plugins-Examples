#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  UniKeySample
		  
		  
		  // keep window open till you press return
		  print ""
		  print "press return to quit"
		  dim s as string = Input
		End Function
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub UniKeySample()
		  
		  dim cmd as string = "H=H^H, A=A*23, F=B*17, A=A+F, A=A+G, A=A<C, A=A^D, B=B^B, C=C^C, D=D^D"
		  dim cmd1 as string = "A=A+B, A=A+C, A=A+D, A=A+E, A=A+F, A=A+G, A=A+H"
		  dim cmd2 as string = "A=E|E, B=F|F, C=G|G, D=H|H"
		  dim str1 as string = "abcdefghijklmnop"
		  
		  dim p1 as integer = 1234    // passwords
		  dim p2 as integer = 1234
		  dim p3 as integer = 1234
		  dim p4 as integer = 1234
		  dim retCode as integer
		  
		  dim u as new UnikeyMBS
		  
		  //get version
		  dim version as integer
		  retcode = u.GetVersion(version)
		  if retcode <> 0 then
		    print "GetVersion error code: "+str(retCode)
		    return
		  end if
		  print "UniKey lib ver: "+hex(version)
		  
		  // find dongle
		  dim lp1 as integer = 1
		  dim lp2 as integer = 0
		  retcode = u.Find(lp1, lp2)
		  if retcode <> 0 then
		    print "UniKey_Find error code: "+str(retCode)
		    return
		  end if
		  // return the hardware ID (HID)
		  print "Find UniKey: "+ str(lp1)
		  
		  
		  // open dongle
		  retcode = u.UserLogon(p1, p2)
		  if retcode <> 0 then
		    print "UniKey_User_Logon error code: "+str(retCode)
		    return
		  end if
		  
		  retcode = u.VendorLogon(p1, p2, p3, p4)
		  if retcode <> 0 then
		    print "UniKey_Vender_Logon error code: "+str(retCode)
		    return
		  end if
		  
		  //get type
		  dim type as integer = 0  
		  retcode = u.GetType(type)
		  if retcode <> 0 then
		    print "UniKey_Get_Type error code: "+str(retCode)
		  else
		    print "UniKey_Get_Type: : "+str(type)
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
