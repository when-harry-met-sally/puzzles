(* https://www.codewars.com/kata/57f780909f7e8e3183000078/train/ocaml *)

let grow (xs: int list): int = List.fold_left (fun acc i -> acc * i) 1 xs

let () = grow [1;2;3;4] |> string_of_int |> print_endline

(* let grow = List.fold_left ( * ) 1 *)
