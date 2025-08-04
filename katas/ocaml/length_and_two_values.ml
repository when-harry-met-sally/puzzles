let alternate (n : int) (first_value : 'a) (second_value : 'a) : 'a list =
  let b = n / 2 in
  let rec _alternate cur acc =
    if cur = b then
      let x = if n mod 2 = 0 then acc else first_value :: acc in
      List.rev x
    else _alternate (cur + 1) (second_value :: first_value :: acc)
  in
  _alternate 0 []

let () =
  let res = alternate 3 "a" "b" in
  List.iter print_endline res

let alternate (n : int) (x : 'a) (y : 'a) : 'a list =
  List.init n (fun i -> if i mod 2 = 0 then x else y)

let alternate (n : int) (first_value : 'a) (second_value : 'a) : 'a list =
  [ first_value; second_value ]
  |> List.to_seq |> Seq.cycle |> Seq.take n |> List.of_seq
