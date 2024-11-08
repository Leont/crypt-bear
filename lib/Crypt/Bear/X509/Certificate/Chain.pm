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

=method new()

=method add($certificate)

=method load($filename)

=method count()
