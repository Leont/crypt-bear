package Crypt::Bear::RSA::PublicKey;

use Crypt::Bear;

1;

# ABSTRACT: An RSA public key in BearSSL

=head1 SYNOPSIS

 my $ciphertext = $public_key->oaep_encrypt('sha256', $data, $prng, '');

 if ($public_key->pkcs1_verify('sha256', $signature) eq $hash) {
     ...
 }

=head1 DESCRIPTION

This represents an RSA public key.

=method oaep_encrypt($digest, $plaintext, $prng, $label)

This encrypts the C<$plaintext>, using the given C<$digest>, C<$prng> and C<$label> (which may be an empty string).

=method pkcs1_verify($digest, $signature)

This verifies a signature, and returns the hash that was signed. It's the user's responsibility to check if that hash matches the expected value.
