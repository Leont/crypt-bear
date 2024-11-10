package Crypt::Bear::RSA::PrivateKey;

use Crypt::Bear;

1;

# ABSTRACT: An RSA private key in BearSSL

=method oaep_decrypt($digest, $ciphertext, $label)

=method pkcs1_sign($digest, $hash)
