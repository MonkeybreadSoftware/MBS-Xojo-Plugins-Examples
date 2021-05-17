<?php
function hex2str( $hex ) {
  return pack('H*', $hex);
}

function str2hex( $str ) {
  return array_shift( unpack('H*', $str) );
}

// our crypted Hello World padded with spaces
$crypttext = "194D6FD16918604CE0FB1185A7B046AC";

// our key
$key = "Test";

// show for debugging
print "crypttext  ".$crypttext."\n";
print "key  ".$key."\n";

// now decode hex string
$crypttext = hex2str($crypttext);

print "crypttext  ".$crypttext."\n";

// init encryption
	        $td        = mcrypt_module_open('blowfish', '', 'cbc', '');
	        $ivsize    = mcrypt_enc_get_iv_size($td);

// we simply use 8 byte IV with zeros
print "ivsize  ".$ivsize."\n";

	        $iv        = hex2str("0000000000000000");

print "iv  ".$iv."\n";

// now decrypt
	       
	            mcrypt_generic_init($td,$key, $iv);
	            $plaintext = mdecrypt_generic($td, $crypttext);
	        

// and show	       
print "plaintext  ".$plaintext."\n";

?>
