package Crypt::Bear::AES_CBC::Dec;

use Crypt::Bear;

1;

# ABSTRACT: AES-CBC decoder class in BearSSL

=head1 SYNOPSIS

 my $decoder = Crypt::Bear::AES_CBC::Dec->new($key);
 my $plaintext = $d->run($iv, $cipher);

=head1 DESCRIPTION

This class represents an AES-CBC decoder. It's a subclass of L<Crypt::Bear::CBC::Dec> and inherits its C<run> and C<blocksize> methods.

=method new($key)

This initializes a new AES_CBC decoder with C<$key>. C<$key> much be appropriately sized for AES (16, 24, or 32 bytes).
