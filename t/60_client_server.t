#! perl
 
use strict;
use warnings;

use Test::More;

use Crypt::Bear::X509::TrustAnchors;
use Crypt::Bear::X509::Certificate::Chain;
use Crypt::Bear::X509::PrivateKey;

use Crypt::Bear::SSL::Client;
use Crypt::Bear::SSL::Server;

my $anchors = Crypt::Bear::X509::TrustAnchors->new->load_file('t/server.crt');
my $chain = Crypt::Bear::X509::Certificate::Chain->new->load('t/server.crt');
my $key = Crypt::Bear::X509::PrivateKey->load('t/server.key');

my $client = Crypt::Bear::SSL::Client->new($anchors);
my $server = Crypt::Bear::SSL::Server->new($chain, $key);

ok $client;
ok $anchors;
ok $chain;
ok $key;
ok $server;
is $anchors->count, 1;
is $chain->count, 1;

ok $client->reset('server');
ok $server->reset;

is $client->last_error, 'ok';
is $server->last_error, 'ok';

ok eval {
	my $count = 0;
	while (!$client->sendapp_ready) {
		die 'Client is dead: ' . $client->last_error if $client->is_closed;
		die 'Server is dead: ' . $server->last_error if $server->is_closed;
		my $to_server = $client->pull_send;
		$server->push_received($to_server);

		my $to_client = $server->pull_send;
		$client->push_received($to_client);

		die if $count++ > 100;
	}
	1;
};

my $payload1 = 'Hello world!';
my $rec1 = $client->push_send($payload1, !!1);
my $decoded1 = $server->push_received($rec1);
is $decoded1, $payload1;

my $payload2 = 'Welcome back';
my $rec2 = $server->push_send($payload2, !!1);
my $decoded2 = $client->push_received($rec2);
is $decoded2, $payload2;

done_testing;
