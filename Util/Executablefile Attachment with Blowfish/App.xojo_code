#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  if not StartViewer then
		    EditorWindow.Show
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function StartViewer() As boolean
		  dim s as string
		  dim p as string
		  
		  if ExecutableAttachment.OpenFile(app.ExecutableFile,false) then
		    s=ExecutableAttachment.read
		    
		    if s<>"" then
		      if left(s,4)="PASS" then
		        
		        PasswordDialog.ShowModal
		        if PasswordDialog.ok then
		          p=PasswordDialog.pass.text
		          p=ConvertEncoding(p,Encodings.UTF8)
		          
		          s=midb(s,5)
		          
		          s=Decrypt(s,p)
		          
		          s=DefineEncoding(s,Encodings.UTF8)
		          if StrComp(left(s,4),"WORD",0)=0 then
		            s=mid(s,5)
		            ViewerWindow.EditField1.text=s
		            ViewerWindow.Show
		            
		          else
		            MsgBox "Password was wrong."
		            quit
		          end if
		        else
		          quit
		        end if
		        
		      else
		        s=DefineEncoding(s,Encodings.UTF8)
		        
		        ViewerWindow.EditField1.text=s
		        ViewerWindow.Show
		      end if
		      
		      Return true
		    end if
		  end if
		End Function
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
