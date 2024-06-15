(* function binarySearch(arr, target, left = 0, right = arr.length - 1) { *)
(*   if (left > right) { *)
(*     return -1; // Base case: target is not found *)
(*   } *)
(**)
(*   const mid = Math.floor((left + right) / 2); *)
(**)
(*   if (arr[mid] === target) { *)
(*     return mid; // Base case: target is found *)
(*   } else if (arr[mid] > target) { *)
(*     return binarySearch(arr, target, left, mid - 1); // Recur on the left subarray *)
(*   } else { *)
(*     return binarySearch(arr, target, mid + 1, right); // Recur on the right subarray *)
(*   } *)
(* } *)

let rec binarySearch arr target left right =
  if left > right then -1
  else
    let mid = int_of_float (Float.floor (float_of_int (left + right) /. 2.0)) in
    Printf.printf "mid: %d\n" mid;
    if arr.(mid) = target then mid
    else if arr.(mid) > target then binarySearch arr target left (mid - 1)
    else binarySearch arr target (mid + 1) right

let arr = [| 1; 2; 3; 4; 5; 6; 7; 8 |];;

let res = binarySearch arr 2 0 (Array.length arr - 1) in
Printf.printf "%d\n" res

(*  *)

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
