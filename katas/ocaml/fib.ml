let rec _fib i j (x, y) = 
  let z = x + y in
  match i, j with
  | a, b when a = b -> z
  | _ -> _fib i (j+1) (y,z)

let fib i = match i with
  | 1 -> 1
  | 0 -> 0
  | _ -> _fib i 2 (0,1)

let () =
  print_endline (string_of_int (fib 20))
