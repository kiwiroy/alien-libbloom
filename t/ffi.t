# -*- mode: perl; -*-

use strict;
use warnings;
use Test::More;
use Test::Alien qw{alien_ok ffi_ok};
use Alien::Libbloom;

ffi_ok {
    symbols => [
        qw{
bloom_add
bloom_check
bloom_free
bloom_init
bloom_init_size
bloom_print
bloom_reset
}] };

done_testing;
