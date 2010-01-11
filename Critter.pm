package Pacman::Critter;

use strict;
use warnings;

use Pacman::Consts;
use Pacman::Board;

sub new  {
    my ($class, $row, $col, $dir, $speed) = @_;

    return bless {
        row     => $row,
        col     => $col,
        dir     => $dir,
        speed   => $speed,
    }, $class;
}

sub location  {
	my ($self) = @_;
	
	return ( $self->{'row'}, $self->{'col'} );
}

sub wrap  {
	my ($coordinate, $over) = @_;
	
	$coordinate = $over -1 if $coordinate < 0;
	$coordinate = 0 if $coordinate >= $over;
	
	return $coordinate;
}

sub move  {
    my ($self, $board) = @_;

    my ($row_delta, $col_delta ) = @{ $DELTAS{ $self->{'dir'} } };
    my $new_row = $self->{'row'} + $row_delta;
    my $new_col = $self->{'col'} + $col_delta;

    unless ( $board->is_occupied($new_row, $new_col) )  {
        $self->{'row'} = wrap( $self->{'row'} + $row_delta , $board->height);
        $self->{'col'} = wrap( $self->{'col'} + $col_delta , $board->width);
    }

    return;
}

sub meet  {
	return 0;
}

1;
