let rec recurse i j =
  match i, j with
  | a, b when a = b ->
      print_endline (string_of_int a)   (* print final value *)
  | a, b ->
      print_endline (string_of_int a);  (* print current value *)
      recurse (a + 1) b                 (* recurse upward *)
;;

let () =
  recurse 0 4

let rec recurse i j =
  if i = j then
    Printf.printf "%d\n" i
  else (
    Printf.printf "%d\n" i;
    recurse (i + 1) j
  )

let rec range i j =
  if i > j then []
  else i :: range (i + 1) j

let () =
  range 0 4
  |> List.map string_of_int
  |> String.concat "\n"
  |> print_endline
