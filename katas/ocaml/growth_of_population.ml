(* https://www.codewars.com/kata/563b662a59afc2b5120000c6/train/ocaml *)

let nb_year (p0 : int) (percent_increase : float) (flat_increase : int)
    (max_pop : int) : int =
  let rec go (current_pop : float) (current_year : int) =
    let new_population =
      if current_year = 1 then current_pop
      else
        current_pop
        +. (current_pop *. (percent_increase /. 100.))
        +. float_of_int flat_increase
    in
    let () = print_endline (string_of_float new_population) in
    if int_of_float new_population >= max_pop then current_year
    else go new_population (current_year + 1)
  in
  go (float_of_int p0) 1

let () = print_endline (string_of_int (nb_year 1500 5. 100 5000))

(* tests bugged me, the mathematic approach is best *)
