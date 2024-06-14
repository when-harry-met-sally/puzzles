let factorial =
  let rec fib_memoized x =
    if x <= 1 then 1
    else
        x * fib_memoized (x - 1)
  in
  fib_memoized

let () = Printf.printf "%d\n" (factorial 6)
