package Crypt::Bear;

use strict;
use warnings;

use XSLoader;

XSLoader::load(__PACKAGE__, __PACKAGE__->VERSION);

1;

# ABSTRACT: BearSSL for Perl

=head1 DESCRIPTION

This distribution provides a Perl wrapper for the BearSSL library. First and foremost it provides an SSL implementation, but it also provides access to various primitives such as symmetric and asymmetric encryption, hashes, CSPRNGs and basic certificate handling.

=method get_config()

This method returns a hash with the configuration arguments of this BearSSL.
