#Task:
#  For any positive integer n we define two rules:
#  if even: divide by two
#  if odd: multiply by three, then add one, and repeat until the result is the number 1
#Challenge: 
# Find the second-longest sequence of all the integers smaller or equal than 10 Million.  
# Calculate the sum of all the elements of the above mentioned second-longest sequence and share your result. Also, please include your source code. 
require "./Task1.pm";

my $task = Task1->new;
print $task->create_array(10000000);
print "1st : " . $task->{max_1st_num} . ", len:". $task->{max_1st_len} . ", sum:". $task->get_array_sum( $task->{max_1st_num} ). "\n";
print "2nd : " . $task->{max_2nd_num} . ", len:". $task->{max_2nd_len} . ", sum:". $task->get_array_sum( $task->{max_2nd_num} ). "\n";

