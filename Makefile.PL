use ExtUtils::MakeMaker;

WriteMakefile(
    NAME              => 'Math::Random::MT::Perl',
    VERSION_FROM      => 'lib/Math/Random/MT/Perl.pm',
    PREREQ_PM         => {
        'Test::More'          => 0,
        'Test::Number::Delta' => 0,
    },
    ($] >= 5.005 ?
      (ABSTRACT_FROM  => 'lib/Math/Random/MT/Perl.pm',
       AUTHOR         => 'Dr James Freeman') :
      ()
    ),
    LICENSE           => 'artistic_2',
    realclean         => { FILES => 'Math-Random-MT-Perl* *.tmp *.bak' },
);
