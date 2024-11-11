package Crypt::Bear::HMAC;

use Crypt::Bear;

1;

# ABSTRACT: HMAC implementations in BearSSL

=head1 SYNOPSIS

 my $key = Crypt::Bear::HMAC::Key->new('sha256', '0123456789ABCDEF');
 my $digester = Crypt::Bear::HMAC->new($key);

 while(<>) {
     $digester->update($_);
 }
 say unpack 'H*', $digester->out;

=head1 DESCRIPTION

This represents a streaming implementation of hmac on top of common hash functions.

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
