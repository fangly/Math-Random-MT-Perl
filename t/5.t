use strict;

use Test;
use vars qw($loaded);

BEGIN { plan tests => 5 }
END   { print "not ok 1\n" unless $loaded }

# OO interface
# Check that we can use an array to seed the generator.

use Math::Random::MT::Perl;

my $gen;
ok($loaded = 1);
ok( $gen = Math::Random::MT::Perl->new(1, 2, 3, 4) );
ok( (sprintf"%.12f",$gen->rand(1)), 0.678865759168 );

# high value seeds broke initial implementation of mt_setup_array()
ok( $gen = Math::Random::MT::Perl->new(1, 2, 3, 2**31) );
ok( (sprintf"%.12f",$gen->rand(1)), 0.336814725539 );



