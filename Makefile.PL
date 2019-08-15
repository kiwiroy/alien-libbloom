use strict;
use warnings;
use ExtUtils::MakeMaker;
use Alien::Build::MM;
 
my $abmm = Alien::Build::MM->new(clean_install => 1);
 
WriteMakefile(
    $abmm->mm_args(
        ABSTRACT => 'Discover or download and install libbloom',
        DISTNAME => 'Alien-Libbloom',
        NAME     => 'Alien::Libbloom',
        VERSION_FROM => 'lib/Alien/Libbloom.pm',
        META_MERGE    => {
            resources => {
                bugtracker => 'https://github.com/kiwiroy/alien-libbloom/issues',
                homepage   => 'https://github.com/kiwiroy/alien-libbloom',
                repository => 'https://github.com/kiwiroy/alien-libbloom.git',
            },
        },
        test => {TESTS => (-e 'META.yml' ? 't/*.t' : 't/*.t xt/*.t')},
    ),

    );
 
sub MY::postamble {
    $abmm->mm_postamble;
}

sub MY::install {
    $abmm->mm_install(@_);
}
