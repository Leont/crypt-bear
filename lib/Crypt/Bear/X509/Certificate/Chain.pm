package Crypt::Bear::X509::Certificate::Chain;

use strict;
use warnings;

use Crypt::Bear;
use Crypt::Bear::PEM;

sub load {
	my ($class, $filename) = @_;

	my $self = $class->new;

	open my $fh, '<:crlf', $filename or die "Could not open certificate $filename: $!";
	my $raw = do { local $/; <$fh> };
	my (@items) = Crypt::Bear::PEM::pem_decode($raw);

	while (my ($banner, $content) = splice @items, 0, 2) {
		die "File $filename does not contain a certificate" unless $banner =~ /CERTIFICATE/;
		my $cert = Crypt::Bear::X509::Certificate->new($content);
		$self->add($cert);
	}

	return $self;
}

1;

#ABSTRACT: A certificate chain for BearSSL

=head1 SYNOPSIS

 my $chain = Crypt::Bear::X509::CertificateChain->load($filename);

=head1 DESCRIPTION

This represents a certificate chain, from the end-user certificate to the root CA, potentially including intermediate CAs in between, or only one certificate if it's self-signed.

=method new()

This creates a new empty certificate chain.

=method load($filename)

This class methods loads a certificate file, and creates a new certificate chain with all the certificates in the file in it.

=method add($certificate)

This adds a certificate to the chain.

=method count()

This return the number of certificates in the chain.
