let print_list lst =
  let rec print_elements = function
    | [] -> ()
    | [ x ] -> Printf.printf "%d" x
    | x :: xs ->
        Printf.printf "%d; " x;
        print_elements xs
  in
  Printf.printf "[";
  print_elements lst;
  Printf.printf "]\n"

let sum2 arr target =
  let rec sum2rec left right =
    if left > right then []
    else
      let c = arr.(left) + arr.(right) in
      if c = target then [ left; right ]
      else if c < target then sum2rec (left + 1) right
      else sum2rec left (right - 1)
  in
  sum2rec 0 (Array.length arr - 1)

let arr = [| 2; 3; 4 |]
let result = sum2 arr 9
let () = print_list result
