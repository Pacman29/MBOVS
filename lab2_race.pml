#define loop 30
int count = 0;


proctype inc( ) {
	int c = loop
	do
		:: (c > 0) -> count=count + 1; c--;
		:: (c == 0) -> break;
	od;
}

active proctype print( ) {
	int c = loop
	do
		:: (c > 0) ->
			if :: (count % 2 == 0) -> 
				printf("MSC: count: %d\n", count); 
			fi;
			c--;
	    	:: (c == 0) ->  break;
	od;
}

init {
	run inc();
	run inc();
	run inc();
}
