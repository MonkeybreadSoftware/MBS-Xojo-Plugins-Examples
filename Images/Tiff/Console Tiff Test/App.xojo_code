#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  dim p as Picture = LogoMBS(500)
		  dim s as string = PictureToTiffStringMBS(p)
		  dim f as FolderItem = SpecialFolder.Desktop.Child("test.tif")
		  dim b as BinaryStream = BinaryStream.Create(f, true)
		  b.Write s
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function PictureToTiffStringMBS(pic as picture) As string
		  dim t as TiffPictureMBS
		  
		  t=new TiffPictureMBS
		  if t.CreateString(&h100000) then
		    t.Pict=pic
		    if t.WriteRGB then
		      t.Close
		      Return t.OutputBuffer
		    end if
		  end if
		End Function
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
