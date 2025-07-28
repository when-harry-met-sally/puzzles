(* https://www.codewars.com/kata/57a1fd2ce298a731b20006a4/train/ocaml *)

let is_palindrome (s: string): bool = 
  let str = String.lowercase_ascii s in 
  let rev = String.fold_left (fun acc c -> (String.make 1 c) ^ acc) "" str in 
  str = rev


let () = is_palindrome "miles" |> string_of_bool |> print_endline 

(* let is_palindrome (s: string): bool = *)
(*   Base.String.Caseless.equal s (BatString.rev s) *)

