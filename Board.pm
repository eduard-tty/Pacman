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

    push @{ $self->{'entities'} }, Pacman::Pacman->new();
    push @{ $self->{'entities'} }, Pacman::Ghost->new($_) for 1..$n_ghosts;

    return bless $self, $class;
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
    GHOST() => 0,
);

sub is_occupied  {
    my ($self, $row, $col) = @_;
    my $char = $self->get($row, $col);
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

sub eat {
	my ($self, $row, $col) = @_;

	my $snack = $self->{'fields'}[$row][$col];
	if ( $snack eq PILL or $snack eq COOKIE ) {
		$self->{'fields'}[$row][$col] = EMPTY;
	} else {
		$snack = EMPTY;
	}
	
	return $snack;
};

my $placement = 0;
	
sub ghost_start {
	$placement++;
	return (12, 11 + $placement % 6);
};

1;
