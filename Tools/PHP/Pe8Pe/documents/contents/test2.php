<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Testing PHP MBS</title>
</head>
<body>
<h2>PHPMBS Second Test - PhpInfo</h2>
<a href="contents/test3.php?a=1&testingnum=12.122&testing=This is a Get Query Test"/>Load Next Test</a><br /><br />
<strong>This is the Internal PHP Info</strong><br />
	<div style="overflow:scroll; height:250px; width:100%;">
		<?php echo phpinfo(); ?>
	</div>
    
    <br/>
    <form method="get" action="test3.php">
    Test a form here:
    <table border="1">
    <tr><td><input type="text" name="testingnum" value="12.122" /></td></tr>
    <tr><td><input type="text" name="testing" value="This is a Get Query Test" /></td></tr>
    <tr><td colspan="2" align="center"><input type="submit" value="Go!" /></td>
    </tr>
    </table>
    </form><br /><br />
     Or: <input type="button" value="Load Next Test" onclick="window.location.href='contents/test3.php?a=1&testingnum=12.122&testing=This is a Get Query Test';"/>
</body>
</html>