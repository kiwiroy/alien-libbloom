# -*- mode: perl; -*-

use strict;
use warnings;
use Test::More;
use Test::Alien qw{alien_ok with_subtest xs_ok};
use Alien::Libbloom;

alien_ok 'Alien::Libbloom', 'loads';

diag join ' ', $_, '=', Alien::Libbloom->$_
    for qw{dist_dir cflags libs dynamic_libs bin_dir};

#  nasty hack
my $rpath = sprintf '-Wl,-rpath -Wl,%s', Alien::Libbloom->dist_dir . '/lib';

my $xs = do { local $/ = undef; <DATA> };

xs_ok {
  xs => $xs,
  verbose => $ENV{TEST_VERBOSE},
  cbuilder_compile => {
      extra_compile_flags => '',
  },
  cbuilder_link => {
      extra_linker_flags => $rpath,
  },
}, with_subtest {
  is CompileTest->check(), 'CompileTest',
  'CompileTest::check() returns CompileTest';
};

done_testing;

__DATA__

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <bloom.h>

MODULE = CompileTest PACKAGE = CompileTest
char *check(class)
  char *class;
  CODE:
    struct bloom bloom;
    bloom_init(&bloom, 1000000, 0.01);
    RETVAL = class;
  OUTPUT:
    RETVAL
