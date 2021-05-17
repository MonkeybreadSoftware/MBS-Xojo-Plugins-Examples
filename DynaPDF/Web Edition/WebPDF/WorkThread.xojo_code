#tag Class
Protected Class WorkThread
Inherits Thread
	#tag Event
		Sub Run()
		  
		  while jobs<>Nil 
		    dim j as RenderJob = jobs
		    jobs = nil
		    
		    RenderOneJob j
		  wend
		  
		  Exception o as runtimeException
		    System.DebugLog GetObjectClassNameMBS(o)+" on work thread: "+o.message
		    
		    
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CancelClear()
		  System.DebugLog CurrentMethodName
		  
		  // abort current job
		  jobs = nil
		  cancel = true
		  
		  // wait for thread to finish
		  while State = Running
		    Sleep(1, true)
		  wend
		  
		  // clear properties
		  'TargetSession = nil
		  page = nil
		  
		  System.DebugLog CurrentMethodName+" done."
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(t as WebSession)
		  #pragma DisableBackgroundTasks
		  
		  // Calling the overridden superclass constructor.
		  'Super.Constructor
		  TargetSession = t
		  
		  Options = new DynaPDFRasterImageMBS
		  Options.InitWhite = true
		  Options.DefScale = options.kpsFitBest
		  Options.FrameColor = &h777777
		  Options.DrawFrameRect = true
		  
		  PageDic = new Dictionary
		  WebPictureCache = new Dictionary
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Render(p as MainPage, d as DynaPDFMBS, DocChanged as Boolean)
		  #pragma DisableBackgroundTasks
		  
		  page = p
		  pdf = d
		  
		  dim j as new RenderJob
		  
		  j.PageIndex = p.CurrentPage
		  j.height = p.View.Height
		  j.width = p.view.Width
		  
		  if DocChanged then
		    PageDic.clear
		    WebPictureCache.Clear
		  end if
		  
		  jobs = j
		  cancel = true
		  
		  
		  if me.State <> me.Running then
		    System.DebugLog "Starting work thread..."
		    me.run
		  end if
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RenderOneJob(j as RenderJob)
		  dim ws as new WebSessionContext(TargetSession)
		  if TargetSession = nil then
		    Break
		  end if
		  
		  System.DebugLog CurrentMethodName + ": "+str(j.PageIndex)
		  cancel = false
		  
		  // do we need to create a new rasterizer?
		  dim NeedNewRasterizer as Boolean
		  
		  if LastWidth <> j.width or LastHeight<>j.height then
		    
		    WebPictureCache.Clear
		  else
		    
		    
		    // maybe we rendered that page already?
		    dim w as WebPicture = WebPictureCache.lookup(j.PageIndex, nil)
		    if w<>Nil then
		      System.DebugLog "Found picture in cache."
		      self.page.view.picture = w
		      Return
		    end if
		    
		  end if
		  
		  LastWidth = j.width
		  LastHeight = j.height
		  
		  if cancel then Return
		  
		  // we import page only one time
		  dim PageIndex as integer = j.PageIndex
		  dim page as DynaPDFPageMBS = PageDic.Lookup(PageIndex, nil)
		  
		  if page = nil then
		    System.DebugLog "Import page with index "+str(PageIndex)
		    if pdf.Append then
		      if pdf.ImportPageEx(PageIndex, 1.0, 1.0)>=0 then
		        if pdf.EndPage then
		          page = pdf.GetPage(pdf.GetPageCount)
		          PageDic.Value(PageIndex) = page
		        end if
		      else
		        call pdf.EndPage
		      end if
		    end if
		  else
		    System.DebugLog "Found page in cache."
		  end if
		  
		  if cancel then Return
		  
		  if page<>Nil then
		    
		    // render multithreaded
		    
		    System.DebugLog "Render page threaded... "+str(page.Page)+" "+str(j.PageIndex)
		    
		    dim cr as DynaPDFRectMBS = page.BBox(page.kpbCropBox)
		    dim mr as DynaPDFRectMBS = page.BBox(page.kpbMediaBox)
		    dim r as DynaPDFRectMBS
		    if cr = nil then
		      r = mr
		    else
		      r = cr
		    end if
		    
		    dim PageWidth  as integer = r.Right - r.left
		    dim PageHeight as integer = abs(r.Bottom - r.top)
		    
		    // Calculate scale factor
		    
		    dim faktor as Double = min( j.Height / PageHeight, j.Width / PageWidth)
		    
		    // Calculate new size
		    dim w as integer = PageWidth  * faktor
		    dim h as integer = PageHeight * faktor
		    
		    dim Flags  as integer = DynaPDFRasterImageMBS.krfDefault
		    dim PixFmt as integer = DynaPDFRasterizerMBS.kpxfRGB
		    dim Filter as integer = DynaPDFMBS.kcfJPEG
		    dim Format as integer = DynaPDFMBS.kifmJPEG
		    dim p      as integer = page.page
		    
		    if pdf.RenderPageToImageMT(p, nil, 0, w, h, Flags, PixFmt, Filter, Format) then
		      
		      System.DebugLog "Render page done: success"
		      if not cancel then
		        dim data as string = pdf.GetImageBuffer
		        System.DebugLog "Render done."
		        pdf.FreeImageBuffer
		        
		        dim ww as new WebPicture(data, Picture.FormatJPEG)
		        
		        WebPictureCache.Value(j.PageIndex) = ww
		        
		        // debug write image files to desktop
		        #if DebugBuild and false then
		          dim f as FolderItem = SpecialFolder.Desktop.Child(str(j.pageIndex)+".jpg")
		          dim b as BinaryStream = BinaryStream.Create(f, true)
		          b.Write data
		          b.Close
		        #endif
		        
		        self.page.view.picture = ww
		      end if
		    else
		      System.DebugLog "Render page done: failed"
		    end if
		  end if
		  
		  System.DebugLog CurrentMethodName +" Done."
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		cancel As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Jobs As RenderJob
	#tag EndProperty

	#tag Property, Flags = &h0
		LastHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		LastWidth As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		options As DynaPDFRasterImageMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		page As MainPage
	#tag EndProperty

	#tag Property, Flags = &h0
		PageDic As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		pdf As DynaPDFMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		TargetSession As WebSession
	#tag EndProperty

	#tag Property, Flags = &h0
		WebPictureCache As Dictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="DebugIdentifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadState"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ThreadStates"
			EditorType="Enum"
			#tag EnumValues
				"0 - Running"
				"1 - Waiting"
				"2 - Paused"
				"3 - Sleeping"
				"4 - NotRunning"
			#tag EndEnumValues
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
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="cancel"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastWidth"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastHeight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
