#Task:
#  For any positive integer n we define two rules:
#  if even: divide by two
#  if odd: multiply by three, then add one, and repeat until the result is the number 1
#Challenge: 
# Find the second-longest sequence of all the integers smaller or equal than 10 Million.  
# Calculate the sum of all the elements of the above mentioned second-longest sequence and share your result. Also, please include your source code. 
package Task1;
use strict;
use warnings;
use Data::Dumper;


sub new {
    my $class = shift;
    
    my $self = {
        ans_array => [ 0, 1 ],
        max_1st_num => 0,
        max_1st_len => 0,
        max_2nd_num => 0,
        max_2nd_len => 0,
    };
    return bless $self, $class;
}

#  For any positive integer n we define two rules:
#  if even: divide by two
#  if odd: multiply by three, then add one, and repeat until the result is the number 1
sub func1{
    my $self = shift;
    my $num = shift;
    if( $num % 2 == 0 ){
        $num / 2;
    } else {
        $num * 3 + 1;
    }
}

# count length array that be created from the above rules.
# If a known number is found, skip the work and add the value for the known number
sub get_array_length{
    my $self = shift;
    my $num = shift;
    my @array = [];
    while( $num != 1 && ! $self->{"ans_array"}->[ $num ] ){
        push @array, $num;
        $num = $self->func1( $num );
    }
    scalar(@array) + $self->{"ans_array"}->[$num]-1;
}

# Create nums array that be created from the above rules.
sub create_array{
    my $self = shift;
    my $max_index = shift;
    foreach(2..$max_index){
        push @{$self->{"ans_array"}}, $self->get_array_length($_);
        if( $self->{"ans_array"}->[$_] > $self->{"max_1st_len"} ){
            $self->{"max_2nd_num"} = $self->{"max_1st_num"};
            $self->{"max_1st_num"} = $_;
            $self->{"max_2nd_len"} = $self->{"max_1st_len"};
            $self->{"max_1st_len"} = $self->{"ans_array"}->[$_];
        }
    }
}

//Compute the sum of the array obtained from the input value
sub get_array_sum{
    my $self = shift;
    my $num = shift;
    my $sum = $num;
    while( $num != 1  ){
        $num = $self->func1( $num );
        $sum += $num;
    }
    $sum;
}

1;
