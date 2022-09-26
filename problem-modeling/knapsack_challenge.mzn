% Parameters:
enum items = {book, jacket, washbag, computer, boots, alarmclock, anorak, food};
array [items] of int: weight = [2, 4, 3, 8, 7, 1, 2, 6];
array [items] of int: value  = [6, 10, 8, 25, 22, 4, 5, 20];
array [items] of int: volume = [250, 500, 300, 250, 650, 130, 150, 600];

int: weight_limit = 20;
int: volume_limit = 2000;

array [items,items] of int: extra_value =
  [| 0, 0, 0,-5, 0, 0, 0, 0
   | 0, 0, 0, 0, 3, 0,-2, 0
   | 0, 0, 0, 0, 0, 0, 0, 0
   |-5, 0, 0, 0, 0,-2, 0, 0
   | 0, 3, 0, 0, 0, 0, 0, 0
   | 0, 0, 0,-2, 0, 0, 0, 0
   | 0,-2, 0, 0, 0, 0, 0, 0
   | 0, 0, 0, 0, 0, 0, 0, 0
   |] ;

% Variables:
array [items] of var 0..1: Selected;
var int: max_value;

% Constraints:
constraint sum(i in items) 
  (Selected[i] * weight[i]) <= weight_limit;
constraint sum(i in items)
  (Selected[i] * volume[i]) <= volume_limit;
    
% Objective:
constraint max_value = sum(i in items) (Selected[i] * value[i]);

solve maximize(max_value);