let to_acronym (inp : string) =
  let chars = inp |> String.to_seq |> List.of_seq in
  let rec go str last acc =
    match (str, last) with
    | ' ' :: rest, Some c -> go rest None (Char.uppercase_ascii c :: acc)
    | (('a' .. 'z' | 'A' .. 'Z') as hd) :: rest, None ->
        go rest (Some (Char.uppercase_ascii hd)) acc
    | hd :: rest, Some _ -> go rest last acc
    | [], Some c -> List.rev (c :: acc)
    | [], _ -> List.rev acc
    | _ :: rest, _ -> go rest last acc
  in
  let res = go chars None [] in
  let x = res |> List.to_seq |> String.of_seq in
  x

let acro = to_acronym "Miles Malachy Moran"
let () = print_endline acro
