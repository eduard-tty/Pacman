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
};

sub overlap  {
	my ($a, $b ) = @_;
	return 0 unless $a->{'row'} == $b->{'row'};
	return 0 unless $a->{'col'} == $b->{'col'};
	return 1;
};

sub tick  {
    my ($self, $key) = @_;
    my $done = 0;
    my $phase = 0;
    my @entities = @{ $self->{'board'}{'entities'} };
    my $active = scalar(@entities);
    while ($active )   {
        $phase++;
        for my $entity ( @entities )  {
            if ( $entity->{'speed'} >= $phase )  {
                $entity->move($self->{'board'}, $key);
            }
            if ( $entity->{'speed'} == $phase )  {
                $active -= 1;
            }
        }
    }
    
    my $quit = 0;
    for my $i (0..$#entities)  {
		for my $j ($i+1..$#entities)  {
			if ( overlap($entities[$i], $entities[$j]) )  {
				$quit ||= $entities[$i]->meet($entities[$j]);
				$quit ||= $entities[$j]->meet($entities[$i]);
			}
		}
	}
    
    return $quit;
};

sub run {
    my ($self, $max_rounds) = @_;

    ReadMode 'cbreak';
    system('clear');
    print $self->{'board'}->string;
    my $done = 0;
    my $key; 
    while ( not $done )  { 
        $key = lc(ReadKey(0.5));
        $self->{'time'} += 1;
        
        $done ||= $self->tick($key);
        $done = 1 if $max_rounds and $self->{'time'} >= $max_rounds;
        $done = 1 if $key eq 'q';
        
        system('clear');
        print $self->{'board'}->string;
        print "\nu(p), d(own), l(eft), r(right), q(uit)\n";
    };
    $self->done();

    ReadMode 'restore';

    return;
};

sub done {
	my ($self) = @_;
	
	print "\n";
	for my $critter ( @{ $self->{'board'}{'entities'} } )  {
		if ( $critter->isa('Pacman::Pacman') )  {
			print "Pacman scored $critter->{'score'} \n";
		}
	}
	
	print "\nGame Over!\n\n";
	    	
	return;
};


1;
