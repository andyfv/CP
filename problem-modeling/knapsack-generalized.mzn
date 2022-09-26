% Parameter specification
int: included;
int: target;
int: itemCount;
array [1..itemCount] of int: items;

% Load the file of parameter values;
include "values.dzn";

% Model
array [1..itemCount] of var 0..1: Vars;
constraint sum(i in 1..itemCount) (Vars[i]) = included;
constraint sum(i in 1..itemCount) (Vars[i]*items[i]) = target;

solve satisfy;
