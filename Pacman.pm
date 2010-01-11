package Pacman::Pacman;

use strict;
use warnings;

use base 'Pacman::Critter';

use Pacman::Consts;
use Pacman::Critter;


sub new {
    my ($class) = @_;

    my $self = Pacman::Critter->new(10, 14, LEFT, 1);
    $self->{'score'} = 0;
    $self->{'safe'}  = 0;

    return bless $self, $class;
};

my %key_x_dir   = ( u   => UP,  d => DOWN,  l => LEFT, r => RIGHT );
my %snack_value = ( EMPTY() => 0,  PILL() => 1,  COOKIE() => 5 );

sub move  {
    my ($self, $board, $key) = @_;

    $self->{'dir'} = $key_x_dir{$key} if exists $key_x_dir{$key};
    $self->SUPER::move($board);

    my $snack = $board->eat( $self->location );
    $self->{'score'} += $snack_value{$snack};

    $self->{'safe'} -= 1 if $self->{'safe'};
    $self->{'safe'} = 20 + int(rand(5)) if $snack eq COOKIE;

    $board->{'smell'}[ $self->{'row'} ][ $self->{'col'} ] = 10;

    return;
};

my %faces = ( UP() => 'V',  DOWN() => '^',  LEFT() => '>',  RIGHT() => '<' );

sub char {
    my ($self) = @_;
    return '?' if $self->{'safe'}; # change color in stead
    return $faces{ $self->{'dir'} };
};

sub meet {
    my ($self) = @_;
    return $self->{'safe'} ? 0 : 1;
};

1;
