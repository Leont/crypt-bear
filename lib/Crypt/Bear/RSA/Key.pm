package Crypt::Bear::RSA::Key;

use Crypt::Bear;

1;

# ABSTRACT: An RSA public key in BearSSL

=method oaep_encrypt($prng, $digest, $label, $plaintext)

=method pkcs1_verify($signature, $digest)
