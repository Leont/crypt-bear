package Crypt::Bear::RSA::Key;

use Crypt::Bear;

1;

# ABSTRACT: An RSA public key in BearSSL

=method oaep_encrypt($digest, $plaintext, $prng, $label)

=method pkcs1_verify($digest, $signature)
