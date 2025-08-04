(* In OCaml, the function takes and returns a list, not an array *)
let sort_by_length (xs : string list) : string list =
  List.sort (fun a b -> String.length a - String.length b) xs

let res = sort_by_length [ "abasada"; "sa" ]
let () = List.iter print_endline res
