let mutate x =
  let y = ref 0 in
  y := x;
  !y

let () = mutate 5 |> string_of_int |> print_endline

(* Evaluate expr1 (discard result), *)
(**)
(* Then evaluate expr2 (discard result), *)
(**)
(* Return result of expr3. *)
(**)
