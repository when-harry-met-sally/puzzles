(* Perimeter of squares in a rectangle *)

(* uncomment if you need it: open Z;;
   perimeter returns a big integer as a string *)
let fib (i : int) : int =
  match i with
  | 0 -> 0
  | 1 -> 1
  | _ ->
      let rec _fib j (one, two) c =
        let three = one + two in
        let new_c = three + c in
        if i == j then new_c else _fib (j + 1) (two, three) new_c
      in
      _fib 1 (0, 1) 1

let perimeter (n : int) : string = string_of_int (fib n * 4)
(* your code *)

let _ = print_endline (perimeter 30)
