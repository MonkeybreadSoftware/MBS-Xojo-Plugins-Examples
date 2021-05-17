#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  // Example provided by Jared Feder
		  
		  
		  // you may need a test file
		  Dim file As FolderItem = SpecialFolder.Desktop.Child("test.tif")
		  
		  // Open XMP packet for update
		  dim xmpMeta As XMPMetaMBS
		  dim packetInfo As XMPPacketInfoMBS
		  dim xmpPacket As string
		  dim xmpFile as new XMPFilesMBS
		  
		  if not xmpFile.OpenFile(file,XMPFilesMBS.kUnknownFile,XMPFilesMBS.kOpenForUpdate) then
		    break
		  end
		  
		  if not xmpFile.GetXMP(xmpMeta,xmpPacket,packetInfo) then
		    break
		  end if
		  
		  
		  // Register Namespace
		  dim ns as string = "http://ns.adobe.com/xmp/sdk/"
		  dim registeredPrefix as string
		  
		  if not xmpMeta.RegisterNamespace(ns, "sdk", registeredPrefix) then
		    break
		  end
		  
		  
		  // "Composing paths to complex properties" example from page 24 of XMP Toolkit Programmer's Guide
		  
		  // string ns = "http://ns.adobe.com/xmp/sdk/";
		  // meta.SetProperty( ns.c_str(), "MyProperty", NULL, kXMP_PropValueIsStruct );
		  // string path;
		  
		  // SXMPUtils::ComposeStructFieldPath( ns.c_str(), "MyProperty", ns.c_str(), "F2", &path);
		  // -- path is now "MyProperty2/sdk:F2"
		  
		  // meta.AppendArrayItem( ns.c_str(), path.c_str(), kXMP_PropArrayIsOrdered, NULL, kXMP_PropValueIsStruct );
		  // SXMPUtils::ComposeArrayItemPath( ns.c_str(), path.c_str(), kXMP_ArrayLastItem, &path );
		  // -- path is now "MyProperty2/sdk:F2[last()]"
		  
		  // SXMPUtils::ComposeStructFieldPath( ns.c_str(), path.c_str(), ns.c_str(), "F4", &path );
		  // -- path is now "MyProperty2/sdk:F2[last()]/sdk:F4"
		  
		  // meta.SetProperty( ns.c_str(), path.c_str(), "AValue3", NULL );
		  
		  
		  xmpMeta.SetProperty(ns, "MyProperty", "", XMPMetaMBS.kPropValueIsStruct)
		  
		  dim path as string = xmpMeta.ComposeStructFieldPath(ns, "MyProperty", ns,"F2")
		  // path is now "MyProperty2/sdk:F2"
		  
		  xmpMeta.AppendArrayItem(ns, path, XMPMetaMBS.kPropArrayIsOrdered, "", XMPMetaMBS.kPropValueIsStruct)
		  path = xmpMeta.ComposeArrayItemPath(ns, path, XMPMetaMBS.kArrayLastItem)
		  // path is now "MyProperty2/sdk:F2[last()]"
		  
		  path = xmpMeta.ComposeStructFieldPath(ns, path, ns, "F4")
		  // path is now "MyProperty2/sdk:F2[last()]/sdk:F4"
		  
		  xmpMeta.SetProperty(ns, path, "AValue3")
		  
		  
		  // Write XMP Packet
		  if xmpFile.CanPutXMP(xmpMeta) then
		    xmpFile.PutXMP(xmpMeta)
		    xmpFile.CloseFile(XMPFilesMBS.kNoOptions)
		  else
		    break
		  end if
		  
		  
		End Function
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
