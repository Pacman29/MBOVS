#define loop 30
int count = 0;

bool mutex = true;

inline wait(sem) {
	atomic {
		sem;
		sem=false;
	}
}

inline signal(sem) {
	sem = true
}

proctype inc( ) {
	int c = loop;
	do
		:: (c > 0) -> 
			wait(mutex); 
			int tmp; 
			tmp = count; 
			count=tmp + 1; 
			signal(mutex); c--;
		:: (c == 0) -> break;
	od;
}

active proctype print( ) {
	int c = loop
	do
		:: (c > 0) ->
			wait(mutex);
			if :: (count % 2 == 0) -> 
				printf("MSC: count: %d\n", count); 
			   :: (count % 2 != 0) -> skip
			fi;
			signal(mutex);
			c--;
	    	:: (c == 0) ->  break;
	od;
}

init {
	atomic {
	run inc();
	run inc();
	}
}
