package Crypt::Bear::EC::PrivateKey;

use Crypt::Bear;

1;

# ABSTRACT: An EC private key in BearSSL

=head1 SYNOPSIS

my $private_key = Crypt::Bear::EC::PrivateKey->generate('secp256r1', $prng);
my $signature = $private_key->ecdsa_sign('sha256', $hash);
my $shared = $private_key->ecdh_key_exchange($some_public_key);

=head1 DESCRIPTION

This represents a elliptic curve private key. The curve type can be one of the following:

=over 4

=item * C<'sect163k1'>

=item * C<'sect163r1'>

=item * C<'sect163r2'>

=item * C<'sect193r1'>

=item * C<'sect193r2'>

=item * C<'sect233k1'>

=item * C<'sect233r1'>

=item * C<'sect239k1'>

=item * C<'sect283k1'>

=item * C<'sect283r1'>

=item * C<'sect409k1'>

=item * C<'sect409r1'>

=item * C<'sect571k1'>

=item * C<'sect571r1'>

=item * C<'secp160k1'>

=item * C<'secp160r1'>

=item * C<'secp160r2'>

=item * C<'secp192k1'>

=item * C<'secp192r1'>

=item * C<'secp224k1'>

=item * C<'secp224r1'>

=item * C<'secp256k1'>

=item * C<'secp256r1'>

=item * C<'secp384r1'>

=item * C<'secp521r1'>

=item * C<'brainpoolP256r1'>

=item * C<'brainpoolP384r1'>

=item * C<'brainpoolP512r1'>

=item * C<'curve25519'>

=item * C<'curve448'>

=back

Common values include C<'curve25519'>, C<'curve448'>, C<'secp256r1'>, C<'secp384r1'>, C<'secp521r1'>.

=method new($curve, $point)

This returns a new private key representing the given C<$point> on C<$curve>.

=method generate($curve, $prng)

This class method generates a new private key on C<$curve>, using a C<Crypt::Bear::PRNG> to do so.

=method ecdsa_sign($hash_type, $hash_value)

This signs a hash using ecdsa. Currently this is only supported with C<'secp256r1'>, C<'secp384r1'> and C<'secp521r1'>.

=method ecdh_key_exchange($public_key)

This does a diffie-hellman key exchange with the given L<public key|Crypt::Bear::EC::PublicKey>, and returns the result.

=method public_key()

This generates the L<public key|Crypt::Bear::EC::Key> matching this private key.

=method curve()

This returns the curve of this private key.
