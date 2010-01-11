package Pacman::Consts;

use strict;
use warnings;

use Exporter::Lite;

our @EXPORT = qw( 
	LEFT_LEVEL 
	UP DOWN LEFT RIGHT 
	EMPTY WALL GHOST PILL COOKIE
	%DELTAS
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

our %DELTAS = (
    UP()    => [ -1,  0 ],
    DOWN()  => [ +1,  0 ],
    LEFT()  => [  0, -1 ],
    RIGHT() => [  0, +1 ],
);


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
