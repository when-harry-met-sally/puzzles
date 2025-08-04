let valid_sudoki (board : string array array) =
  let validate_row (row_num : int) =
    let checklist = Array.make 9 false in
    let valid = ref true in
    let () = print_endline ("x" ^ string_of_int row_num) in
    for i = 0 to 8 do
      let () = print_endline ("y" ^ string_of_int i) in
      let g = board.(row_num).(i) in
      let () = print_endline g in
      if g = "." then ()
      else
        let x = int_of_string g - 1 in
        let () = print_endline (string_of_int x) in
        let spot = checklist.(x) in
        if spot = false then checklist.(i) <- true else valid := false
    done;
    !valid
  in

  let valid = ref true in
  for i = 0 to 8 do
    valid := validate_row i
  done;
  !valid

let bologna_sudoku : string array array =
  [|
    [| "5"; "3"; "."; "."; "7"; "."; "."; "."; "." |];
    [| "6"; "5"; "."; "1"; "9"; "5"; "."; "."; "." |];
    [| "."; "9"; "8"; "."; "."; "."; "."; "6"; "." |];
    [| "8"; "."; "."; "."; "6"; "."; "."; "."; "3" |];
    [| "4"; "."; "."; "8"; "."; "3"; "."; "."; "1" |];
    [| "7"; "."; "."; "."; "2"; "."; "."; "."; "6" |];
    [| "."; "6"; "."; "."; "."; "."; "2"; "8"; "." |];
    [| "."; "."; "."; "4"; "1"; "9"; "."; "5"; "5" |];
    [| "."; "."; "."; "."; "8"; "."; "."; "7"; "9" |];
  |]

let () = print_endline (string_of_bool (valid_sudoki bologna_sudoku))

(* validate row, column, quadrant. we don't need to verify everything is checked, just no duplicates. the real trick is determining quadrant *)
