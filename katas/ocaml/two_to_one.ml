(* Take 2 strings s1 and s2 including only letters from a to z. Return a new sorted string (alphabetical ascending), the longest possible, containing distinct letters - each taken only once - coming from s1 or s2. *)
(**)
(* https://www.codewars.com/kata/5656b6906de340bd1b0000ac/ocaml *)
(**)
(* a = "xyaabbbccccdefww" *)
(* b = "xxxxyyyyabklmopq" *)
(* longest(a, b) -> "abcdefklmopqwxy" *)
(**)
(* a = "abcdefghijklmnopqrstuvwxyz" *)
(* longest(a, a) -> "abcdefghijklmnopqrstuvwxyz" *)

(* - dedupe log n*)
(* - sort n log n*)

let dedupe str =
  let m = Hashtbl.create (String.length str) in
  String.fold_left
    (fun acc c ->
      match Hashtbl.find_opt m c with
      | None ->
          Hashtbl.add m c ();
          acc ^ String.make 1 c
      | _ -> acc)
    "" str

let sort_str str =
  str |> String.to_seq |> List.of_seq
  |> List.sort (fun a b -> Char.code a - Char.code b)
  |> List.to_seq |> String.of_seq

let solve str = dedupe str |> sort_str
let longest (s1 : string) (s2 : string) : string = solve (s1 ^ s2)
