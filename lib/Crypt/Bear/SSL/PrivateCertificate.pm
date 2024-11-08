package Crypt::Bear::SSL::PrivateCertificate;

use strict;
use warnings;

use Crypt::Bear;

use Crypt::Bear::X509::Certificate::Chain;
use Crypt::Bear::X509::PrivateKey;

1;

sub load {
	my ($class, $chain_file, $key_file, @extra) = @_;
	my $chain = Crypt::Bear::X509::Certificate::Chain->load($chain_file);
	my $key = Crypt::Bear::X509::PrivateKey->load($key_file);

	return $class->new($chain, $key, @extra);
}

1;

# ABSTRACT: a Certificate Chain and Private key combination for BearSSL

=method new($certificate, $key)

=method load($certificate_file, $key_file)

=method chain()

=method key()
