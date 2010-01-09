package Pacman::Pacman;

use strict;
use warnings;

use base 'Pacman::Critter';

use Pacman::Consts;
use Pacman::Critter;


sub new {
    my ($class) = @_;
    my $self = Pacman::Critter->new(10, 14, UP(), 1);

    return bless $self, $class;
}


sub move  {
    my ($self, $board, $key) = @_;

    $self->{'dir'} = UP() if lc($key) eq 'u';
    $self->{'dir'} = DOWN() if lc($key) eq 'd';
    $self->{'dir'} = LEFT() if lc($key) eq 'l';
    $self->{'dir'} = RIGHT() if lc($key) eq 'r';

    $self->SUPER::move($board);

    return;
}


my %faces = (
    UP()    => 'V',
    DOWN()  => '^',
    LEFT()  => '>',
    RIGHT() => '<',
);

sub char {
    my ($self) = @_;
    return $faces{ $self->{'dir'} } || '!';
}

1;
