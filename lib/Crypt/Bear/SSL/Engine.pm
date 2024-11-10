package Crypt::Bear::SSL::Engine;

use strict;
use warnings;

use Crypt::Bear;

1;

# ABSTRACT: A sans-io SSL connection base-class in BearSSL

=method push_send($data, $flush = false)

=method push_received($data)

=method pull_send($flush = false)

=method send_ready()

=method is_closed()

=method close()

=method last_error()

=method inject_entropy($data)

=method get_server_name()

=method get_version()

=method set_versions($min, $max)

=begin Pod::Coverage

get_session_parameters
set_session_parameters
get_ecdhe_curve

=end Pod::Coverage
