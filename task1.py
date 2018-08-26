# For any positive integer n we define two rules:
# if even: divide by two
# if odd: multiply by three, then add one, and repeat until the result is the number 1
class Task1:

    def __init__(self):
        self.ans_array = [0,1]

# if even: divide by two
# if odd: multiply by three, then add one, and repeat until the result is the number 1
    def func1( self, input ):
        if( input % 2 == 0 ):
            return input / 2
        return input * 3 + 1;

# Create nums array that be created from the above rules.
# If a known number is found, skip the work and add the value for the known number
    def get_array_length( self, input ):
        output = input
        temp_array = []
        while( output != 1 and output >= len( self.ans_array )  ):
            temp_array.append( output )
            output = self.func1( output )
        self.ans_array.append( len(temp_array) + self.ans_array[int(output)] )

# Compute the sum of the array obtained from the input value
    def get_array_sum( self, input ):
        output = input
        sum = output
        while( output != 1  ):
            output = self.func1( output )
            sum += output
        return sum

task1=Task1()
max_1st_num = 0
max_1st_len = 0
max_2nd_num = 0
max_2nd_len = 0
until = 10000000

for i in range(2, ( until+1 )):
    task1.get_array_length(i)
    if( max_1st_len < task1.ans_array[ i ] ):
        max_2nd_num = max_1st_num
        max_2nd_len = max_1st_len
        max_1st_num = i
        max_1st_len = task1.ans_array[ i ]

print( '1st : {0}, len : {1}, sum : {2}'.format( max_1st_num, max_1st_len, task1.get_array_sum(max_1st_num) ) );
print( '2nd : {0}, len : {1}, sum : {2}'.format( max_2nd_num, max_2nd_len, task1.get_array_sum(max_2nd_num) ) );
