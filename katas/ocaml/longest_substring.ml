(* Input: "abcabcbb" → Output: 3 *)
(* Explanation: The longest substring without repeating characters is "abc". *)
(**)
(* Input: "bbbbb" → Output: 1 *)
(* Explanation: The longest substring without repeating characters is "b". *)
(**)
(* Input: "pwwkew" → Output: 3 *)
(* Explanation: The longest substring without repeating characters is "wke". *)
(**)

(* Iterative, which feels more natural *)
let longest_unique_substring (str : string) =
  let parsed_text = String.to_seq str |> Array.of_seq in
  let l = Array.length parsed_text in
  let m = Hashtbl.create l in
  let start = ref 0 in
  let max = ref 0 in
  for i = 0 to l - 1 do
    let char = Array.get parsed_text i in
    (* check if we've seen this char and update start *)
    (match Hashtbl.find_opt m char with
    | Some e when e >= !start -> start := e + 1
    | _ -> ());
    (* compute current length and update max *)
    let n = i + 1 - !start in
    if n > !max then max := n;
    (* record the latest index of this character *)
    Hashtbl.replace m char i
  done;
  !max

(* Recursive, but mutating Hashtabl *)
let longest_unique_substring (str : string) =
  let a = String.to_seq str |> List.of_seq in
  let m = Hashtbl.create (List.length a) in
  let rec _longest_unique_substring (arr : char list) counter start max =
    match arr with
    | [] -> max
    | hd :: rest -> (
        let n = counter - start in
        let new_c = counter + 1 in
        let new_max = if n > max then n else max in
        let next = _longest_unique_substring rest new_c start in
        let entry = Hashtbl.find_opt m hd in
        let () = Hashtbl.replace m hd counter in
        match entry with
        | Some e ->
            if e >= start then _longest_unique_substring rest new_c (e + 1) max
            else next new_max
        | None -> next new_max)
  in
  _longest_unique_substring a 0 0 0

let res = longest_unique_substring "qabcabcbb"
let () = print_endline (string_of_int res)
