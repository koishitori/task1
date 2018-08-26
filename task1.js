// For any positive integer n we define two rules:
// if even: divide by two
// if odd: multiply by three, then add one, and repeat until the result is the number 1
class model1{
    init(){
        this.ans_array = new Array();
        this.ans_array[1] = 1;
    }

// if even: divide by two
// if odd: multiply by three, then add one, and repeat until the result is the number 1
    func1(input){
        if( input % 2 == 0 )
            return input / 2;
        else
            return input * 3 + 1;
    }

// Create nums array that be created from the above rules.
// If a known number is found, skip the work and add the value for the known number
    get_array_length( input ){
        var output = input;
        var temp_array = new Array();
        while( output != 1 && ! this.ans_array[ output ] ){
            temp_array.push( output );
            output = this.func1( output );
        }
        (this.ans_array)[ input ] = temp_array.length + (this.ans_array)[output];
    }

// Compute the sum of the array obtained from the input value
    get_array_sum( input ){
        var output = input;
        var sum = output;
        while( output != 1  ){
            output = this.func1( output );
            sum += output;
        }
        return sum;
    }
}

var obj=new model1;
obj.init();
var max_1st_num = 0;
var max_1st_len = 0;
var max_2nd_num = 0;
var max_2nd_len = 0;

var output_length = 0;
for ( var i = 2; i <= 10000000; i++ ){
    obj.get_array_length(i);
    if( max_1st_len < obj.ans_array[ i ] ){
      max_2nd_num = max_1st_num;
      max_2nd_len = max_1st_len;
      max_1st_num = i;
      max_1st_len = obj.ans_array[ i ];
    }
}

console.log( "1st : " + max_1st_num + ", len : " + max_1st_len + ", sum : " + obj.get_array_sum(max_1st_num) );
console.log( "2nd : " + max_2nd_num + ", len : " + max_2nd_len + ", sum : " + obj.get_array_sum(max_2nd_num) );
