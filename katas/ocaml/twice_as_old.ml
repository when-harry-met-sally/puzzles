(* https://www.codewars.com/kata/5b853229cfde412a470000d0/train/ocaml *)

let twice_as_old dad son =
  let rec _twice_as_old i j = if (i +1 )/ 2 = j then abs (dad - i) else _twice_as_old (i+1) (j+1)
  in _twice_as_old (dad - son) 0

let () = twice_as_old 36 7 |> string_of_int |> print_endline 

(**)
(* current father's age (years) *)
(* current age of his son (years) *)
(* Сalculate how many years ago the father was twice as old as his son (or in how many years he will be twice as old). 
The answer is always greater or equal to 0, no matter if it was in the past or it is in the future. *)

(* Math approach *)
let twice_as_old dad son = abs (dad - 2 * son)
