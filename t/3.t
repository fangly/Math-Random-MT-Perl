use strict;

use Test;
use vars qw($loaded $num1 $num2);

BEGIN { plan tests => 7 }
END   { print "not ok 1\n" unless $loaded }

use Math::Random::MT::Perl qw(srand rand);
ok($loaded = 1);
srand; # explicit srand, but without number
eval { $num1 = rand; };
ok($@, '', '$@ should be empty after rand()');
ok(defined($num1));
ok(0 <= $num1);
ok($num1 < 1); # rand without argument is like rand(1)
eval { $num2 = rand; };
ok($@, '', '$@ should also be empty the second time rand() is called');
ok($num1 != $num2);
