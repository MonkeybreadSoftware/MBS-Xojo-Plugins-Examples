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
		  dim f as FolderItem=SpecialFolder.desktop.Child("mysql-connector-java-5.1.6-bin.jar")
		  
		  if not f.Exists then
		    MsgBox "Missing mysql connector classes!"
		    Return
		  end if
		  
		  if TargetLinux then
		    // change path for your linux PC!
		    JavaVMMBS.SetLibraryPath("/home/cs/jre1.6.0_05/lib/i386/client/libjvm.so")
		  end if
		  
		  dim v as new JavaVMMBS(f)
		  d=new JavaDatabaseMBS(v,"com.mysql.jdbc.Driver")
		  
		  j=d.getConnection("jdbc:mysql://localhost:3306","root","")
		  
		  if j<>Nil then
		    // call j.prepareStatement("CREATE DATABASE JunkDB").execute
		    
		    j.MyExecuteSQL "CREATE DATABASE JunkDB"
		    j.MyExecuteSQL "USE JunkDB"
		    j.MyExecuteSQL "DROP TABLE myTable"
		    j.MyExecuteSQL "CREATE TABLE myTable(test_id int, test_val char(15) not null, PRIMARY KEY (test_id))"
		    j.MyExecuteSQL "INSERT INTO myTable(test_id, test_val) VALUES(1,'One')"
		    j.MyExecuteSQL "INSERT INTO myTable(test_id, test_val) VALUES(2,'Two')"
		    j.MyExecuteSQL "INSERT INTO myTable(test_id, test_val) VALUES(3,'Three')"
		    j.MyExecuteSQL "INSERT INTO myTable(test_id, test_val) VALUES(4,'Four')"
		    j.MyExecuteSQLwithPreparedStatement "INSERT INTO myTable(test_id, test_val) VALUES(5,'Five')"
		    
		    // check second entry
		    r=j.MySelectSQLwithPreparedStatement("SELECT * from myTable")
		    
		    if r<>Nil then
		      if r.absolute(2) then
		        MsgBox str(R.getInt("test_id"))+" "+r.getString("test_val")
		      end if
		    else
		      MsgBox "r is nil"
		    end if
		    
		    r=nil
		    
		    // edit records
		    r=j.MySelectSQL("SELECT test_id from myTable",true)
		    
		    if r<>Nil then
		      while r.NextRecord
		        r.updateInt("test_id",10+r.getInt("test_id"))
		        r.updateRow
		      wend
		    else
		      MsgBox "r is nil"
		    end if
		    
		    r=nil
		    
		    // check all rows
		    r=j.MySelectSQL("SELECT * from myTable")
		    
		    if r<>Nil then
		      while r.NextRecord
		        MsgBox str(R.getInt("test_id"))+" "+r.getString("test_val")
		      wend
		    else
		      MsgBox "r is nil"
		    end if
		    
		    r=nil
		    MsgBox "OK"
		  else
		    MsgBox "not connected"
		  end if
		  
		  Exception e as JavaExceptionMBS
		    MsgBox e.message+" errorcode: "+str(e.ErrorNumber)
		    
		    
		End Sub
	#tag EndEvent


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
