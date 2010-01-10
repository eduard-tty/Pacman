package Pacman::Consts;

use strict;
use warnings;

use Exporter::Lite;

our @EXPORT = qw( 
	LEFT_LEVEL 
	UP DOWN LEFT RIGHT 
	EMPTY WALL GHOST  PILL COOKIE
);

sub UP()    { return 'up' };
sub DOWN()  { return 'down' };
sub LEFT()  { return 'left' };
sub RIGHT() { return 'right' };

sub EMPTY()	 { return ' ' };
sub WALL()   { return '#' };
sub GHOST()  { return '@' };
sub PILL()	 { return '.' };
sub COOKIE() { return '*' };

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
    ######.#______
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
