#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim f as FolderItem = SpecialFolder.Desktop.Child("XMP Core Coverage.txt")
		  dim t as TextOutputStream = f.CreateTextFile
		  t.Delimiter=EndOfLine.UNIX
		  
		  XMPCoreCoverage.out=t
		  XMPCoreCoverage.DoXMPCoverage1
		  XMPCoreCoverage.DoXMPCoverage2
		  XMPCoreCoverage.DoXMPCoverage3
		  XMPCoreCoverage.DoXMPCoverage4
		  XMPCoreCoverage.DoXMPCoverage5
		  XMPCoreCoverage.DoXMPCoverage6
		  XMPCoreCoverage.DoXMPCoverage7
		  XMPCoreCoverage.DoXMPCoverage8
		  XMPCoreCoverage.DoXMPCoverage9
		  XMPCoreCoverage.DoXMPCoverage10
		  XMPCoreCoverage.DoXMPCoverage11
		  
		  t.Close
		  
		  f.Launch
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
