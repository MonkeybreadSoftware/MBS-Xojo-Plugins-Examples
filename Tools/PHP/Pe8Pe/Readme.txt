Pe8Pe is a little tool/example of what you can do with PHPMBS. 
Pe8Pe let you browse/execute php and html pages the same way you can do on a web server powered with php, but without the need of a web server. You can navigate, starting from the index.php file inside documents folder, follow thru all the anchor links, and also, make the use of GET queries from links and Forms.
This tool/example make use of few MBS plugins and its events, like WebFrameLoadDelegateMBS, WebScriptCallBackMBS, StopLoadingMBS, LoadHTMLStringMBS, LoadURLMBS, unixPathMBS, RegExMBS, as well as PHPMBS; that you can use as examples on how they work and use them for your own projects.
I've included some examples inside documents folder, starting on index.php 
an example of the use of php's SimpleXML module, following by the second test wich includes
the common phpinfo result inside a div layer plus a test form that make use of GET query; 
a third page that shows the results of the form or links with GET query, and the last page
wich is a test of a plain HTML file.


With Pe8Pe You Can:

	* Navigate/Execute Php Files inside documents folder
	* Follow Anchor links and Buttons with onclick event: "window.location.href='blah'"
	* You can acnchor-link back to parent folders using "../"
	* Use GET Query forms and links (using $_GET or $_REQUEST inside php to retrieve values)
	* It's Free
	* You can imagine what more you can do with this tool/example.
	* "You can share your improved source code" !  :)

What Pe8Pe You Can't:

	* Use Frames (the frames are not being processed by Pe8Pe)
	* Use it on windows without some improvements. It was made on mac and works on mac for sure.
	  It's due to the paths and other small things that can be easy extended to work on
	  windows; you can use "Target" conditions to correct paths to use "\" insted of "/" etc.
	* Claim for support. This is a free tool/example of how to use PHPMBS and some other MBS Plugins. 
	* You may found other things that Pe8Pe Can't Do, that you can ADD and Extend the tool 
	   then "Share" as i did ! :)


Pe8Pe was made by Roberto Antonio Berrospe Machin
http://www.ibobsoftware.com
