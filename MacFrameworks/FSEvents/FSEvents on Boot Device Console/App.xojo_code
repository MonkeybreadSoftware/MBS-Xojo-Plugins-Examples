#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  dim eventid as UInt64
		  dim flags as integer
		  dim latency as Double
		  dim DeviceID as integer
		  dim volume as FolderItem = volume(0)
		  dim path as string = ""
		  
		  DeviceID=FSEventsMBS.GetDeviceID(volume)
		  
		  eventid=FSEventsMBS.GetCurrentEventId
		  flags=FSEventsMBS.kFSEventStreamCreateFlagNone
		  latency=1.0
		  
		  f=new FSEvents(DeviceID, path, eventid, latency, flags)
		  f.mypath=path
		  
		  if not f.Start then
		    print "Failed to start."
		    Return 0
		  end if
		  
		  
		  print "running... Press Control-C to stop in Terminal."
		  do
		    DelayMBS 1.0
		  loop 
		  
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		f As fsevents
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
