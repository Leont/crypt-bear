package Crypt::Bear::HMAC;

use Crypt::Bear;

1;

# ABSTRACT: HKDF implementations in BearSSL

=method new($key)

Returns a new HMAC based on the C<$key>, which should be a L<Crypt::Bear::HMAC::Key|Crypt::Bear::HMAC::Key>.

=method update(data)

This feeds data to the hasher.

=method out()

This returns the hash based on the current state.

=method digest()

Return the name of the hash that's being used (e.g. C<'sha256'>)

=method size()

This returns the size of the output.

1;
