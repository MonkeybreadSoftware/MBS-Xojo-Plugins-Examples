#tag Class
Protected Class MyLoadEvents
Inherits WebResourceLoadDelegateMBS
	#tag Event
		Sub Close()
		  System.DebugLog "Close"
		End Sub
	#tag EndEvent

	#tag Event
		Sub didFailLoadingWithError(id as string, errorString as string, dataSource as WebDataSourceMBS)
		  
		  dim d,i,c,n as integer
		  
		  d=val(id)
		  c=MainWindow.List.ListCount-1
		  for i=c downto 0
		    n=val(MainWindow.List.CellTag(i,0))
		    if n=d then
		      
		      MainWindow.List.cell(i,1)="failed"
		      
		      exit
		    end if
		  next
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didFinishLoadingFromDataSource(id as string, dataSource as WebDataSourceMBS)
		  
		  dim d,i,c,n as integer
		  
		  d=val(id)
		  c=MainWindow.List.ListCount-1
		  for i=c downto 0
		    n=val(MainWindow.List.CellTag(i,0))
		    if n=d then
		      
		      n=MainWindow.list.CellTag(i,1) // length of file
		      if n=0 then
		        MainWindow.List.cell(i,1)="done"
		      else
		        MainWindow.List.cell(i,1)="done, "+Format(n,"0")+" Bytes"
		      end if
		      
		      exit
		    end if
		  next
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didReceiveContentLength(id as string, length as integer, dataSource as WebDataSourceMBS)
		  dim d,i,c,n as integer
		  
		  d=val(id)
		  c=MainWindow.List.ListCount-1
		  for i=c downto 0
		    n=val(MainWindow.List.CellTag(i,0))
		    if n=d then
		      
		      MainWindow.List.CellTag(i,1)=length
		      MainWindow.List.cell(i,1)=Format(length,"0")+" Bytes"
		      
		      exit
		    end if
		  next
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didReceiveResponse(id as string, response as NSURLResponseMBS, dataSource as WebDataSourceMBS)
		  dim d,i,c,n as integer
		  
		  d=val(id)
		  c=MainWindow.List.ListCount-1
		  for i=c downto 0
		    n=val(MainWindow.List.CellTag(i,0))
		    if n=d then
		      
		      MainWindow.List.cell(i,1)="Receiving..."
		      
		      exit
		    end if
		  next
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function identifierForInitialRequest(request as NSURLRequestMBS, dataSource as WebDataSourceMBS) As string
		  dim n as string
		  
		  // we assign a row and return the row number as ID for further calls
		  
		  count=count+1
		  n=str(count)
		  
		  MainWindow.List.AddRow request.url
		  MainWindow.List.celltag(MainWindow.List.LastIndex,0)=count
		  
		  Return n
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  System.DebugLog "Open"
		End Sub
	#tag EndEvent

	#tag Event
		Function willSendRequest(id as string, request as NSURLRequestMBS, redirectResponse as NSURLResponseMBS, dataSource as WebDataSourceMBS) As NSURLRequestMBS
		  dim d,i,c,n as integer
		  
		  d=val(id)
		  c=MainWindow.List.ListCount-1
		  for i=c downto 0
		    n=val(MainWindow.List.CellTag(i,0))
		    if n=d then
		      
		      MainWindow.List.Cell(i,0)=request.url
		      MainWindow.List.cell(i,1)="Sending..."
		      
		      exit
		    end if
		  next
		  
		  
		  Return request
		  
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h1
		Protected count As Integer
	#tag EndProperty


	#tag Constant, Name = Untitled, Type = String, Dynamic = False, Default = \"d", Scope = Public
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
			InitialValue=""
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
