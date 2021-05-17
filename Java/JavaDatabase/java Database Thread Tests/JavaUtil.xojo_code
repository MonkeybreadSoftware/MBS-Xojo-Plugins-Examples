#tag Module
Protected Module JavaUtil
	#tag Method, Flags = &h0
		Sub ExecuteSQL(extends c as JavaConnectionMBS, sql as string)
		  try
		    
		    dim s as JavaStatementMBS
		    
		    s=c.createStatement
		    if s<>nil then
		      call s.executeUpdate sql
		    end if
		    
		    
		  catch d as JavaExceptionMBS
		    MsgBox d.message+" ErrorCode: "+str(d.errornumber)
		    
		  end try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MyExecuteSQL(extends j as javaconnectionMBS, sql as string)
		  try
		    
		    j.ExecuteSQL sql
		    
		  catch d as JavaExceptionMBS
		    MsgBox d.message+" ErrorCode: "+str(d.errornumber)
		    
		  end try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MyExecuteSQLwithPreparedStatement(extends j as javaconnectionMBS, sql as string)
		  try
		    
		    dim p as JavaPreparedStatementMBS
		    p=j.prepareStatement(sql)
		    
		    if p<>Nil then
		      call p.execute
		    end if
		    
		  catch d as JavaExceptionMBS
		    MsgBox d.message+" ErrorCode: "+str(d.errornumber)
		    
		  end try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MySelectSQL(extends j as javaconnectionMBS, sql as string, editable as boolean=false) As JavaResultSetMBS
		  try
		    
		    return j.SelectSQL(sql,editable)
		    
		  catch d as JavaExceptionMBS
		    MsgBox d.message
		    
		  end try
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MySelectSQLwithPreparedStatement(extends j as javaconnectionMBS, sql as string, editable as boolean=false) As JavaResultSetMBS
		  try
		    
		    dim p as JavaPreparedStatementMBS
		    p=j.prepareStatement(sql)
		    
		    if p<>Nil then
		      dim r as JavaResultSetMBS
		      r=p.executeQuery
		      r.Tag=p // keep a reference to the statement
		      
		      Return r
		    end if
		    
		  catch d as JavaExceptionMBS
		    MsgBox d.message
		    
		  end try
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectSQL(extends c as JavaConnectionMBS, sql as string, editable as boolean=false) As JavaResultSetMBS
		  try
		    dim mode as integer = c.CONCUR_READ_ONLY
		    dim s as JavaStatementMBS
		    
		    s=c.createStatement(c.TYPE_FORWARD_ONLY, mode)
		    if s<>nil then
		      dim r as JavaResultSetMbs
		      
		      r=s.executeQuery(sql)
		      if r<>Nil then
		        // you need to keep the statement with the 
		        r.Tag=s
		        Return r
		      end if
		    end if
		    
		  catch d as JavaExceptionMBS
		    MsgBox d.message+" ErrorCode: "+str(d.errornumber)
		    
		  end try
		  
		End Function
	#tag EndMethod


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
	#tag EndViewBehavior
End Module
#tag EndModule
