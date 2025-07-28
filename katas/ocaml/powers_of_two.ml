  let rec range i j = 
    let rec _range a b acc = match a, b  with 
    | a, b  when a = b -> List.rev (b::acc)
    | _ -> _range (a+1) b (a::acc)
  in _range i j []

let powersOfTwo n = List.map (fun x -> int_of_float (2. ** float_of_int x)) (range 0 n)

let print_int_list arr =
  arr
  |> List.map string_of_int
  |> String.concat "; "
  |> Printf.printf "[|%s|]\n"
;;

let () = powersOfTwo 5 |> print_int_list
