(* let repeat (x : string) (n : int) = *)
(*   let rec _repeat i acc = *)
(*     match i with *)
(*     | _ when i = n -> String.concat "" (List.rev acc) *)
(*     | _ -> _repeat (i + 1) (x :: acc) *)
(*   in *)
(*   _repeat 0 [] *)

let repeat (x : string) (n : int) = String.make n x.[0]

(* let repeat (x : string) (n : int) = *)
(*   let buf = Buffer.create (String.length x * n) in *)
(*   for _ = 1 to n do *)
(*     Buffer.add_string buf x *)
(*   done; *)
(*   Buffer.contents buf *)

let generate_shape (n : int) : string =
  let row = repeat "+" n in
  let rows = ref "" in
  for i = 0 to n - 1 do
    let e = if i = n - 1 then "" else "\n" in
    rows := !rows ^ row ^ e
  done;
  !rows

let res = generate_shape 5
let () = print_endline res

(* This was correct, but we shoudl lean into buffers more since they are designed to be dynamic. *)

(* This bypasses the overly complex logic we ujsed. *)
let generate_shape (n : int) : string =
  List.init n (fun _ -> String.make n '+') |> String.concat "\n"
