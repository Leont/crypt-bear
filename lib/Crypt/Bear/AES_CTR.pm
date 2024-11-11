package Crypt::Bear::AES_CTR;

use Crypt::Bear;

1;

# ABSTRACT: AES CTR encoder for BearSSL

=method new($key)

=head1 SYNOPSIS

 my $aead = Crypt::Bear::GCM->new(Crypt::Bear::AES_CTR->new($key));

=head1 DESCRIPTION

This creates a new AES in CTRCBC mode object. This is useful when combined with L<CCM|Crypt::Bear::GCM>, but can also be used on its own. It is a sub-class of L<Crypt::Bear::CTR>.

=method new($key)

This initializes a new AES_CTR object with C<$key>. C<$key> much be appropriately sized for AES (16, 24, or 32 bytes).
