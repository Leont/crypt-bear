package Crypt::Bear::EC::PrivateKey;

use Crypt::Bear;

1;

# ABSTRACT: An EC private key in BearSSL

=method new($curve, $point)

=method generate()

=method ecdsa_sign($hash_type, $hash_value)

=method ecdh_key_exchange($public_key)

=method public_key()

=method curve()
