#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  // For testing why a plugin does not load
		  // compile for Linux or Mac OS X
		  // run in terminal with path to plugin shared library from your compiled application
		  
		  // pick path from arguments
		  dim testpath as string = args(1)
		  print "Path: "+testpath
		  
		  // declare for loading shared library
		  declare function dlopen lib LibDL (path as cstring, mode as integer) as ptr
		  declare function dlerror lib LibDL () as CString
		  
		  // load lib
		  dim p as ptr = dlopen(testpath, 2)
		  
		  // check for error and print message
		  if p <> nil then
		    print "OK"
		  end if
		  print dlerror()
		  
		End Function
	#tag EndEvent


	#tag Constant, Name = LibDL, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"/usr/lib/libdl.dylib"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"/usr/lib/libdl.so"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
