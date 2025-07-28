(* https://www.codewars.com/kata/55f9bca8ecaa9eac7100004a/train/ocaml *)

let past (h: int) (m: int) (s: int): int = 
  let m_to_s n = n * 60 in
  let h_to_s n = n * 60 * 60 in
  let s_to_ms n = n * 1000 in
  s_to_ms (h_to_s h + m_to_s m + s)


let () = print_endline (string_of_int (past 0 1 1))
