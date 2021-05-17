#tag Class
Protected Class MyCGScreenRefreshEvent
Inherits CGScreenRefreshEventMBS
	#tag Event
		Sub ScreenRefresh(rectCount as Integer, rects() as CGRectMBS)
		  dim n as integer = 0
		  
		  // filter our own window.
		  dim c as integer = 0
		  
		  dim wl as integer = window1.Left
		  dim wt as integer = window1.top
		  dim ww as integer = window1.Width
		  dim wh as integer = window1.Height
		  
		  for each r as CGRectMBS in rects
		    
		    if r.Left >= wl and r.top >= wt then
		      if r.Left + r.Width <= wl + ww and r.top + r.Height <= wh + wt then
		        
		        c = c + 1
		        
		      end if
		    end if
		    
		  next
		  
		  if c = rectCount then return
		  
		  // show others, e.g. seconds in menubar
		  
		  list.InsertRow n, "ScreenRefresh "+str(rectCount)+" rectangles"
		  
		  for each r as CGRectMBS in rects
		    n = n + 1
		    list.InsertRow n, "   pos: "+str(r.Left)+"/"+str(r.top)+", width: "+str(r.Width)+", height: "+str(r.Height)
		  next
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		list As Listbox
	#tag EndProperty


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
