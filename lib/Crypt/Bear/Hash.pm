package Crypt::Bear::Hash;

use Crypt::Bear;

1;

# ABSTRACT: hash implementations in BearSSL

=head1 SYNOPSIS

 my $digester = Crypt::Bear::Hash->new('sha226');
 while(<>) {
     $digester->update($_);
 }
 say unpack 'H*', $digester->out;

=head1 DESCRIPTION

This represents a streaming implementation of common hash functions.

=method new($digest)

This creates a new hasher. The digest name must be one of the following.

=over 4

=item * C<'md5'>

=item * C<'sha1'>

=item * C<'sha224'>

=item * C<'sha256'>

=item * C<'sha384'>

=item * C<'sha512'>

=back

=method update(data)

Add some more bytes to the hash computation represented by the provided context.

=method out()

This returns the hash based on the current state. The context is NOT modified by this operation, so this function can be used to get a "partial hash" while still keeping the possibility of adding more bytes to the input.

=method state()

Get a copy of the "current state" for the computation so far. For MD functions (MD5, SHA-1, SHA-2 family), this is the running state resulting from the processing of the last complete input block.

=method set_state($state)

Set the internal state to the provided values. C<$state> shall match that which was obtained from C<state()>. This restores the hash state only if the state values were at an appropriate block boundary.

=method output_size()

The size of the output of this hash.

=method digest()

Returns the digest name for this hash.
