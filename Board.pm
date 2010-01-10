package Pacman::Board;

use strict;
use warnings;

use Pacman::Consts;
use Pacman::Pacman;
use Pacman::Ghost;

sub make {
    my ($class, $n_ghosts ) = @_;
    my $self = {
        fields      => [],
        entities    => [],
    };

    for  my $line ( split(/\n/, LEFT_LEVEL) )   {
        $line =~ s/\s//g;
        $line =~ s/_/ /g;
        next unless $line;
        $line .= reverse($line);
        push @{ $self->{'fields'} }, [ split(//,$line) ];
    }

    bless $self, $class;

    push @{ $self->{'entities'} }, Pacman::Pacman->new();
    push @{ $self->{'entities'} }, Pacman::Ghost->new($_) for 1..$n_ghosts;

    return $self;
};

sub height {
    my ($self) = @_;
    return scalar( @{ $self->{'fields'} } );
};


sub width {
    my ($self) = @_;
    return scalar( @{ $self->{'fields'}[0] });
};

my %occupied = (
    WALL()  => 1,
    GHOST() => 1,
);

sub is_occupied  {
    my ($char) = @_;
    return $occupied{$char} if exists $occupied{$char};
    return 0;
}

sub get  {
    my ($self, $row, $col) = @_;

    my $char = $self->{'fields'}[$row][$col];
    for my $entity ( @{ $self->{'entities'} } )  {
        if ( $entity->{'row'} == $row and $entity->{'col'} == $col )  {
            $char = $entity->char;
        };
    };

    return $char;
};

sub string {
    my ($self) = @_;
    for my $row (  0 ..  $self->height-1 )  {
        for my $col ( 0 .. $self->width-1 )  {
            print $self->get($row, $col);
        }
        print "\n";
    }

    return;
};

sub tick  {
    my ($self, $key) = @_;
    my $done = 0;
    my $phase = 0;
    my $active = scalar(@{ $self->{'entities'} });
    while ($active )   {
        $phase++;
        for my $entity ( @{ $self->{'entities'} } )  {
            if ( $entity->{'speed'} >= $phase )  {
                $entity->move($self, $key);
            }
            if ( $entity->{'speed'} == $phase )  {
                $active -= 1;
            }
        }
    }

    return;
};

sub eat {
	my ($self, $row, $col) = @_;

	my $char = $self->{'fields'}[$row][$col];
	if ( $char eq PILL or $char eq COOKIE ) {
		$self->{'fields'}[$row][$col] = EMPTY;
	} else {
		$char = EMPTY;
	}
	
	return $char;
};
	

1;
