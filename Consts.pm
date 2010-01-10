package Pacman::Consts;

use strict;
use warnings;

use Exporter::Lite;

our @EXPORT = qw( 
	LEFT_LEVEL 
	UP DOWN LEFT RIGHT 
	EMPTY WALL GHOST PILL COOKIE
);

sub UP()    { 'up'    };
sub DOWN()  { 'down'  };
sub LEFT()  { 'left'  };
sub RIGHT() { 'right' };

sub EMPTY()	 { ' ' };
sub WALL()   { '#' };
sub GHOST()  { '@' };
sub PILL()	 { '.' };
sub COOKIE() { '*' };

# The left half of the level, the right half is the same, but mirrored.

sub LEFT_LEVEL() {
    return <<'END_LEVEL';

    ##############
    #............#
    #.####.#####.#
    #*####.#####.#
    #.............
    #.####.#.#####
    #......#.#####
    ######.#.....#
    ######.#####_#
    ######.#####_#
    ######.#__*___
    ######.#__###-
	__________#___
    ######.##_####
    ######.##_____
    ######.##_####
    ######.......#
    #......#####.#
    #.####.#####.#
    #*####........
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
