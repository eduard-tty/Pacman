package Pacman::Ghost;

use strict;
use warnings;

use base 'Pacman::Critter';

use Carp::Assert;

use Pacman::Consts;
use Pacman::Critter;

sub new {
    my ($class, $number) = @_;
    assert($number <= 6, "Can't fit more then 6 ghosts in center room");
    my $self = Pacman::Critter->new(12, 10+$number, UP, 1);
    return bless $self, $class;
}

sub char {
    return GHOST();
}

1;
