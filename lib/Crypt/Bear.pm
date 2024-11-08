package Crypt::Bear;

use strict;
use warnings;

use XSLoader;

XSLoader::load(__PACKAGE__, __PACKAGE__->VERSION);

1;

# ABSTRACT: BearSSL for Perl

=head1 DESCRIPTION

=method get_config()

This method returns a hash with the configuration arguments of this BearSSL.
