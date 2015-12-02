use ExtUtils::MakeMaker;


WriteMakefile1(
    NAME              => 'Math::Random::MT::Perl',
    VERSION_FROM      => 'lib/Math/Random/MT/Perl.pm',
    PREREQ_PM         => {
    },
    META_MERGE => {
        'meta-spec' => { version => 2 },
        resources => {
            repository => {
                type => 'git',
                url => 'git://github.com/fangly/Math-Random-MT-Perl.git',
                web => 'https://github.com/fangly/Math-Random-MT-Perl',
            },
            bugtracker => { 'web' => 'http://rt.cpan.org/Dist/Display.html?Name=Math-Random-MT-Perl' },
        },
    },
    TEST_REQUIRES => {
        'Test::More'          => 0,
        'Test::Number::Delta' => 0,
        get_opt_test_mods(),
    },
    ABSTRACT_FROM  => 'lib/Math/Random/MT/Perl.pm',
    AUTHOR         => 'Dr James Freeman',
    LICENSE           => 'artistic_2',
    realclean         => { FILES => 'Math-Random-MT-Perl* *.tmp *.bak' },
);


sub get_opt_test_mods {
   # Find which optional modules used in unit tests are available
   my @avail_mods;
   my %opt_modules = (
      'Math::Random::MT'    =>  0,
      'Test::Kwalitee'      =>  0,
      'Test::Pod'           => '1.00',
      'Test::Pod::Coverage' => '1.00',
      'Test::Spelling'      =>  0,
   );

   while (my ($module, $version) = each %opt_modules) {
      eval "require $module;";
      if (! $@) {
         push @avail_mods, $module, $version;
      }
   }
   return @avail_mods;
}

sub WriteMakefile1 {  #Compatibility code for old versions of EU::MM. Written by Alexandr Ciornii, version 0.23. Added by eumm-upgrade.
    my %params=@_;
    my $eumm_version=$ExtUtils::MakeMaker::VERSION;
    $eumm_version=eval $eumm_version;
    die "EXTRA_META is deprecated" if exists $params{EXTRA_META};
    die "License not specified" if not exists $params{LICENSE};
    if ($params{AUTHOR} and ref($params{AUTHOR}) eq 'ARRAY' and $eumm_version < 6.5705) {
        $params{META_ADD}->{author}=$params{AUTHOR};
        $params{AUTHOR}=join(', ',@{$params{AUTHOR}});
    }
    if ($params{TEST_REQUIRES} and $eumm_version < 6.64) {
        $params{BUILD_REQUIRES}={ %{$params{BUILD_REQUIRES} || {}} , %{$params{TEST_REQUIRES}} };
        delete $params{TEST_REQUIRES};
    }
    if ($params{BUILD_REQUIRES} and $eumm_version < 6.5503) {
        #EUMM 6.5502 has problems with BUILD_REQUIRES
        $params{PREREQ_PM}={ %{$params{PREREQ_PM} || {}} , %{$params{BUILD_REQUIRES}} };
        delete $params{BUILD_REQUIRES};
    }
    delete $params{CONFIGURE_REQUIRES} if $eumm_version < 6.52;
    delete $params{MIN_PERL_VERSION} if $eumm_version < 6.48;
    delete $params{META_MERGE} if $eumm_version < 6.46;
    delete $params{META_ADD} if $eumm_version < 6.46;
    delete $params{LICENSE} if $eumm_version < 6.31;

    WriteMakefile(%params);
}

