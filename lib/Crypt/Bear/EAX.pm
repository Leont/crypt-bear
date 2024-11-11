package Crypt::Bear::EAX;

use Crypt::Bear;

1;

# ABSTRACT: EAX implementation for BearSSL

=head1 SYNOPSIS

 my $aead = Crypt::Bear::EAX->new(Crypt::Bear::AES_CTRCBC->new($key));

 $aead->reset($iv);
 $aead->aad_inject($aad);
 $aead->flip;
 my $ciphertext = $aead->run($plaintext, 1);
 my $tag = $aead->get_tag;

 $aead->reset($iv);
 $aead->aad_inject($aad);
 $aead->flip;
 my $decoded = $aead->run($ciphertext, 0);
 $aead->check_tag($tag)

=head1 DESCRIPTION

This is a subclass of L<Crypt::Bear::AEAD> that implements EAX mode. It needs a L<Crypt::Bear::CTRCBC> such as L<Crypt::Bear::AES_CTRCBC> for this.

=method new($ctrcbc)

Creates a new EAX mode object with the given C<CTRCBC> object.
