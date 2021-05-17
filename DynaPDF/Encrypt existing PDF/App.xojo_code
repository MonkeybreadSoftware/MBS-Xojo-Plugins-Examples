#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // some PDF
		  dim InputFile as FolderItem = SpecialFolder.Desktop.Child("Input.pdf")
		  dim EncryptedFile as FolderItem = SpecialFolder.Desktop.Child("Encrypted.pdf")
		  dim DecryptedFile as FolderItem = SpecialFolder.Desktop.Child("Decrypted.pdf")
		  
		  EncryptedFile.Delete
		  InputFile.CopyFileTo EncryptedFile
		  
		  dim pdf as new MyDynapdfMBS
		  
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  if 0 = pdf.EncryptPDF(EncryptedFile, "user", "owner", pdf.kkl128bit, pdf.krsPrint) then
		    MsgBox "OK"
		  else
		    EncryptedFile.Delete
		    Return
		  end if
		  
		  
		  DecryptedFile.Delete
		  EncryptedFile.CopyFileTo DecryptedFile
		  
		  // decrypt
		  if 0 = pdf.DecryptPDF(DecryptedFile, pdf.kptOwner, "owner") then
		    MsgBox "OK"
		  else
		    DecryptedFile.Delete
		    Return
		  end if
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
