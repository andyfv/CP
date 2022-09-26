% Number of locations:
int : n;

% Distance between locations:
array [1..n, 1..n] of int: distances;

% A limit on the total distance of the tour
int : limit ;

% Assume the data is in a file called "ecologist-date.dzn"
include "ecologist-data.dzn";

% For the domain of travel distances,
% compute the maximum distance in the matrix distances
int : maxDist = max(i,j in 1..n) (distances[i,j]);

% Variables;

% An array of n variables, one for each location , called V
% In this model the value of the variable V[j]
% represents the location visited jth in the tour

array [1..n] of var 1..n : V;

% An array of N travel distance variables on for each log of the tour;
array[1..n] of var 1..maxDist : TD;

% The tour should visit all n diffirent locations, which is equivalent
% to saying all the variables in the array V must take distinct values.
constraint forall(i in 1..n,j in i+1..n) (V[i] != V[j]);
 
% The travel distance TD[j] of leg j of the tour is the distance
% from the locaiton in positio j i nthe tour V[j], to V[j+1]
constraint forall(j in 1..n-1)(TD[j] = distances[V[j],V[j+1]]);

% and the final leg reutrns to the first location
constraint TD[n] = distances[V[n], V[1]];

% The total travel distance of the tour must be below the given limit
constraint sum (j in 1..N) (TD[j]) <= limit;

solve satisfy;