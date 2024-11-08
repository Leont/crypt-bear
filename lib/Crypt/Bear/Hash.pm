package Crypt::Bear::Hash;

use Crypt::Bear;

1;

# ABSTRACT: hash implementations in BearSSL

=method new($hash_name)

This creates a new hasher. The hash name must be one of the following.

=over 4

=item * C<'md5'>

=item * C<'sha1'>

=item * C<'sha224'>

=item * C<'sha256'>

=item * C<'sha384'>

=item * C<'sha512'>

=back

=method update(data)

This feeds data to the hasher.

=method out()

This returns the hash based on the current state.

=method state()

Retrieve the current state.

=method set_state($state)

Restore a previous state.

=method output_size()

The size of the output of this hash.

=method id()

Returns the SSL identifier for this hash.

1;
