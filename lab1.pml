proctype factorial(int n; chan result) {
	int res = 1;
	do 
		:: ( n > 0)  -> res =  res * n ; n = n -1;
		:: (n == 0) -> break;
	od;
	result ! res
}

init {
	chan res = [1] of {int};
	int r;
	run factorial(3, res);
	res ? r;
	printf("MSC: result: %d\n", r)
}
