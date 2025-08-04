let valid_sudoki (board : string array array) =
  let validate_row (row_num : int) =
    let checklist = Array.make 9 false in
    let valid = ref true in
    for i = 0 to 8 do
      let g = board.(row_num).(i) in
      if g = "." then ()
      else
        let x = int_of_string g - 1 in
        let spot = checklist.(x) in
        if spot = false then checklist.(x) <- true else valid := false
    done;
    !valid
  in
  let validate_column (column_num : int) =
    let checklist = Array.make 9 false in
    let valid = ref true in
    for i = 0 to 8 do
      let g = board.(i).(column_num) in
      if g = "." then ()
      else
        let x = int_of_string g - 1 in
        let spot = checklist.(x) in
        if spot = false then checklist.(x) <- true else valid := false
    done;
    !valid
  in
  let validate_quad (quad_num : int) =
    let checklist = Array.make 9 false in
    let valid = ref true in
    for i = 0 to 8 do
      let block_row = quad_num / 3 in
      (* Which 3x3 block row: 0,1,2 *)
      let block_col = quad_num mod 3 in

      (* Which 3x3 block col: 0,1,2 *)
      let inner_row = i / 3 in
      (* Row inside the block: 0,1,2 *)
      let inner_col = i mod 3 in

      (* Col inside the block: 0,1,2 *)
      let row = (block_row * 3) + inner_row in
      let col = (block_col * 3) + inner_col in

      let g = board.(row).(col) in
      if g = "." then ()
      else
        let x = int_of_string g - 1 in
        let spot = checklist.(x) in
        if spot = false then checklist.(x) <- true else valid := false
    done;
    !valid
  in

  let valid = ref true in
  for i = 0 to 8 do
    valid := !valid && validate_row i;
    valid := !valid && validate_column i;
    valid := !valid && validate_quad i
  done;
  !valid

let bologna_sudoku : string array array =
  [|
    [| "5"; "3"; "."; "."; "7"; "."; "."; "."; "." |];
    [| "6"; "."; "."; "1"; "9"; "5"; "."; "."; "." |];
    [| "."; "9"; "8"; "."; "."; "."; "."; "6"; "." |];
    [| "8"; "."; "."; "."; "6"; "."; "."; "."; "3" |];
    [| "4"; "."; "."; "8"; "."; "3"; "."; "."; "1" |];
    [| "7"; "."; "."; "."; "2"; "."; "."; "."; "6" |];
    [| "."; "6"; "."; "."; "."; "."; "2"; "8"; "." |];
    [| "."; "."; "."; "4"; "1"; "9"; "."; "."; "8" |];
    [| "."; "."; "."; "."; "8"; "."; "."; "7"; "9" |];
  |]

let () = print_endline (string_of_bool (valid_sudoki bologna_sudoku))
