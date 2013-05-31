use strict;
use warnings;
use Test::More;
use Cwd;

my $chdir = 0;  # for when tests are run from t/
if ( cwd() =~ m/t$/ ) {
    chdir '..';
    $chdir++;
}

eval { require Test::Kwalitee; };

if ($@) {
   plan skip_all => 'Test::Kwalitee not available';
} else {
   Test::Kwalitee->import(tests => ['-has_meta_yml']);
   # No META.yml check, because it is generated when building the distro
}

chdir 't' if $chdir;  # back to t/

# do not done_testing();
