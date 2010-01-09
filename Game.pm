package Pacman::Game;

use strict;
use warnings;

use Term::ReadKey;

use Pacman::Consts;
use Pacman::Board;
use Pacman::Critter;
use Pacman::Pacman;

sub new  {
    my ($class, $n_ghosts) = @_;

    my $self = {
        board => Pacman::Board->make($n_ghosts),
        score => 0,
        time  => 0,
    };

    return bless $self, $class;
}

sub finished  {
    my ($self, $max_rounds) = @_;

    return 0 if not defined $max_rounds;
    return $self->{'time'} > $max_rounds;
}

sub run {
    my ($self, $max_rounds) = @_;

    ReadMode 'cbreak';
    $self->{'board'}->print;
    my $key = '';
    while ( not $self->finished($max_rounds) and $key ne 'q' )  {
        $key = lc(ReadKey(1));
        $self->{'board'}->tick($key);
        $self->{'time'} += 1;
        $self->{'board'}->print;
        print "\nu(p), d(own), l(eft), r(right), q(uit)\n";
    };
    print "\n\nGame Over!\n";
    ReadMode 'normal';

    return;
}

1;