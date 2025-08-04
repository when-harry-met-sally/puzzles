let loop x y =
  for i = x to y do
    string_of_int i |> print_endline
  done

let () = loop 5 3
