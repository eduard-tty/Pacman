package Pacman::Critter;

use strict;
use warnings;

use Pacman::Consts;

sub new  {
    my ($class, $row, $col, $dir, $speed) = @_;

    return bless {
        row     => $row,
        col     => $col,
        dir     => $dir,
        speed   => $speed,
    }, $class;
}

my %deltas = (
    UP()    => [ -1,  0 ],
    DOWN()  => [ +1,  0 ],
    LEFT()  => [  0, -1 ],
    RIGHT() => [  0, +1 ],
);

sub move  {
    my ($self, $board) = @_;

    my ($row_delta, $col_delta ) = @{ $deltas{ $self->{'dir'} } };
    my $new_row = $self->{'row'} + $row_delta;
    my $new_col = $self->{'col'} + $col_delta;

    my $target  = $board->get($new_row, $new_col);

    if ( $target ne  WALL() )  {
        $self->{'row'} += $row_delta;
        $self->{'col'} += $col_delta;
    }

    # collision detection

    return;
}

1;
