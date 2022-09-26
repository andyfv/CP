% Parameters:
int: num_workers = 6;
int: num_tasks = 12;
int: min_work = 2;
int: max_work = 5;

set of int: workers = 1..num_workers;
set of int: tasks   = 1..num_tasks;

array [1..6,1..6] of 0..1: bad_pair =
  [|0,1,0,1,0,0
   |1,0,0,0,1,0
   |1,0,0,1,0,0
   |0,0,1,0,1,0
   |0,0,1,0,0,0 
   |0,0,0,1,0,0
   |] ;

% Variables:
array[workers, tasks] of var 0..1 : Assign;

% Constraints: 
constraint forall(t in tasks) 
  (sum (w in workers) 
    (Assign[w,t]) >= min_work
  );
constraint forall(w in workers)
  (sum (t in tasks)
    (Assign[w,t]) <= max_work
  );
constraint forall(w1, w2 in workers)
  (bad_pair[w1,w2] = 1 -> forall (t in tasks)
   (Assign[w1,t] + Assign[w2, t] <= 1));

solve satisfy;