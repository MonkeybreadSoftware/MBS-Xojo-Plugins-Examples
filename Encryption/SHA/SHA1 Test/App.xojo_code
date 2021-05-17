#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim result(3) as string
		  dim test(3) as string
		  dim repeatcount(3) as integer
		  dim s as SHA1MBS
		  dim t as string
		  dim i,j,c as integer
		  
		  result(0)= "A9 99 3E 36 47 06 81 6A BA 3E 25 71 78 50 C2 6C 9C D0 D8 9D"
		  result(1)= "84 98 3E 44 1C 3B D2 6E BA AE 4A A1 F9 51 29 E5 E5 46 70 F1"
		  result(2)= "34 AA 97 3C D4 C4 DA A4 F6 1E EB 2B DB AD 27 31 65 34 01 6F"
		  result(3)= "DE A3 56 A2 CD DD 90 C7 A7 EC ED C5 EB B5 63 93 4F 46 04 52"
		  
		  test(0)= "abc"
		  test(1)= "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq"
		  test(2)= "a"
		  test(3)= "0123456701234567012345670123456701234567012345670123456701234567"
		  
		  repeatcount(0)=1
		  repeatcount(1)=1
		  repeatcount(2)=1000000
		  repeatcount(3)=10
		  
		  for j=0 to 3
		    s=new SHA1MBS
		    c=repeatcount(j)
		    
		    s.Reset
		    for i=1 to c
		      s.add(test(j))
		    next
		    t=s.Result
		    
		    MsgBox "is: "+chr(13)+HexstringMBS(t,2,100,"",""," "," ")+chr(13)+"should be:"+chr(13)+result(j)
		    
		    
		  next
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
