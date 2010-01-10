package Pacman::Ghost;

use strict;
use warnings;

use base 'Pacman::Critter';

use Pacman::Consts;
use Pacman::Critter;
use Pacman::Board;

sub new {
    my ($class, $number) = @_;

    my $self = Pacman::Critter->new( Pacman::Board::ghost_start(), UP, 1);
    return bless $self, $class;
};

sub char {
    return GHOST;
};

sub meet {
	my ($self, $other) = @_;
	
	if ( $other->isa('Pacman::Pacman') ) {
		if ( $other->{'safe'} )  {
			( $self->{'row'}, $self->{'col'} ) = Pacman::Board::ghost_start()
		} else {
			return 1;
		};
	}
	
	return 0;
};

1;
