use strict;
use warnings;
use Test::More;

eval 'use Test::Pod 1.00';

if ($@) {
   plan skip_all => 'Test::Pod >= 1.00 not available';
} else {
   my @poddirs = qw(lib ../lib);
   all_pod_files_ok(all_pod_files( @poddirs ));
}

done_testing();
