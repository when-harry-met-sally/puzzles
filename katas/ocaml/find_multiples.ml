(* In this simple exercise, you will write a function that takes two integers; n and limit; and returns a list of the multiples of n up to and possibly including limit. *)
(**)
(* It is guaranteed that n > 0 and limit >= n. *)
(**)
(* For example, if the parameters passed are (2, 6), the function should return [2, 4, 6] as 2, 4, and 6 are the multiples of 2 up to 6. *)
(* https://www.codewars.com/kata/58ca658cc0d6401f2700045f/train/ocaml *)



let find_multiples (integer: int) (limit: int): int list = 
  let rec _find_multiples ind arr = 
    let p = ind * integer in
  if p > limit then List.rev arr else 
  _find_multiples (ind + 1) (p::arr)
  in _find_multiples 1 []

let () = find_multiples 2 8 |> List.map string_of_int
  |> String.concat "\n"
  |> print_endline
