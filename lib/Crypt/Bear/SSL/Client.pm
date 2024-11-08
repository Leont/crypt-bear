package Crypt::Bear::SSL::Client;

use strict;
use warnings;

use Crypt::Bear;

1;

# ABSTRACT: A sans-io SSL Client in BearSSL

=method new($trust_anchors)

=method reset($server_name, $resume = false)

=method forget_session()

=method set_client_certificate($private_certificate)
