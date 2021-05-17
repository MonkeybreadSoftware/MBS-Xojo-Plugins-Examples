#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  test
		  quit
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub test()
		  const  RY_FIND             =  1
		  const  RY_FIND_NEXT        =  2
		  const  RY_OPEN             =  3
		  const  RY_CLOSE            =  4
		  const  RY_READ             =  5
		  const  RY_WRITE            =  6
		  const  RY_RANDOM           =  7
		  const  RY_SEED             =  8
		  const  RY_WRITE_USERID     =  9
		  const  RY_READ_USERID      = 10
		  const  RY_SET_MOUDLE       = 11
		  const  RY_CHECK_MOUDLE     = 12
		  const  RY_WRITE_ARITHMETIC = 13
		  const  RY_CALCULATE1       = 14
		  const  RY_CALCULATE2       = 15
		  const  RY_CALCULATE3       = 16
		  const  RY_DECREASE         =  17
		  
		  dim e as integer
		  dim i as integer
		  dim f as folderItem
		  dim r as RockeyMBS
		  
		  r=new RockeyMBS
		  r.p1=&hc44c
		  r.p2=&hc8f8
		  r.p3=&h0799
		  r.p4=&hc43b
		  
		  e=r.Rockey(RY_FIND)
		  
		  MsgBox "Find function returns: "+str(e)
		  
		  if e = 0 then
		    MsgBox "Found a dongle."
		    
		    e=r.Rockey(RY_OPEN)
		    if e = 0 then
		      
		      Select case r.lp2
		      case 1
		        MsgBox "Opened a Rockey4 LPT dongle."
		      case 2
		        MsgBox "Opened a Rockey4-Plus LPT dongle."
		      case 3
		        MsgBox "Opened a Rockey4 USB dongle."
		      case 4
		        MsgBox "Opened a Rockey4-Plus USB dongle."
		      case 5
		        MsgBox "Opened a Rockey4 Net dongle."
		      case 6
		        MsgBox "Opened a Rockey4 Net USB dongle."
		      else
		        MsgBox "Opened an unknown rockey dongle."
		      end Select
		      
		      MsgBox "Handle: "+hex(r.handle)
		      
		      r.lp1=0
		      r.lp2=0
		      e=r.Rockey(RY_READ_USERID)
		      
		      if e = 0 then
		        MsgBox "User ID: "+hex(r.lp1)
		        
		        r.p1 = 0
		        r.p2 = 14
		        
		        e=r.Rockey(RY_READ)
		        
		        if 0=e then
		          MsgBox "Content before: "+r.buffer.CString(0)
		          r.buffer.Long(0) = &h4711
		          r.p1 = 0
		          r.p2 = 14
		          
		          e=r.Rockey(RY_WRITE)
		          if e = 0 then
		            MsgBox "Read: " + hex(r.buffer.Long(0))
		            MsgBox "Write: 4711"
		            
		            r.Buffer.Long(0)=0 // clear the first bytes
		            r.p1 = 0
		            r.p2 = 14
		            
		            e=r.Rockey(RY_READ)
		            if e=0 then
		              MsgBox "Read: " + hex(r.buffer.Long(0))
		              if r.buffer.Long(0) = &h4711 then
		                MsgBox "Finished."
		              else
		                MsgBox "That was not correct."
		              end if
		            else
		              MsgBox "Read failed."
		            end if
		          else
		            MsgBox "Write failed."
		          end if
		        else
		          MsgBox "Read failed."
		        end if
		      else
		        MsgBox "Reading the User ID failed."
		      end if
		      e=r.Rockey(RY_CLOSE)
		      
		    else
		      MsgBox "Open failed."
		    end if
		  else
		    MsgBox "No dongle found."
		  end if
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
