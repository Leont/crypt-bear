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

=head1 SYNOPSIS

 my $anchors = Crypt::Bear::X509::TrustAnchors->new;
 $anchors->load_dir($dirname);
 $anchors->load_file($filename);

=head1 DESCRIPTION

This respresents a set of trust anchors. These are either certificate authorities, or end-user certificates explicitly marked as safe

=method new()

This creates a new (empty) trust anchor set.

=method add($certificate, $is_ca = ...)

This adds a L<certificate|Crypt::Bear::Certificate> to the set. Certificates are usually marked as CA or not, but it allows you to override that should that be desired.

=method load_file($filename)

This loads a file containing one or more certificates, and adds them all to the set.

=method load_dir($directory)

Load all certificates from C<$directory> into the trust root.

=method merge($other)

This merges another anchor set into this one.

=method count()

This returns the number of certificates in the set.

=method names()

This returns the (encoded) distinguished names of the certificates.
