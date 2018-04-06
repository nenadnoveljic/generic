#!/usr/bin/perl -w

# Author: Nenad Noveljic

# v1.0
 
# Usage: CheckConnectivity.pl remote_host remote_port

# see also http://nenadnoveljic.com/blog/testing-network-connectivity
 
use strict ;

use IO::Socket::INET;

my ( $server , $port ) = @ARGV ;
print "INFO: Checking connectivity to $server:$port\n" ;

# auto-flush on socket
$| = 1;

while (1) {
  my $begin = time ;
  
  my $socket = new IO::Socket::INET (
      PeerHost => $server ,
      PeerPort => $port ,
      Proto => 'tcp',
  );
  
  if ( !$socket ) {
    print localtime . ' ' ;
    print "ERROR:" . 
      "Couldn't open socket to $server:$port : $!\n" ;
  }
  
  $socket->close() ;
  
  my $elapsed = time - $begin ;
  
  if ( $elapsed > 1 ) {
    print localtime . ' ' ;
    print "WARNING: " . 
      "TCP socket open und close took $elapsed seconds in total\n" 
    ;
  }

  
  sleep 1 ;
}
