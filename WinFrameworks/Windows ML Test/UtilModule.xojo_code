#tag Module
Protected Module UtilModule
	#tag Method, Flags = &h0
		Function Extra(extends feature as WinLearningModelFeatureDescriptorMBS) As string
		  
		  if feature isa WinLearningModelTensorFeatureDescriptorMBS then
		    dim f as WinLearningModelTensorFeatureDescriptorMBS = WinLearningModelTensorFeatureDescriptorMBS(feature)
		    dim shape() as integer = f.Shape
		    dim shapes() as string
		    for each s as integer in shape
		      shapes.Append Str(s)
		    next
		    
		    return f.TensorKindName + " (" + join(shapes, ", ") + ")"
		  end if
		  
		  if feature isa WinLearningModelImageFeatureDescriptorMBS then
		    dim f as WinLearningModelImageFeatureDescriptorMBS = WinLearningModelImageFeatureDescriptorMBS(feature)
		    Return Str(f.Width) + "x" + Str(f.Height)
		  end if
		  
		  if feature isa WinLearningModelSequenceFeatureDescriptorMBS then
		    dim f as WinLearningModelSequenceFeatureDescriptorMBS = WinLearningModelSequenceFeatureDescriptorMBS(feature)
		    Return f.ElementDescriptor.Name+" "+f.ElementDescriptor.KindString
		  end if
		  
		  if feature isa WinLearningModelMapFeatureDescriptorMBS then
		    dim f as WinLearningModelMapFeatureDescriptorMBS = WinLearningModelMapFeatureDescriptorMBS(feature)
		    Return f.ValueDescriptor.Name+" "+f.ValueDescriptor.KindString
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KindString(extends m as WinLearningModelFeatureDescriptorMBS) As string
		  Select case m.Kind
		  case m.KindImage
		    return "Image"
		  case m.KindMap
		    return "Map"
		  case m.KindSequence
		    return "Sequence"
		  case m.KindTensor
		    return "Tensor"
		  Else
		    Return str(m.Kind)
		  end Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TensorKindName(extends m as WinLearningModelTensorFeatureDescriptorMBS) As string
		  Select case m.TensorKind
		  case m.TensorKindBoolean
		    return "Boolean"
		  case m.TensorKindComplex128
		    return "Complex128"
		  case m.TensorKindComplex64
		    return "Complex64"
		  case m.TensorKindDouble
		    return "Double"
		  case m.TensorKindFloat
		    return "Float"
		  case m.TensorKindFloat16
		    return "Float16"
		  case m.TensorKindInt16
		    return "Int16"
		  case m.TensorKindInt32
		    return "Int32"
		  case m.TensorKindInt64
		    return "Int64"
		  case m.TensorKindInt8
		    return "Int8"
		  case m.TensorKindString
		    return "String"
		  case m.TensorKindUInt16
		    return "UInt16"
		  case m.TensorKindUInt32
		    return "UInt32"
		  case m.TensorKindUInt64
		    return "UInt64"
		  case m.TensorKindUInt8
		    return "UInt8"
		    
		  else
		    Return str(m.TensorKind)
		  end Select
		  
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
