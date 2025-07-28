let rec _reverse arr acc = match arr with
  [] -> acc
  | (hd::rest) -> _reverse rest (hd::acc)

let reverse arr = _reverse arr []

let print_int_list arr =
  arr
  |> List.map string_of_int
  |> String.concat "; "
  |> Printf.printf "[|%s|]\n"
;;

let () = reverse [1;2;3] |> print_int_list
