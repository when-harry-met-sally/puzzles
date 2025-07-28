(* https://www.codewars.com/kata/53da3dbb4a5168369a0000fe/train/ocaml *)
let even_or_odd (n: int): string = if n mod 2 = 0 then "even" else "odd"

let () = print_endline (even_or_odd 4)
