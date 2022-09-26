% Parameters:
enum people;
enum tasks;
array [people, tasks] of int: value;
set of int: vals;
int: limit;

% Variables: 
array [tasks] of var people: A;
array [tasks] of var vals: TV;
var int: TotalValue;

% Import data:
include "assignment_data.dzn";

% Constraints:
constraint forall(t1 in tasks, t2 in tasks where t1 != t2) (A[t1] != A[t2]);
constraint forall(t in tasks) (TV[t] = value[A[t],t]);
constraint TotalValue = sum(t in tasks) (TV[t]);
constraint TotalValue >= limit;

solve satisfy;