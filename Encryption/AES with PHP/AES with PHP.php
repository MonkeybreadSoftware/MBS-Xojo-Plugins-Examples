<?php

// use of OpenSSL requires PHP 5.3

header('Content-Type: text/plain; charset=UTF-8');

$key = "Hello";
$iv = "test";

$plaintext = "Just a test message. äöü";

// encrypt with AES 256bit and CBC mode
$algorithm = "aes-256-cbc";

// calculate IV/Key using hash functions

$ivLength = openssl_cipher_iv_length ( $algorithm );

$keyHash = hash("sha256", $key, true);
$ivHash  = hash("sha256", $iv,  true);


$ivHash = substr($ivHash, 0, $ivLength);
  
  // encrypt
  
$data = openssl_encrypt($plaintext, $algorithm, $keyHash, 0, $ivHash);

echo "Key: ".strToHex($keyHash)."\n";
echo "IV: ".strToHex($ivHash)."\n";
echo "Data encrypted: ".$data."\n";

  // decrypt
  
$data = openssl_decrypt($data, $algorithm, $keyHash, 0, $ivHash);

echo "Data decrypted: ".$data."\n";
// umlauts show only right if output is read as UTF-8

// helper function to show binary data as hex string
function strToHex($string)
{
    $hex='';
    for ($i=0; $i < strlen($string); $i++)
    {
        $hex .= dechex(ord($string[$i]));
    }
    return $hex;
}

?>

