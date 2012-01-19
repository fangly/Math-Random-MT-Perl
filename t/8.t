use strict;

use Test;
use vars qw($loaded $autoseed $num1 $num2 $num3 $num4 $num5 $num6);

BEGIN { plan tests => 12 }
END   { print "not ok 1\n" unless $loaded }

# Functional interface
# Test the ability to automatically generate a seed, return it, and reproduce
# the same series of random number by specifying this seed manually.

use Math::Random::MT::Perl qw(srand rand);
ok($loaded = 1);
# Generate a series of 3 random numbers using an autogenerated seed
ok($autoseed = srand());
ok($num1 = rand());
ok($num2 = rand());
ok($num3 = rand());
# Generate a series of 3 random numbers the same seed value but manually specified
ok(srand($autoseed));
ok($num4 = rand());
ok($num5 = rand());
ok($num6 = rand());
# Both series of number should be the same
ok($num1 == $num4);
ok($num2 == $num5);
ok($num3 == $num6);