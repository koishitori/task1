# For any positive integer n we define two rules:
# if even: divide by two
# if odd: multiply by three, then add one, and repeat until the result is the number 1
class model1{
  init(){
    this.array = new Array();
  }

# if even: divide by two
# if odd: multiply by three, then add one, and repeat until the result is the number 1
  func1(input){
    if( input % 2 == 0 )
      return input / 2;
    else
      return input * 3 + 1;
  }

# Create nums array that be created from the above rules.
  set get_array( in_num ){
    var output = in_num;
    this.array.push(output);
    while( output != 1  ){
      output = this.func1( output );
      this.array.push(output);
    }
  }
}

var obj=new model1;
var answer = 0;
var output_length = 0;
for ( var i = 2; i<100000; i++ ){
  obj.init();
  obj.get_array = i;
  if( output_length < obj.array.length ){
    output_length = obj.array.length;
    answer = i;
  }
}

obj.init();
obj.get_array = answer;
console.log( "num : " + answer );
console.log( "length : " + output_length );
console.log( obj.array );

