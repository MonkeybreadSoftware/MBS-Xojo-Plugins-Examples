#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim o as OpenDialogMBS
		  dim i,c as integer
		  dim f as FolderItem
		  
		  o=new OpenDialogMBS
		  o.ShowHiddenFiles=true
		  o.PromptText="Select one or more files:"
		  o.MultipleSelection=false
		  o.ActionButtonLabel="Open files"
		  o.CancelButtonLabel="no, thanks."
		  o.WindowTitle="This is a window title."
		  o.ClientName="Client Name?"
		  o.ShowDialog
		  
		  c=o.FileCount
		  if c>0 then
		    for i=0 to c-1
		      f=o.Files(i)
		      
		      dim Path as string = f.nativePath
		      
		      FileList.List.AddRow path
		    next
		    
		  else
		    // MsgBox "no file was selected."
		    quit
		  end if
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
