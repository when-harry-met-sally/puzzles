(* https://www.codewars.com/kata/57f759bb664021a30300007d/train/ocaml *)
(* swap a -> b, b -> a *)
let switcheroo (s : string) : string =
  let rec _switcharoo (str : char list) (acc : char list) =
    match str with
    | [] -> acc |> List.rev |> List.to_seq |> String.of_seq
    | 'a' :: rest -> _switcharoo rest ('b' :: acc)
    | 'b' :: rest -> _switcharoo rest ('a' :: acc)
    | hd :: rest -> _switcharoo rest (hd :: acc)
  in
  _switcharoo (s |> String.to_seq |> List.of_seq) []

(* let switcheroo s = *)
(*   String.map (function *)
(*     | 'a' -> 'b' *)
(*     | 'b' -> 'a' *)
(*     | c   -> c *)
(*   ) s *)
(* ;; *)

(* O(1) *)
(* O(N) *)
