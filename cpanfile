# -*- mode: perl; -*-

requires 'Alien::Build' => '1.79';
requires 'Alien::Build::Plugin::Download::GitHub' => '0.03';
requires 'Alien::MSYS';
requires 'Mojo::DOM58';

on develop => sub {
   requires 'App::af';
   
};

