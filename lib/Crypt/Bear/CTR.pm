package Crypt::Bear::CTR;

use Crypt::Bear;

1;

# ABSTRACT: CTR encoder baseclass BearSSL

=head1 DESCRIPTION

This base class represents an CTR implementation, currently it's only implementation is L<Crypt::Bear::AES_CTR>.

=method run($iv, $data)

This runs a CTR encode/decode with the given IV and data, and returns the result.

The `iv` parameter' length must be exactly 4 bytes less than the block size (e.g. 12 bytes for AES/CTR). The IV is combined with a 32-bit block counter to produce the block value which is processed with the block cipher.

The data's length is not required to be a multiple of the block size; if the final block is partial, then the corresponding key stream bits are dropped.

=method block_size()

This returns the blocksize of the cipher.
