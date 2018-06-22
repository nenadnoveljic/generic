#!/usr/bin/perl -w

# Author: Nenad Noveljic
  
use strict ;

use IO::Socket::INET;

my ( $server , $port ) = @ARGV ;
print "INFO: Checking connection to $server:$port\n" ;

# auto-flush on socket
$| = 1;

TRY:
while (1) {
  sleep 1 ;
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
oracle@svdbp01i:/export/home/oracle/workspace_vbnov/check_connectiivty_reselience/libperl/
DFEX10 $ more CheckConnectivity.pl                                                                                                                                                                                 
#!/usr/bin/perl -w                                                                                                                                                                                                 
                                                                                                                                                                                                                   
# Author: Nenad Noveljic                                                                                                                                                                                           
                                                                                                                                                                                                                   
use strict ;                                                                                                                                                                                                       
                                                                                                                                                                                                                   
use IO::Socket::INET;                                                                                                                                                                                              
                                                                                                                                                                                                                   
my ( $server , $port ) = @ARGV ;                                                                                                                                                                                   
print "INFO: Checking connection to $server:$port\n" ;                                                                                                                                                             
                                                                                                                                                                                                                   
# auto-flush on socket                                                                                                                                                                                             
$| = 1;                                                                                                                                                                                                            
                                                                                                                                                                                                                   
TRY:                                                                                                                                                                                                               
while (1) {                                                                                                                                                                                                        
  sleep 1 ;                                                                                                                                                                                                        
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
    next TRY ;                                                                                                                                                                                                     
  }                                                                                                                                                                                                                
                                                                                                                                                                                                                   
  $socket->close() ;                                                                                                                                                                                               
                                                                                                                                                                                                                   
  my $elapsed = time - $begin ;
  
  if ( $elapsed > 1 ) {
    print localtime . ' ' ;
    print "WARNING: " . 
      "TCP socket open und close took $elapsed seconds in total\n" 
    ;
  }

}
