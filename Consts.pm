package Pacman::Consts;

use strict;
use warnings;

use Exporter::Lite;

our @EXPORT = qw( LEFT_LEVEL UP DOWN LEFT RIGHT WALL GHOST);

sub UP()    { return 'up' };
sub DOWN()  { return 'down' };
sub LEFT()  { return 'left' };
sub RIGHT() { return 'right' };

sub WALL()  { return '#' };
sub GHOST() { return '@' };

# The left half of the level, teh right half is the same, but mirrored.

sub LEFT_LEVEL() {
    return <<'END_LEVEL';

    ##############
    #............#
    #.####.#####.#
    #.####.#####.#
    #.............
    #.####.#.#####
    #......#.#####
    ######.#.....#
    ######.#####_#
    ######.#####_#
    ######.#______
    ######.#__###-
	__________#___
    ######.##_####
    ######.##_____
    ######.##_####
    ######.......#
    #......#####.#
    #.####.#####.#
    #.####........
    #...##.##.####
    ###.##.##.####
    #......##....#
    #.##########.#
    #.##########.#
    #.............
    ##############

END_LEVEL
    ;
};



1;
