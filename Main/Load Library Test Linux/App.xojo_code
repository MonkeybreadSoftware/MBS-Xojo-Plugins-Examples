#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  // this little tool allows you to try library loading on Linux
		  
		  
		  if args.Ubound < 1 then
		    print "Call with path to library."
		    return 5
		  end if
		  
		  dim path as string = args(1)
		  print "try: "+path
		  
		  
		  #if TargetLinux
		    // void *dlopen(const char *filename, int flags);
		    declare function dlopen lib "libdl" (path as CString, flags as Int32) as Ptr
		    
		    const flags = 2
		    
		    dim p as ptr = dlopen(path, flags)
		    if p <> nil then
		      print "OK"
		    else
		      print "Failed"
		      
		      declare function dlerror lib "libdl" () as CString
		      
		      dim e as string = dlerror
		      
		      print e
		      
		    end if
		  #endif
		End Function
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
