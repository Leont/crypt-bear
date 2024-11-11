package Crypt::Bear::RSA::PrivateKey;

use Crypt::Bear;

1;

# ABSTRACT: An RSA private key in BearSSL

=head1 SYNOPSIS

 my $plaintext = $private_key->oaep_decrypt('sha256', $data, '');

 my $signature = $private_key->pkcs1_sign('sha256', $hash);

=head1 DESCRIPTION

This represents an RSA public key.

=method oaep_decrypt($digest, $ciphertext, $label)

This decrypts data encrypted by C<oaep_encrypt>. The C<$digest> and C<$label> must match the values used with the encrypt operation.

=method pkcs1_sign($digest, $hash)

This signs a hash, and returns the signature.
