package Crypt::Bear::CCM;

use Crypt::Bear;

1;

# ABSTRACT: CCM implementation for BearSSL

=head1 SYNOPSIS

 my $aead = Crypt::Bear::CCM->new(Crypt::Bear::AES_CTRCBC->new($key));

=head1 DESCRIPTION

This is a subclass of L<Crypt::Bear::AEAD> that implements CCM mode. It needs a L<Crypt::Bear::CTRCBC> such as L<Crypt::Bear::AES_CTRCBC> for this.

=method new($ctrcbc)

Creates a new CCM mode object with the given C<CTRCBC> object.
