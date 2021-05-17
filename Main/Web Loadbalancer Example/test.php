#!/usr/bin/php
<?php

// simply http query and return answer
function get_content($URL)
{
      $ch = curl_init();
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
      curl_setopt($ch, CURLOPT_URL, $URL);
      $data = curl_exec($ch);
      curl_close($ch);
      return $data;
}


// Fallback URL if all are unreachable
$bestURL = "http://webapps.monkeybreadsoftware.de/offline.html";
$bestSessionCount = 9999;

for ($x = 1; $x <= 2; $x++) 
{
	$StatusURL = "http://webapps.monkeybreadsoftware.de/MyApp".$x."/myapp.cgi";
	$JSON = get_content($StatusURL."/api/status");

	if (strlen($JSON) > 0)
	{
		$j = json_decode($JSON, true);
		
		if ($j == NULL)
		{
			// Server answer not JSON!?
		}
		else
		{
			$SessionCount = $j["SessionCount"];
			
			if ($SessionCount < $bestSessionCount)
			{
				$bestURL = $StatusURL;
				$bestSessionCount = $SessionCount;
			}
		}
	}
}

# redirect to best match
 header('Location: '.$bestURL);

?>
