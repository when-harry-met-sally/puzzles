(* Hello World in OCaml *)
let greeting = "Hello World!"
let () = Printf.printf "%s\n" greeting

let rec fib x =
  if x = 0 || x = 1 then
    x
  else
    fib (x - 1) + fib (x - 2);;

let () = Printf.printf "%d\n" (fib 10)

open Hashtbl

let fib2 =
  let memo = Hashtbl.create 50 in  (* Creating a hash table to store up to 50 entries initially *)
  let rec fib_memoized x =
    if x = 0 || x = 1 then x
    else
      try
        Hashtbl.find memo x  (* Try to find the value in the hash table *)
      with Not_found ->  (* If not found, compute it and store it *)
        let result = fib_memoized (x - 1) + fib_memoized (x - 2) in
        Hashtbl.add memo x result;  (* Store the newly computed value *)
        result
  in
  fib_memoized

let () = Printf.printf "%d\n" (fib2 100)


