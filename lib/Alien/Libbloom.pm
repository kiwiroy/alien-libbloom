package Alien::Libbloom;

use strict;
use warnings;
use base qw{ Alien::Base };

our $VERSION = '0.01';

1;

=encoding utf8

=begin html

<!-- Travis -->
<a href="https://travis-ci.org/kiwiroy/alien-libbloom">
  <img src="https://travis-ci.org/kiwiroy/alien-libbloom.svg?branch=master"
       alt="Travis Buils Status" />
</a>

=end html

=head1 NAME

Alien::Libbloom - Fetch/build/stash the libbloom headers and libs for L<libbloom|https://github.com/jvirkki/libbloom>

=head1 SYNOPSIS

In your C<Makefile.PL> with L<ExtUtils::MakeMaker>.

  use Alien::Libbloom;
  use ExtUtils::MakeMaker;
  use Alien::Base::Wrapper qw( Alien::Libbloom !export );
  use Config;
  WriteMakefile(
    # ...
    Alien::Base::Wrapper->mm_args,
    # ...
    );

In your script or module.

  use Alien::Libbloom;
  use Env qw( @PATH );
  unshift @PATH, Alien::Libbloom->bin_dir;

=head1 DESCRIPTION

Download, build, and install the libbloom C headers and libraries into a
well-known location, C<<< Alien::Libbloom->dist_dir >>>, from whence other
packages can make use of them.

The version installed will be the latest release on the master branch from
the libbloom GitHub L<repository|https://github.com/jvirkki/libbloom>.

=head1 AUTHOR

kiwiroy

=cut
