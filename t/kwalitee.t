use strict;
use Test::More;

eval { require Test::Kwalitee; };

if ($@) {
   plan( skip_all => 'Test::Kwalitee not installed' );
} else {
   Test::Kwalitee->import(tests => ['-has_meta_yml']);
   # No META.yml check, because it is generated when building the distro
}

# do not done_testing();
