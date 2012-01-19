#!/usr/bin/perl
use Math::Random::MT;
use Math::Random::MT::Perl;
use strict;
print "Using $Math::Random::MT::Perl::VERSION\n";

#    C:\Math-Random-MT-Perl-1.01\t>validate.pl 10000 1000
#    OK - single seed 10000 x 10000 tests: 100000000 total identical values
#    OK - 1000 seed 10000 x 10000 tests: 100000000 total identical values

my $tests = $ARGV[0] || 100;  # 2 * tests**2 total tests run
my $seeds = $ARGV[1] || 1000; # more than the 624 period N
my @seeds;

for my $o (1..$tests) {
    @seeds = ( rand(2**32) );
    my $p = Math::Random::MT->new(@seeds);
    my $c = Math::Random::MT::Perl->new(@seeds);
    for my $r (1..$tests) {
        my $pr = $p->rand();
        my $cr = $c->rand();
        die "$o $r\n@seeds\n$pr $cr\n" unless $pr == $cr;
    }
}
printf "OK - single seed $tests x $tests tests: %d total identical values\n", $tests**2;

for my $o (1..$tests) {
    @seeds = ();
    push @seeds, rand(2**32) for 1..$seeds;
    my $p = Math::Random::MT->new(@seeds);
    my $c = Math::Random::MT::Perl->new(@seeds);
    for my $r (1..$tests) {
        my $pr = $p->rand();
        my $cr = $c->rand();
        die "$o $r\n@seeds\n$pr $cr\n" unless $pr == $cr;
    }
}

printf "OK - $seeds seed $tests x $tests tests: %d total identical values\n", $tests**2;
