(* https://www.codewars.com/kata/559536379512a64472000053/train/ocamlhttps://www.codewars.com/kata/559536379512a64472000053/train/ocaml *)

let play_pass (s : string) (shift : int) =
  let arr =
    String.mapi
      (fun i c ->
        let even = i mod 2 = 0 in
        match c with
        | 'A' .. 'Z' as alpha ->
            let offset = Char.code 'A' in
            let x =
              ((Char.code alpha - offset + shift) mod 26) + offset
              |> char_of_int
            in
            if even then x else Char.lowercase_ascii x
        | 'a' .. 'z' as alpha ->
            let offset = Char.code 'a' in
            let x =
              ((Char.code alpha - offset + shift) mod 26) + offset
              |> char_of_int
            in
            if even then Char.uppercase_ascii x else x
        | '0' .. '9' as alpha ->
            let offset = Char.code '0' in
            let x = offset + Char.code '9' - Char.code alpha in
            char_of_int x
        | _ -> c)
      s
  in
  arr |> String.to_seq |> List.of_seq |> List.rev |> List.to_seq
  |> String.of_seq

let new_password = play_pass "2015" 2

(* expected: "4897 NkTrC Hq fT67 GjV Pq aP OqTh gOcE CoPcTi aO" *)
(* but got: "7324 NkTrC Hq fT54 GjV Pq aP OqTh gOcE CoPcTi aO" *)
let _ = print_endline new_password

(*
range = 25

z = 26 -> 1

let new = (char_code + shift) mod 26

2 mod 6 -> 2
5 mod 2   (* 1 because 5 = 2 * 2 + 1 *)
14 mod 4  (* 2 because 14 = 4 * 3 + 2 *)
14 mod 4  (* 2 because 14 = 4 * 3 + 2 *)



*)
