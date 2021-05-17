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
   Height          =   379
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   -1156832083
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Accessible Browser"
   Visible         =   True
   Width           =   515
   Begin ListBox List
      AllowAutoHideScrollbars=   True
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DisabledBalloonHelp=   ""
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      FontUnit        =   0
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasBorder       =   True
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   366
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   -1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      ScrollBarHorizontal=   False
      ScrollBarVertical=   True
      ScrollPosition  =   "0"
      ScrollPositionX =   "0"
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   -1
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   517
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub Init()
		  
		  if not AccessibilityMBS.Available then
		    MsgBox "The framework for the Accessible API could not be loaded."
		    quit
		  end if
		  
		  if not AccessibilityMBS.AXAPIEnabled then
		    MsgBox "The Accessible API is not enabled"
		    quit
		  end if
		  
		  List.DeleteAllRows
		  showitem AccessibilityMBS.SystemWideAXUIElement,"SystemWide"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub showCFArray(ob as cfobjectMBS)
		  if ob isa CFArrayMBS then
		    dim s as CFArrayMBS = CFArrayMBS(ob)
		    dim c as integer = s.Count - 1
		    
		    for i as integer = 0 to c
		      showitem s.Item(i), "Array item "+str(i+1)+"/"+str(c)
		    next
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub showCFBoolean(ob as cfobjectMBS)
		  
		  if ob<>nil then
		    dim s as CFBooleanMBS = CFBooleanMBS(ob)
		    if s.Value then
		      List.AddRow "Boolean: true"
		    else
		      List.AddRow "Boolean: false"
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub showCFNumber(ob as cfobjectMBS)
		  if ob isa CFNumberMBS then
		    dim s as CFNumberMBS = CFNumberMBS(ob)
		    List.AddRow "Number: "+str(s.doubleValue)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub showCFString(ob as cfobjectMBS)
		  if ob<> nil then
		    dim s as CFStringMBS = CFStringMBS(ob)
		    List.AddRow "String: "+s.str
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub showelement(el as axuiElementMBS)
		  dim i,c,count as integer
		  dim o as CFObjectMBS
		  dim s as CFStringMBS
		  dim ar as cfarrayMBS
		  dim des as String
		  dim al as AXValueMBS
		  
		  ar=el.ActionNames
		  
		  if ar<>nil then
		    c=ar.Count-1
		    
		    for i=0 to c
		      o=ar.Item(i)
		      if o isa CFStringMBS then
		        s=CFStringMBS(o)
		        if s<>nil then
		          des=""
		          o=el.ActionDescription(s)
		          if o isa CFStringMBS then
		            s = CFStringMBS(o)
		            if s<>nil then
		              des=" ("+s.str+")"
		            end if
		          end if
		          
		          List.AddRow "Action: "+s.str+des
		        end if
		      end if
		    next
		  end if
		  
		  ar=el.AttributeNames
		  if ar<>nil then
		    c=ar.Count-1
		    
		    for i=0 to c
		      o=ar.Item(i)
		      if o isa CFStringMBS then
		        s = CFStringMBS(o)
		        if s<>nil then
		          count=el.GetAttributeValueCount(s)
		          
		          al=el.AttributeValue(s)
		          des=" ("+str(count)
		          
		          if el.IsAttributeSettable(s) then
		            des=des+", writeable)"
		          else
		            des=des+", readonly)"
		          end if
		          
		          des=des
		          if al<>nil then
		            List.Addfolder s.str+des
		          else
		            List.Addrow s.str+des
		          end if
		          
		          obj.Append al
		          List.Cell(List.LastIndex,1)=str(UBound(obj))
		        end if
		      end if
		    next
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub showitem(e as cfobjectmbs, s as string)
		  dim id as integer
		  
		  if e<>nil then
		    obj.Append e
		    id=UBound(obj)
		    
		    List.AddFolder s
		    List.Cell(List.LastIndex,1)=str(id)
		    
		    if app.first then
		      List.Expanded(List.LastIndex)=true
		    end if
		  end if
		  
		  Exception
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub showvalue(ob as cfobjectMBS)
		  dim al as AXValueMBS
		  dim el as AXUIElementMBS
		  dim x,y,w,h as Single
		  dim lo,le as integer
		  dim typ as integer
		  
		  // Types from CoreGraphics.h */
		  const kAXValueCGPointType = 1
		  const kAXValueCGSizeType = 2
		  const kAXValueCGRectType = 3
		  
		  // Types from CFBase.h */
		  const kAXValueCFRangeType = 4
		  
		  // Other */
		  const kAXValueIllegalType = 0
		  
		  // First it may be a AXValue object
		  // But an AXValue object can be just a CFObject where AXTypeID=kAXValueIllegalType
		  
		  if ob isa AXValueMBS then
		    al=AXValueMBS(ob)
		    Select case al.AXTypeID
		    case kAXValueCGPointType
		      if al.AXGetCGPoint(x,y) then
		        List.AddRow "CGPoint ("+str(x)+", "+str(y)+")"
		      else
		        List.AddRow "CGPoint?"
		      end if
		      Return
		    case kAXValueCGSizeType
		      if al.AXGetCGSize(w,h) then
		        List.AddRow "CGSize ("+str(w)+", "+str(h)+")"
		      else
		        List.AddRow "CGSize?"
		      end if
		      Return
		    case kAXValueCGRectType
		      if al.AXGetCGRect(x,y,w,h) then
		        List.AddRow "CGRect ("+str(x)+", "+str(y)+", "+str(w)+", "+str(h)+")"
		      else
		        List.AddRow "CGRect?"
		      end if
		      Return
		    case kAXValueCFRangeType
		      if al.AXGetCFRange(lo,le) then
		        List.AddRow "CFRange ("+str(lo)+", "+str(le)+")"
		      else
		        List.AddRow "CFRange?"
		      end if
		      Return
		    end Select
		  end if
		  
		  // Now check CF type codes
		  
		  typ=ob.Type
		  
		  if typ=AccessibilityMBS.kAXUIElementMBSTypeID then
		    if ob isa AXUIElementMBS then
		      el=AXUIElementMBS(ob)
		    else
		      el=new AXUIElementMBS // make a new object to avoid cast exception
		      el.Handle=ob.Handle
		    end if
		    
		    showelement el
		  elseif typ=kCFArrayMBSTypeID then
		    showCFarray ob
		  elseif typ=kCFSetMBSTypeID then
		    List.AddRow "kCFSet"
		  elseif typ=kCFStringMBSTypeID then
		    showCFString ob
		  elseif typ=kCFNumberMBSTypeID then
		    showCFNumber ob
		  elseif typ=kCFBagMBSTypeID then
		    List.AddRow "kCFBag"
		  elseif typ=kCFDictionaryMBSTypeID then
		    List.AddRow "kCFDictionary"
		  elseif typ=kCFBinaryDataMBSTypeID then
		    List.AddRow "kCFBinaryData"
		  elseif typ=kCFBooleanMBSTypeID then
		    showCFBoolean ob
		  elseif typ=kCFURLMBSTypeID then
		    List.AddRow "kCFURL"
		  elseif typ=kCFDateMBSTypeID then
		    List.AddRow "kCFDate"
		  else
		    List.AddRow "?"
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected obj(0) As cfobjectMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub ExpandRow(row As Integer)
		  dim id as integer
		  
		  id=val(List.Cell(row,1))
		  
		  if id>0 then
		    showvalue obj(id)
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
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
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
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
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
