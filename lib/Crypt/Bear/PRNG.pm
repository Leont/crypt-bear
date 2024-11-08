package Crypt::Bear::PRNG;

use Crypt::Bear;

1;

# ABSTRACT: A baseclass for PRNGs in BearSSL

=method generate($length)

=method system_seed()

This feeds entropy from the system

=method system_seeder_name()

=method update($data)
