package Crypt::Bear::X509::TrustAnchors;

use strict;
use warnings;

use Crypt::Bear;
use Crypt::Bear::X509::Certificate;
use File::Spec;

sub load_file {
	my ($self, $filename) = @_;

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

sub load_dir {
	my ($self, $dirname, $pattern) = @_;

	$pattern //= qr/ \.pem | \.crt /x;

	opendir my $dh, $dirname or die "Could not open $dirname: $!";
	for my $file (grep /($pattern)$/, readdir $dh) {
		my $filename = File::Spec->catfile($dirname, $file);
		$self->load_file($filename);
	}

	return $self;
}

1;

# ABSTRACT: A set of trust anchors in BearSSL

=method new()

=method add($certificate)

=method load_file($filename)

=method load_dir($directory)

Load all certificates from C<$directory>

=method merge($other)

=method count()

=method names()
