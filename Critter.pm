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

my %deltas = (
    UP()    => [ -1,  0 ],
    DOWN()  => [ +1,  0 ],
    LEFT()  => [  0, -1 ],
    RIGHT() => [  0, +1 ],
);

sub wrap  {
	my ($coordinate, $over) = @_;
	
	$coordinate = $over -1 if $coordinate < 0;
	$coordinate = 0 if $coordinate >= $over;
	
	return $coordinate;
}

sub move  {
    my ($self, $board) = @_;

    my ($row_delta, $col_delta ) = @{ $deltas{ $self->{'dir'} } };
    my $new_row = $self->{'row'} + $row_delta;
    my $new_col = $self->{'col'} + $col_delta;

    my $target  = $board->get($new_row, $new_col);

    unless ( Pacman::Board::is_occupied($target) )  {
        $self->{'row'} = wrap( $self->{'row'} + $row_delta , $board->height);
        $self->{'col'} = wrap( $self->{'col'} + $col_delta , $board->width);
    }

    # collision detection

    return;
}

1;
