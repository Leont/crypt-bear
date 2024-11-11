package Crypt::Bear::PRNG;

use Crypt::Bear;

1;

# ABSTRACT: A baseclass for PRNGs in BearSSL

=head1 SYNOPSIS

 $prng->system_seed;
 say unpack 'H*', $prng->generate(16);

=head1 DESCRIPTION

This is a base class for cryptographically secure pseudo random number generators. At the moment there are two of such implemented in this distribution: L<Crypt::Bear::HMAC_DRBG> and L<Crypt::Bear::AES_DRBG>.

=method generate($length)

This method produces C<$length> pseudorandom bytes and returns them. The context is updated accordingly.

=method system_seed()

This feeds entropy from the system, returning true on success. In almost any cryptographic use either calling this or seeding it with an appropriate amount of entropy is essential for safe operation of the PRNG.

This is known to be supported on Linux, BSD, Mac, Windows, AIX and Solaris, as well as any x86 platform when compiling with gcc/clang.

=method system_seeder_name()

The name of the system seeder, or C<'none'> if none is available.

=method update($data)

Inject additional seed bytes. The provided seed bytes are added into the PRNG internal entropy pool.
