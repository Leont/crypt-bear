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
	die "File $filename does not contain a certificate" unless $banner =~ /PRIVATE KEY/;

	return $class->new($content);
}

1;

#ABSTRACT: A X509 private key

=method new($payload)

=method load($filename)

=method unpack()

=method type()
