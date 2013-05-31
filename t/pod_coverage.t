use strict;
use warnings;
use Test::More;
use Cwd;

my $ALSO_PRIVATE = [ ];

my $chdir = 0;  # for when tests are run from t/
if ( cwd() =~ m/t$/ ) {
    chdir '..';
    $chdir++;
}

eval 'use Test::Pod::Coverage 1.00';

if ($@) {
   plan skip_all => 'Test::Pod::Coverage >= 1.00 not available';
} else {
   all_pod_coverage_ok( { package => 'Math::Random::MT::Perl',
                          also_private => $ALSO_PRIVATE } );
}

chdir 't' if $chdir;  # back to t/

done_testing();
