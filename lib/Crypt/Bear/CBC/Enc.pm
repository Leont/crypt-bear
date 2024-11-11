package Crypt::Bear::CBC::Enc;

use Crypt::Bear;

1;

# ABSTRACT: CBC encoder baseclass BearSSL

=head1 DESCRIPTION

This base class represents an CBC encoder, currently it's only implementation is L<Crypt::Bear::AES_CBC::Enc>.

=method run($iv, $data)

This runs a CBC encode with the given IV and data, and returns the result.

=method block_size()

This returns the blocksize of the cipher.
