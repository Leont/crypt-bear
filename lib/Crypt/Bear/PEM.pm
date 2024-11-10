package Crypt::Bear::PEM;

use strict;
use warnings;

use Exporter 'import';
our @EXPORT_OK = qw/pem_encode pem_decode/;
our %EXPORT_TAGS = (all => \@EXPORT_OK);

use Crypt::Bear;

1;

# ABSTRACT: A decoder for PEM

=func pem_encode($banner, $data, @flags)

This PEM encodes some piece of C<$data> with the given C<$banner>. If flags are given they will affect the output. Valid values are:

=over 4

=item * 'line64'

If set, line-breaking will occur after every 64 characters of output, instead of the default of 76

=item * 'crlf'

If set, end-of-line sequence will use CR+LF instead of a single LF.

=back

=func pem_decode($data)

This will decode the data, and return it as C<$banner, $payload> pairs.

If you need to decode asynchronously, see L<Crypt::Bear::PEM::Decoder|Crypt::Bear::PEM::Decoder>.
