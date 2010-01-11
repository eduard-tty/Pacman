#!/usr/bin/env perl

use strict;
use warnings;

use lib '..';

use Pacman::Game;

Pacman::Game->new(3)->run();

# hunt

1;
