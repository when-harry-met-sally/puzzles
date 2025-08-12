let rec binarySearch arr target left right =
  if left > right then -1
  else
    let mid = int_of_float (Float.floor (float_of_int (left + right) /. 2.0)) in
    Printf.printf "mid: %d\n" mid;
    (* Correctly print the mid value *)
    if arr.(mid) = target then mid
    else if arr.(mid) > target then binarySearch arr target left (mid - 1)
    else binarySearch arr target (mid + 1) right

let arr = [| 1; 2; 3; 4; 5; 6; 7; 8 |];;

let res = binarySearch arr 2 0 (Array.length arr - 1) in
Printf.printf "%d\n" res
