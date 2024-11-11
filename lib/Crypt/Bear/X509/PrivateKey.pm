package Crypt::Bear::X509::PrivateKey;

use strict;
use warnings;

use Crypt::Bear;
use Crypt::Bear::PEM;

sub load {
	my ($class, $filename) = @_;

	open my $fh, '<:crlf', $filename or die "Could not open certificate $filename: $!";
	my $raw = do { local $/; <$fh> };
	my ($banner, $content) = Crypt::Bear::PEM::pem_decode($raw);
	die "File $filename does not contain a private key" unless $banner =~ /PRIVATE KEY/;

	return $class->new($content);
}

1;

#ABSTRACT: A X509 private key

=head1 SYNOPSIS

 my $private_key = Crypt::Bear::X509::PrivateKey->load($filename);

=head1 DESCRIPTION

This represents a X509 private key.

#ABSTRACT: A X509 private key

=method new($payload)

This decodes an encoded private key

=method load($filename)

This loads an encoded private key from a file.

=method unpack()

This will return the underlaying key. This will either be a L<Crypt::Bear::RSA::PrivateKey> or a L<Crypt::Bear::EC::PrivateKey>.

=method type()

The type of the key, either C<'rsa'> or C<'ec'>.
