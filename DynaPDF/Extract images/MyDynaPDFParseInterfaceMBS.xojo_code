#tag Class
Protected Class MyDynaPDFParseInterfaceMBS
Inherits DynaPDFParseInterfaceMBS
	#tag Event
		Function BeginTemplate(ObjectPtr as integer, Handle as integer, BBox as DynaPDFRectMBS, Matrix as DynaPDFMatrixMBS) As integer
		  System.DebugLog "Begin Template"
		End Function
	#tag EndEvent

	#tag Event
		Function InsertImage(image as DynaPDFImageMBS) As integer
		  Dim ImageFile As FolderItem = ProcessImage(image)
		  
		  
		  Dim MaskFile As FolderItem
		  
		  // check if we have soft mask to extract:
		  
		  If image.ISoftMaskHandle >= 0 Then
		    
		    Dim img As DynaPDFImageMBS = pdf.GetImageObj(image.ISoftMaskHandle, pdf.kpfDecomprAllImages)
		    
		    If img <> Nil Then
		      MaskFile = ProcessImage(img)
		      
		    end if
		  End If
		  
		  
		  // check if we have mask to extract:
		  
		  If image.IMaskImageHandle >= 0 Then
		    
		    Dim img As DynaPDFImageMBS = pdf.GetImageObj(image.IMaskImageHandle, pdf.kpfDecomprAllImages)
		    
		    If img <> Nil Then
		      MaskFile = ProcessImage(img)
		      
		    End If
		  End If
		  
		  
		  
		  If MaskFile <> Nil And ImageFile <> Nil Then
		    
		    // let's try to apply mask
		    
		    Dim pic As Picture = Picture.Open(ImageFile)
		    Dim mask As Picture = Picture.Open(MaskFile)
		    
		    If pic <> Nil And mask <> Nil Then
		      
		      mask = mask.InvertMBS
		      
		      // combine picture and mask
		      Dim newPicture As New Picture(pic.Width, pic.Height, 32)
		      newPicture.Graphics.DrawPicture       pic, 0, 0, pic.Width, pic.Height, 0, 0, pic.Width, pic.Height
		      newPicture.mask.Graphics.DrawPicture mask, 0, 0, pic.Width, pic.Height, 0, 0, mask.Width, mask.Height
		      
		      
		      // save it
		      Dim FileName As String = ImageFile.NameWithoutExtensionMBS + ".png"
		      Dim File As FolderItem = ImageFile.Parent.Child(FileName)
		      
		      newPicture.Save(File, newPicture.SaveAsPNG, newPicture.QualityHigh)
		      
		    End If
		    
		  End If
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function ProcessImage(Image as DynaPDFImageMBS) As FolderItem
		  Dim b As BinaryStream
		  Dim f As FolderItem
		  
		  System.DebugLog "Insert Image"
		  
		  counter = counter + 1
		  
		  Select Case Image.filter 
		  Case DynapdfMBS.kdfDCTDecode // JPEG
		    f=dest.Child(Str(Counter)+".jpg")
		    b=f.CreateBinaryFile("")
		    If b<>Nil Then
		      b.Write image.Buffer
		      b.Close
		      Return f
		    End If
		    
		  Case DynapdfMBS.kdfJPXDecode // JPEG 2000
		    f=dest.Child(Str(Counter)+".jp2")
		    b=f.CreateBinaryFile("")
		    If b<>Nil Then
		      b.Write image.Buffer
		      b.Close
		      Return f
		    End If
		    
		  Else // anything else
		    
		    f=dest.Child(Str(Counter)+".tif")
		    
		    If pdf.CreateImage(f, pdf.kifmTIFF) Then
		      Call pdf.addimage(pdf.kcfLZW, pdf.kicNone, image)
		      Call pdf.CloseImage
		      Return f
		    End If
		    
		  End Select
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Counter As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		dest As folderitem
	#tag EndProperty

	#tag Property, Flags = &h0
		pdf As dynaPDFmbs
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
		#tag ViewProperty
			Name="Counter"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
