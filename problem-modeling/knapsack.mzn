% Input
array [1..6] of int: items = [7,10,23,13,4,16];

% 0/1 variables - meaning included or not
array [1..6] of var 0..1 : Vars;

% Constraints
constraint sum(i in 1..6)(Vars[i]) = 4;            % only four numbers should be included
constraint sum(i in 1..6)(Vars[i]*items[i]) = 42;  % the total should be 42

solve satisfy;