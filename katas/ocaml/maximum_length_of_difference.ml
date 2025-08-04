let mxdiflg (a1 : string array) (a2 : string array) : int option =
  match (a1, a2) with
  | [||], _ | _, [||] -> None (* if either array is empty *)
  | _ ->
      let min_x, max_x =
        Array.fold_left
          (fun (min_x, max_x) x ->
            let s = String.length x in
            (min min_x s, max max_x s))
          (String.length a1.(0), String.length a1.(0))
          a1
      in
      let min_y, max_y =
        Array.fold_left
          (fun (min_x, max_x) x ->
            let s = String.length x in
            (min min_x s, max max_x s))
          (String.length a2.(0), String.length a2.(0))
          a2
      in
      let d = max (abs (max_x - min_y)) (abs (max_y - min_x)) in
      Some d

let a1 =
  [|
    "hoqq";
    "bbllkw";
    "oox";
    "ejjuyyy";
    "plmiis";
    "xxxzgpsssa";
    "xxwwkktt";
    "znnnnfqknaz";
    "qqquuhii";
    "dvvvwz";
  |]

let a2 = [| "cccooommaaqqoxii"; "gggqaffhhh"; "tttoowwwmmww" |]
let res = mxdiflg a1 a2

let () =
  match res with
  | Some x -> print_endline (string_of_int x)
  | None -> print_endline "none"
