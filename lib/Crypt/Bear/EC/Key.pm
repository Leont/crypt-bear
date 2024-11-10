package Crypt::Bear::EC::Key;

use Crypt::Bear;

1;

# ABSTRACT: An EC public key in BearSSL

=method new($curve, $point)

=method ecdsa_verify($hash_type, $hash_value, $signature)

=method curve()
