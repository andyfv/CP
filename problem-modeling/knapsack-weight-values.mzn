% Parameter specification;
int: weightLimit;
int: itemCount;
array [1..itemCount] of int: weights;
array [1..itemCount] of int: values;

% Load the file of parameter values;
include "values2.dzn";

% Model
array [1..itemCount] of var 0..1: Vars;
var int: TotalValue;

constraint sum(i in 1..itemCount) (Vars[i]*weights[i]) <= weightLimit;
constraint sum(i in 1..itemCount) (Vars[i]*values[i]) = TotalValue;

solve satisfy;

% To find the set of items which have max total value use:
% solve maximize TotalValue;