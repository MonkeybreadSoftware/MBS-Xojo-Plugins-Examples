#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   300
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   332690377
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Untitled"
   Visible         =   True
   Width           =   300
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  dim j as JavaConnectionMBS
		  dim d as JavaDatabaseMBS
		  dim r as JavaResultSetMBS
		  dim f as FolderItem
		  dim blob as JavaBlobMBS
		  dim clob as JavaClobMBS
		  
		  f=SpecialFolder.desktop.Child("mysql-connector-java-5.1.6-bin.jar")
		  
		  if not f.Exists then
		    MsgBox "Missing mysql connector classes!"
		    Return
		  end if
		  
		  if TargetLinux then
		    // change path for your linux PC!
		    JavaVMMBS.SetLibraryPath("/home/cs/jre1.6.0_05/lib/i386/client/libjvm.so")
		  end if
		  
		  v=new JavaVMMBS(f)
		  d=new JavaDatabaseMBS(v,"com.mysql.jdbc.Driver")
		  j=d.getConnection("jdbc:mysql://localhost:3306", "root", "")
		  
		  if j<>nil then
		    
		    MsgBox "connected"
		    
		    j.MyExecuteSQL "CREATE DATABASE JunkDB"
		    j.MyExecuteSQL "USE JunkDB"
		    j.MyExecuteSQL "DROP TABLE myTable"
		    j.MyExecuteSQL "CREATE TABLE myTable(test_id int, data LONGBLOB, text LONGTEXT, PRIMARY KEY (test_id))"
		    j.MyExecuteSQL "INSERT INTO myTable(test_id, text, data) VALUES(1,'One','data1')"
		    j.MyExecuteSQL "INSERT INTO myTable(test_id, text, data) VALUES(2,'Two','data2')"
		    j.MyExecuteSQL "INSERT INTO myTable(test_id, text, data) VALUES(3,'Three','data3')"
		    j.MyExecuteSQL "INSERT INTO myTable(test_id, text, data) VALUES(4,'Four','data4')"
		    j.MyExecuteSQL "INSERT INTO myTable(test_id, text, data) VALUES(5,'Five','data5')"
		    
		    // check second entry
		    r=j.MySelectSQL("SELECT * from myTable")
		    
		    if r<>Nil then
		      DisplayMetaData r
		      
		      if r.absolute(2) then
		        MsgBox str(R.getInt("test_id"))+" "+r.getString("text")+" "+r.getString("data")
		        
		        clob=r.getClob("text")
		        
		        if clob=nil then
		          MsgBox "clob=nil"
		          Return
		        end if
		        
		        blob=r.getBlob("data")
		        
		        dim a as string = str(R.getInt("test_id"))
		        dim b as string =clob.getSubString(1,clob.length)
		        dim c as string =blob.getBytes(1,blob.length)
		        
		        MsgBox a+" "+b+" "+c
		        
		      end if
		      
		    end if
		    
		    r=nil
		    
		    // edit records
		    r=j.MySelectSQL("SELECT data,text,test_id from myTable",true)
		    
		    if r<>Nil then
		      while r.NextRecord
		        
		        clob=r.getClob("text")
		        call clob.setString(3,"Hello Text "+str(r.getInt("test_id")))
		        
		        MsgBox clob.getSubString(1,clob.length)
		        
		        r.updateClob("text", clob)
		        
		        blob=r.getBlob("data")
		        
		        call blob.setBytes(1,"Hello World "+str(r.getInt("test_id")))
		        
		        MsgBox blob.getBytes(1,blob.length)
		        
		        r.updateBlob("data", blob)
		        r.updateRow
		        
		      wend
		    end if
		    
		    r=nil
		    
		    dim lines(-1) as string
		    
		    // check all rows
		    r=j.MySelectSQL("SELECT * from myTable")
		    
		    if r<>Nil then
		      while r.NextRecord
		        lines.append str(R.getInt("test_id"))+" "+r.getString("text")+" "+r.getString("data")
		      wend
		    end if
		    
		    MsgBox Join(lines,EndOfLine)
		    
		    r=nil
		  else
		    MsgBox "not connected"
		  end if
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DisplayMetaData(r as javaresultSetMBS)
		  dim m as JavaResultSetMetaDataMBS
		  
		  m=r.getMetaData
		  
		  dim i,c as integer
		  dim s(-1) as string
		  
		  c=m.getColumnCount
		  for i=1 to c
		    s.Append m.getColumnName(i)+" as "+m.getColumnTypeName(i)
		  next
		  
		  MsgBox Join(s,EndOfLine)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		v As javavmMBS
	#tag EndProperty


#tag EndWindowCode

#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
