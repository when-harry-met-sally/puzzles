let find_square_root n =
  if n = 1 || n = 0 then n else
  let rec sqrt n cur = 
    if (cur * cur) > n then cur - 1
    else sqrt n (cur + 1)
  in
  sqrt n 2

let () =
  Printf.printf "Square root of 4 is: %d\n" (find_square_root 4)
