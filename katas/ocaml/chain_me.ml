let chain (init_val : 'a) (functions : ('a -> 'a) list) : 'a =
  List.fold_left (fun acc f -> f acc) init_val functions

let add n = n + 1
let mult n = n * 30

let () =
  let res = chain 2 [ add; mult ] in
  print_endline (string_of_int res)

(* Solutions *)

let chain init_val functions = List.fold_left ( |> ) init_val functions
