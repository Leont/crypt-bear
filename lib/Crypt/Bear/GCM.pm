package Crypt::Bear::GCM;

use Crypt::Bear;

1;

# ABSTRACT: GCM implementation for BearSSL

=head1 SYNOPSIS

 my $aead = Crypt::Bear::GCM->new(Crypt::Bear::AES_CTR->new($key));

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

This is a subclass of L<Crypt::Bear::AEAD> that implements GCM mode. It needs a L<Crypt::Bear::CTR> such as L<Crypt::Bear::AES_CTR> for this.

=method new($ctr)

Creates a new GCM mode object with the given C<CTR> object.
