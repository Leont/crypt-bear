package Crypt::Bear::HMAC::Key;

use Crypt::Bear;

1;

# ABSTRACT: A key for HMAC computation.

=head1 SYNOPSIS

 my $key = Crypt::Bear::HMAC::Key->new('sha256', '0123456789ABCDEF');
 my $digester = Crypt::Bear::HMAC->new($key);

=head1 DESCRIPTION

This represents a key for HMAC computation with a given hash function.

=method new($digest, $key)

This creates a new HMAC key given secret key C<$key> and hash function C<$digest>.

=method digest()

Return the name of the hash that's being used (e.g. C<'sha256'>)
