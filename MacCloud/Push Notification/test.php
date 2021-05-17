#!/usr/bin/php
<?php
// APNs Push test for this token
$deviceToken = "1addd2a1158b25019b92ebc629b4c79dff63e2c2d884af17044176fb52c7a3d3"; // Put here token for your app!

// Create Payload and encode as JSON
$payload['aps'] = array('alert' => 'Hallo Monkeybread Software!', 'badge' => 1, 'sound' => 'default');
$payload = json_encode($payload);

$apnsHost = 'gateway.sandbox.push.apple.com';
$apnsPort = 2195;
$apnsCert = 'Certificate.pem';

// Stream erstellen
$streamContext = stream_context_create();
stream_context_set_option($streamContext, 'ssl', 'local_cert', $apnsCert);

$apns = stream_socket_client('ssl://' . $apnsHost . ':' . $apnsPort, $error, $errorString, 2, STREAM_CLIENT_CONNECT, $streamContext);
if ($apns)
{
  // Build notification and send it
  $apnsMessage = chr(0) . chr(0) . chr(32) . pack('H*', str_replace(' ', '', $deviceToken)) . chr(0) . chr(strlen($payload)) . $payload;
  fwrite($apns, $apnsMessage);

  // Close connection
  fclose($apns);
}
else
{
  echo "Fehler!";
  var_dump($error);
  var_dump($errorString);
}
?>