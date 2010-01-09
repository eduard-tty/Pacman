package Pacman::Ghost;

use strict;
use warnings;

use base 'Pacman::Critter';

use Pacman::Consts;
use Pacman::Critter;

sub new {
    my ($class, $row, $col) = @_;
    my $self = Pacman::Critter->new($row, $col, LEFT(), 1);
    return bless $self, $class;
}

sub char {
    return GHOST();
}

1;
