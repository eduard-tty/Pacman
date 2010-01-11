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

sub move  {
    my ($self, $board, $key) = @_;

    $self->{'dir'} = $self->smell_way($board);

    $self->SUPER::move($board);

    return;
};

sub smell_way  {
    my ($self, $board) = @_;

    my $best_score = 0;
    my $best_dir   = $self->{'dir'};
    for my $dir ( keys(%DELTAS), $self->{'dir'} )  {
        my $new_row = $self->{'row'} + $DELTAS{$dir}->[0];
        my $new_col = $self->{'col'} + $DELTAS{$dir}->[1];
        my $score = $board->{'smell'}[ $new_row ][ $new_col ];
        if ( $score >= $best_score )  {
            $best_dir   = $dir;
            $best_score = $score;
        };
    };

    return $best_dir;
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
