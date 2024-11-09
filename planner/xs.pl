use strict;
use warnings;

use File::Find;
use File::Spec::Functions qw/catfile abs2rel/;

my %args;

load_module('Dist::Build::XS');

my $use_system = 0;
if ($use_system) {
	$args{libraries} = [ 'bearssl' ]
} else {
	load_module('Dist::Build::XS::Conf');
	my @sources;

	my %defines = (
		BR_RDRAND => 1,
		BR_GCC_5_0 => 1,
		BR_INT128 => 1,
		BR_USE_UNIX_TIME => 1,
	);

	find({
		wanted => sub {
			return unless -f;
			return unless /\.c$/;
			push @sources, abs2rel($_);
		},
		no_chdir => 1,
	} , 'src');

	$args{extra_sources} = \@sources;
	$args{defines}       = \%defines;
	$args{include_dirs}  = [ 'include', 'src' ];
}

add_xs(
	extra_compiler_flags => ['-Wall', '-Wextra', '-Wno-unused' ],
	%args,
);
