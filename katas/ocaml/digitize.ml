(* https://www.codewars.com/kata/5583090cbe83f4fd8c000051/train/ocaml *)

let digitize (n: int): int list =
  let str = string_of_int n in 
  let chars = List.init (String.length str) (String.get str) in
  
  let rec _digitize (s: char list) (acc: int list) = match s with
    | [] -> acc
    | hd::rest -> 
     (* Study asci values*) 
        _digitize rest ((Char.code hd - Char.code '0') :: acc)
  in _digitize chars []

let print_int_list arr =
  arr
  |> List.map string_of_int
  |> String.concat "; "
  |> Printf.printf "[|%s|]\n"
;;

(* TODO Figure out this approach*)
let rec digitize (n: int): int list =
  if n < 10 then [n]
  else [n mod 10] @ digitize(n / 10)

(* Mod  10 peels off last digit, so its like psuedo iteration. This approach is not tail recursive though *)


let digitize (n: int): int list =
  let rec aux m acc =
    if m < 10 then m :: acc
    else aux (m / 10) (m mod 10 :: acc)
  in
  aux n []

let () = digitize 401 |> print_int_list
