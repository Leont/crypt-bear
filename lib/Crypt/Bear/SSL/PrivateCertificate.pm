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

=head1 SYNOPSIS

 my $priv_cert = Crypt::Bear::SSL::PrivateCertificate->load('server.crt', 'server.key');
 my $server = Crypt::Bear::SSL::Server->new($priv_cert);

=head1 DESCRIPTION

This repressents the pair of Certificate Chain and Private key, used to established secure connections.

=method new($certificate, $key)

This creates a new L<certificate chain|Crypt::Bear::X509::Certificate::Chain> L<private key|Crypt::Bear::X509::PrivateKey> pair.

=method load($certificate_file, $key_file)

This loads the C<$certificate_file> and C<$key_file>, and creates a new object out of them.

=method chain()

This returns the certificate chain in this object.

=method key()

This return the private key in this object.
