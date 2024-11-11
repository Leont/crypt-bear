package Crypt::Bear::AEAD;

use Crypt::Bear;

1;

# ABSTRACT: AEAD encoder baseclass BearSSL

=head1 SYNOPSIS

 $aead->reset($iv);
 $aead->aad_inject($aad);
 $aead->flip;
 my $ciphertext = $aead->run($plaintext, 1);
 my $tag = $aead->get_tag;

 $aead->reset($iv);
 $aead->aad_inject($aad);
 $aead->flip;
 my $decoded = $aead->run($ciphertext, 0);

=head1 DESCRIPTION

This is a base-class for Authenticated encryption with additional data, such as L<GCM|Crypt::Bear::GCM>, L<CCM|Crypt::Bear::CCM> and L<EAX|Crypt::Bear::EAX>. These are typtically used with a block cipher such as C<AES>.

=method reset($nonce)

Start a new AEAD computation. The nonce value is provided as parameter to this function.

=method aad_inject($data)

Inject some additional authenticated data. Additional data may be provided in several chunks of arbitrary length.

=method flip()

This method MUST be called after injecting all additional authenticated data, and before beginning to encrypt the plaintext (or decrypt the ciphertext).

=method run($data, $encrypt)

Process some plaintext to encrypt (if C<$encrypt> is true)) or ciphertext to decrypt (if it is false), returning the result. Data may be provided in several chunks of arbitrary length.

=method get_tag()

Compute the authentication tag. All message data (encrypted or decrypted) must have been injected at that point. Also, this call may modify internal context elements, so it may be called only once for a given AEAD computation.

=method check_tag($tag)

An alternative to C<get_tag>, meant to be used by the receiver: the authentication tag is internally recomputed, and compared with the one provided as parameter.
