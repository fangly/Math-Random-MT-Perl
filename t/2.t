use strict;

use Test;
use vars qw($loaded);

BEGIN { plan tests => 3 }
END   { print "not ok 1\n" unless $loaded }

# Check that the results are the same with the function-call interface
# as with the OO interface

use Math::Random::MT::Perl qw(srand rand);
ok($loaded = 1);
srand(5489);
ok((sprintf"%.12f",rand()), 0.814723691903);
ok((sprintf"%.12f",rand()), 0.135477004107);
