package Crypt::Bear::AES_CTRCBC;

use Crypt::Bear;

1;

# ABSTRACT: AES CTRCBC class for BearSSL

=head1 SYNOPSIS

 my $aead = Crypt::Bear::CCM->new(Crypt::Bear::AES_CTRCBC->new($key));

=head1 DESCRIPTION

This creates a new AES in CTRCBC mode object. This is primarily useful when combined with L<CCM|Crypt::Bear::CCM> or L<EAX|Crypt::Bear::EAX>.

=method new($key)

This initializes a new AES_CTRCBC object with C<$key>. C<$key> much be appropriately sized for AES (16, 24, or 32 bytes).
