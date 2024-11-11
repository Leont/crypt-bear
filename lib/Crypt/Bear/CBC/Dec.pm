package Crypt::Bear::CBC::Dec;

use Crypt::Bear;

1;

# ABSTRACT: CBC decoder baseclass BearSSL

=head1 DESCRIPTION

This base class represents an CBC decoder, currently it's only implementation is L<Crypt::Bear::AES_CBC::Dec>.

=method run($iv, $data)

This runs a CBC decode with the given IV and data, and returns the result.

=method block_size()

This returns the blocksize of the cipher.
