package Crypt::Bear::PEM::Decoder;

use strict;
use warnings;

use Crypt::Bear;

1;

# ABSTRACT: A decoder for PEM

=head1 SYNOPSIS

 my $decoder = Crypt::Bear::PEM::Decoder->new(sub {
     my ($banner, $payload) = @_;
	 push @certs, $payload if $banner =~ /CERTIFICATE/;
 });

 while(<>) {
     $decoder->push($_);
 }

 die "PEM file was truncated" if $decoder->entry_in_progress;

=head1 DESCRIPTION

This implements a streaming PEM decoder. In most cases you'll want the non-streaming C<pem_decode> function in L<Crypt::Bear::PEM>.

=method new($callback)

This creates a new decoder, and sets a callback that will be called whenever an entry has completed.

=method push($data)

This pushes data to the decoder, potentially causing the callback to be called.

=method entry_in_progress()

This returns true if the decoder is half-way decoding an entry. This should be false at the end of a PEM stream.
