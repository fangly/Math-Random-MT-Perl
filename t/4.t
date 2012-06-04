use strict;

use Test;
use vars qw($loaded $num1 $num2 $int1 $int2);

BEGIN { plan tests => 12 }
END   { print "not ok 1\n" unless $loaded }

# Check that it's possible to call rand() without srand()

use Math::Random::MT::Perl qw(srand rand irand);
ok($loaded = 1);

eval { $num1 = rand; };
ok($@, '', '$@ should be empty after rand() but it\'s: '.$@);
ok(defined($num1));
ok(0 <= $num1);
ok($num1 < 1); # rand without argument is like rand(1)
eval { $num2 = rand; };
ok($@, '', '$@ should also be empty the second time rand() is called');
ok($num1 != $num2);

eval { $int1 = irand; };
ok($@, '', '$@ should be empty after irand() but it\'s: '.$@);
ok(defined($int1));
ok(0 <= $int1);
eval { $int2 = irand; };
ok($@, '', '$@ should also be empty the second time irand() is called');
ok($int1 != $int2);
