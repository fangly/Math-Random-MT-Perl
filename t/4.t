use strict;

use Test;
use vars qw($loaded $num1 $num2);

BEGIN { plan tests => 7 }
END   { print "not ok 1\n" unless $loaded }

# Check that it's possible to call rand() without srand()

use Math::Random::MT::Perl qw(srand rand);
ok($loaded = 1);
eval { $num1 = rand; };
ok($@, '', '$@ should be empty after rand() but it\'s: '.$@);
ok(defined($num1));
ok(0 <= $num1);
ok($num1 < 1); # rand without argument is like rand(1)
eval { $num2 = rand; };
ok($@, '', '$@ should also be empty the second time rand() is called');
ok($num1 != $num2);
