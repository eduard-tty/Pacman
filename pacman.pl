#!/usr/bin/env perl

use strict;
use warnings;

use lib '..';

use Pacman::Game;

Pacman::Game->new(3)->run();

# TODO:
# - hunt better
# - clean up
# - nicer speed handling

1;
