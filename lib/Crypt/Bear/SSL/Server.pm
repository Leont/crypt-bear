package Crypt::Bear::SSL::Server;

use strict;
use warnings;

use Crypt::Bear;

1;

# ABSTRACT: A sans-io SSL Client in BearSSL

=head1 SYNOPSIS

 my $priv_cert = Crypt::Bear::SSL::PrivateCertificate->load('server.crt', 'server.key');
 my $server = Crypt::Bear::SSL::Server->new($priv_cert);
 $server->reset;

 while (!$server->send_ready) {
     sysread $socket, my $buffer, 1024;
     $server->push_received($buffer);
     die "Failed to connect" if $server->is_closed;
     syswrite $socket, $server->pull_send;
 }

=head1 DESCRIPTION

=method new($private_certificate)

This creates a new client object, with the given certificate chain and private key.

=method reset()

Prepare or reset a client context for a new connection.

=begin Pod::Coverage

get_client_suites

=end Pod::Coverage
