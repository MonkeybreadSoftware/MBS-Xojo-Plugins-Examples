#!/usr/bin/perl -w

use strict;
use CGI; # Module for CGI 

my $cgi = new CGI; # new CGI object

# Content-type fuer die Ausgabe
print $cgi->header(-type => 'text/html');

# get file data and do something with it.
my $file = $cgi->param("myfile");

print "<html>";
print "<head>";
print "<title>Fileupload</title>";
print "</head>";
print "<body>";
print "<h1>The file $file was uploaded successfully.</h1>";
print "<p>but it was not saved!</p>";
print "</body>";
print "</html>";
