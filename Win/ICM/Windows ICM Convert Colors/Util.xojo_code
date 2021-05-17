#tag Module
Protected Module Util
	#tag Method, Flags = &h0
		Function ProfileClassName(extends w as WindowsICMProfileMBS) As string
		  dim h as WindowsICMProfileHeaderMBS = w.ColorProfileHeader
		  
		  if h=nil then Return "?"
		  
		  Select case h.Classs
		  case WindowsICMProfileHeaderMBS.CLASS_MONITOR
		    Return "Monitor"
		  case WindowsICMProfileHeaderMBS.CLASS_PRINTER
		    Return "Printer"
		  case WindowsICMProfileHeaderMBS.CLASS_SCANNER
		    Return "Scanner"
		  case WindowsICMProfileHeaderMBS.CLASS_LINK
		    Return "Link"
		  case WindowsICMProfileHeaderMBS.CLASS_ABSTRACT
		    Return "Abstract"
		  case WindowsICMProfileHeaderMBS.CLASS_COLORSPACE
		    Return "Colorspace"
		  case WindowsICMProfileHeaderMBS.CLASS_NAMED
		    Return "Named"
		  case WindowsICMProfileHeaderMBS.CLASS_CAMP
		    Return "Camp"
		  case WindowsICMProfileHeaderMBS.CLASS_GMMP
		    Return "GNMP"
		  else
		    Return "Unknown: "+hex(h.Classs)
		  end Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ProfileColorSpace(extends w as WindowsICMProfileMBS) As string
		  dim h as WindowsICMProfileHeaderMBS = w.ColorProfileHeader
		  
		  if h=nil then Return "?"
		  
		  Select case h.DataColorSpace
		  case WindowsICMProfileHeaderMBS.SPACE_XYZ
		    Return "XYZ"
		  case WindowsICMProfileHeaderMBS.SPACE_Lab
		    Return "Lab"
		  case WindowsICMProfileHeaderMBS.SPACE_Luv
		    Return "Luv"
		  case WindowsICMProfileHeaderMBS.SPACE_YCbCr
		    Return "YCbCr"
		  case WindowsICMProfileHeaderMBS.SPACE_Yxy
		    Return "Yxy"
		  case WindowsICMProfileHeaderMBS.SPACE_RGB
		    Return "RGB"
		  case WindowsICMProfileHeaderMBS.SPACE_GRAY
		    Return "GRAY"
		  case WindowsICMProfileHeaderMBS.SPACE_HSV
		    Return "HSV"
		  case WindowsICMProfileHeaderMBS.SPACE_HLS
		    Return "HLS"
		  case WindowsICMProfileHeaderMBS.SPACE_CMYK
		    Return "CMYK"
		  case WindowsICMProfileHeaderMBS.SPACE_CMY
		    Return "CMY"
		  case WindowsICMProfileHeaderMBS.SPACE_2_CHANNEL
		    Return "2 Channel"
		  case WindowsICMProfileHeaderMBS.SPACE_3_CHANNEL
		    Return "2 Channel"
		  case WindowsICMProfileHeaderMBS.SPACE_4_CHANNEL
		    Return "2 Channel"
		  case WindowsICMProfileHeaderMBS.SPACE_5_CHANNEL
		    Return "2 Channel"
		  case WindowsICMProfileHeaderMBS.SPACE_6_CHANNEL
		    Return "2 Channel"
		  case WindowsICMProfileHeaderMBS.SPACE_7_CHANNEL
		    Return "2 Channel"
		  case WindowsICMProfileHeaderMBS.SPACE_8_CHANNEL
		    Return "2 Channel"
		  else
		    Return "Unknown: "+hex(h.DataColorSpace)
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
