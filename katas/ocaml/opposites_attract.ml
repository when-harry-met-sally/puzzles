(* https://www.codewars.com/kata/555086d53eac039a2a000083/train/ocaml *)

let lovefunc (flower1: int) (flower2: int): bool = flower1 mod 2 <> flower2 mod 2

  let () = print_endline (string_of_bool (lovefunc 2 3))
