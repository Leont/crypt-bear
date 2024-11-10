package Crypt::Bear::X509::Certificate;

use strict;
use warnings;

use Crypt::Bear;
use Crypt::Bear::PEM;

sub load {
	my ($class, $filename) = @_;

	open my $fh, '<:crlf', $filename or die "Could not open certificate $filename: $!";
	my $raw = do { local $/; <$fh> };
	my ($banner, $content) = Crypt::Bear::PEM::pem_decode($raw);
	die "File $filename does not contain a certificate" unless $banner =~ /CERTIFICATE/;

	return $class->new($content);
}

1;

# ABSTRACT: A X509 certificate in BearSSL

=method new($encoded)

This decodes a certificate into an object.

=method load($filename)

This loads a certificate from the given file, and returns it as a new object.

=method dn()

The (encoded) DN of the certificate.

=method public_key()

The public key of the certificate. This will either be a L<Crypt::Bear::RSA::PublicKey> or an L<Crypt::Bear::EC::Key>.

=method is_ca()

True if the certificate is marked as a CA.

=method signer_key_type()

The type of the signer's key, C<'rsa'> or C<'ec'>.
