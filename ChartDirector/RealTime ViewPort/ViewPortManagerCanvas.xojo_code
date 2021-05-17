#tag Class
Protected Class ViewPortManagerCanvas
Inherits Canvas
	#tag Method, Flags = &h0
		Function canZoomIn(zoomDirection as integer) As boolean
		  return ViewPortManager.canZoomIn(zoomDirection)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function canZoomOut(zoomDirection as integer) As boolean
		  return ViewPortManager.canZoomOut(zoomDirection)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub clearAllRanges()
		  ViewPortManager.clearAllRanges
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub commitPendingSyncAxis(baseChart as CDBaseChartMBS)
		  ViewPortManager.commitPendingSyncAxis(baseChart)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  self.ViewPortManager = New CDViewPortManagerMBS
		  
		  
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function dragTo(scrollDirection as Integer, x as Integer, y as Integer) As boolean
		  Return ViewPortManager.dragTo(scrollDirection, x, y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getPlotAreaHeight() As integer
		  Return ViewPortManager.getPlotAreaHeight
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getPlotAreaLeft() As integer
		  Return ViewPortManager.getPlotAreaLeft
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getPlotAreaTop() As integer
		  Return ViewPortManager.getPlotAreaTop
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getPlotAreaWidth() As integer
		  Return ViewPortManager.getPlotAreaWidth
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getValueAtViewPort(id as string, ratio as double, isLogScale as boolean = false) As double
		  Return ViewPortManager.getValueAtViewPort(id, ratio, isLogScale)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getViewPortAtValue(id as string, ratio as double, isLogScale as boolean = false) As double
		  Return ViewPortManager.getViewPortAtValue(id, ratio, isLogScale)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getViewPortHeight() As Double
		  Return ViewPortManager.getViewPortHeight
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getViewPortLeft() As Double
		  return ViewPortManager.getViewPortLeft
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getViewPortTop() As Double
		  return ViewPortManager.getViewPortTop
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getViewPortWidth() As Double
		  return ViewPortManager.getViewPortWidth
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function inExtendedPlotArea(x as integer, y as integer) As boolean
		  Return ViewPortManager.inExtendedPlotArea(x,y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function inPlotArea(x as Integer, y as Integer) As boolean
		  Return ViewPortManager.inPlotArea(x,y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setChartMetrics(metrics as string)
		  ViewPortManager.setChartMetrics metrics
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setFullRange(ID as string, minValue as Double, maxValue as Double)
		  ViewPortManager.setFullRange(ID, minValue, maxValue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setPlotAreaMouseMargin(leftMargin as Integer, rightMargin as Integer, topMargin as Integer, bottomMargin as Integer)
		  ViewPortManager.setPlotAreaMouseMargin(leftMargin, rightMargin, topMargin, bottomMargin)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setViewPortHeight(value as double)
		  'System.DebugLog CurrentMethodName + " " + Str(value)
		  
		  ViewPortManager.setViewPortHeight(value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setViewPortLeft(value as double)
		  System.DebugLog CurrentMethodName + " " + Str(value)
		  
		  ViewPortManager.setViewPortLeft(value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setViewPortTop(value as double)
		  'System.DebugLog CurrentMethodName + " " + Str(value)
		  
		  ViewPortManager.setViewPortTop(value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setViewPortWidth(value as double)
		  'System.DebugLog CurrentMethodName + " " + Str(value)
		  
		  ViewPortManager.setViewPortWidth(value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setZoomInHeightLimit(value as double)
		  ViewPortManager.setZoomInHeightLimit(value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setZoomInWidthLimit(value as double)
		  ViewPortManager.setZoomInWidthLimit(value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setZoomOutHeightLimit(value as double)
		  System.DebugLog CurrentMethodName + " " + Str(value)
		  
		  ViewPortManager.setZoomOutHeightLimit(value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setZoomOutWidthLimit(value as double)
		  System.DebugLog CurrentMethodName + " " + Str(value)
		  
		  ViewPortManager.setZoomOutWidthLimit(value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub startDrag()
		  ViewPortManager.startDrag
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function updateFullRangeH(id as string, minValue as double, maxValue as double, updateType as Integer) As boolean
		  'System.DebugLog CurrentMethodName+" minValue: "+Str(minValue)+" maxValue: "+Str(maxValue)
		  
		  Return ViewPortManager.updateFullRangeH(id, minValue, maxValue, updateType)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function updateFullRangeV(id as string, minValue as double, maxValue as double, updateType as Integer) As boolean
		  Return ViewPortManager.updateFullRangeV(id, minValue, maxValue, updateType)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub validateViewPort()
		  ViewPortManager.validateViewPort
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function zoomAround(x as Integer, y as Integer, xZoomRatio as Double, yZoomRatio as Double) As boolean
		  Return ViewPortManager.zoomAround(x, y, xZoomRatio, yZoomRatio)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function zoomAt(zoomDirection as Integer, x as Integer, y as Integer, zoomRatio as Double) As boolean
		  Return ViewPortManager.zoomAt(zoomDirection, x, y, zoomRatio)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function zoomTo(zoomDirection as Integer, x1 as Integer, y1 as Integer, x2 as Integer, y2 as Integer) As boolean
		  return ViewPortManager.zoomTo(zoomDirection, x1, y1, x2, y2)
		End Function
	#tag EndMethod


	#tag Note, Name = About this class
		
		In C++ you can have a class inherit from multiple classes
		
		In Xojo you can't.
		
		So we have this intermediate class to forward all calls to
		
		Once this code is fully debugged and running, someone may remove this intermediate class and change all calls to the methods with ViewPortManager. prefix.
	#tag EndNote


	#tag Property, Flags = &h0
		ViewPortManager As CDViewPortManagerMBS
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
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
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
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
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
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
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group=""
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
