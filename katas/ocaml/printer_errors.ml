let printer_error (s : string) : string =
  let l = String.length s in
  let y =
    String.fold_left
      (fun acc x ->
        let code = Char.code x in
        let is_below_m = code <= 109 && code >= 97 in
        match is_below_m with true -> acc | false -> acc + 1)
      0 s
  in
  string_of_int y ^ "/" ^ string_of_int l

let printer_error (s : string) : string =
  let l = String.length s in
  let y =
    String.fold_left
      (fun acc x ->
        let code = Char.code x in
        if code >= 97 && code <= 109 then acc else acc + 1)
      0 s
  in
  let buf = Buffer.create 16 in
  (* allocate buffer with initial size *)
  Buffer.add_string buf (string_of_int y);
  Buffer.add_char buf '/';
  Buffer.add_string buf (string_of_int l);
  Buffer.contents buf (* extract the final string *)

let () =
  printer_error "aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbmmmmmmmmmmmmmmmmmmmxyz"
  |> print_endline
