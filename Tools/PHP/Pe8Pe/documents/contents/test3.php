<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>PHP MBS Test 3</title>
</head>
<body>
<h2>PHPMBS Test</h2>

<?php
	echo "THIRD TEST";
	
	echo "<br>This is a $ _GET Number Test: ".$_GET['testingnum'];
	echo "<br>This is a $ _GET String Test: ".$_GET['testing'];
?>
	
   <br/>
    <br/>
    <input type="button" value="Test load a plain html file" onclick="window.location.href='contents/test4.html';"/>
</body>
</html>
