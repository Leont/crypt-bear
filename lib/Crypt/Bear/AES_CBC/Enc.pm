package Crypt::Bear::AES_CBC::Enc;

use Crypt::Bear;

1;

# ABSTRACT: AES-CBC encoder class in BearSSL

=head1 SYNOPSIS

 my $encoder = Crypt::Bear::AES_CBC::Enc->new($key);
 my $ciphertext = $d->run($iv, $cipher);

=head1 DESCRIPTION

This class represents an AES-CBC encoder. It's a subclass of L<Crypt::Bear::CBC::Enc> and inherits its C<run> and C<blocksize> methods.

=method new($key)

This initializes a new AES_CBC encoder with C<$key>. C<$key> much be appropriately sized for AES (16, 24, or 32 bytes).
