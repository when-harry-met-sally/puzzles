(* https://www.codewars.com/kata/573992c724fc289553000e95/train/ocaml *)

(* You have a positive number n consisting of digits. You can do at most one operation: Choosing the index of a digit in the number, remove this digit at that index and insert it back to another or at the same place in the number in order to find the smallest number you can get. *)
(**)
(* Task: *)
(* Return an array or a tuple or a string depending on the language (see "Sample Tests") with *)
(**)
(* the smallest number you got *)
(* the index i of the digit d you took, i as small as possible *)
(* the index j (as small as possible) where you insert this digit d to have the smallest number. *)

(* The current subproblem is, find the earliest index that has a find the smallest sub element. First pass*)

(* let t (sn : string) = *)
(*   let chars = sn |> String.to_seq |> List.of_seq in *)
(*   List.fold_left *)
(*     (fun acc char -> *)
(*       (* Little trick *) *)
(*       let num = Char.code char - Char.code '0' in *)
(*       let () = print_endline (string_of_int num) in *)
(*       acc) *)
(*     [] chars *)

let t (chars : char array) =
  let m = ref None in
  let n = ref None in
  for i = 0 to Array.length chars - 2 do
    let ichar = chars.(i) in
    if Option.is_some !m = false then
      for j = i + 1 to Array.length chars - 1 do
        let jchar = chars.(j) in
        let () = print_endline ("I:" ^ String.make 1 ichar) in
        let () = print_endline ("J:" ^ String.make 1 jchar) in
        let () = print_endline "======" in
        if jchar < ichar then
          match !m with
          | Some num ->
              if chars.(num) > jchar then m := Some j;
              n := Some i
          | _ ->
              m := Some j;
              n := Some i
      done
  done;
  (!m, !n)

let t2 (chars : char list) =
  let l = List.length chars in
  let first_pass = List.rev chars in
  let reversed =
    List.fold_left
      (fun acc char ->
        let i, (min_value, min_index), entries = acc in
        let num = Char.code char - Char.code '0' in
        let cur_min = (min_value, min_index) in
        let new_min = (num, i) in
        let index = l - (i + 1) in
        if num < min_value then
          let entry = (index, num, new_min) in
          (i + 1, new_min, entry :: entries)
        else
          let entry = (index, num, cur_min) in
          (i + 1, cur_min, entry :: entries))
      (0, (max_int, 0), [])
      first_pass
  in
  []

let swap str =
  let chars = str |> String.to_seq |> Array.of_seq in
  let res = t chars in
  match res with
  | Some m, Some n ->
      m |> string_of_int |> print_endline;
      n |> string_of_int |> print_endline;
      let temp = chars.(m) in
      chars.(m) <- chars.(n);
      chars.(n) <- temp;
      chars |> Array.to_seq |> String.of_seq
  | _ -> str

let res = swap "161235"
let _ = print_endline res

(* my solution!! *)
(* iterate through the right side, and record the current min and index for each value. then go other way and break when we know the deal. *)
