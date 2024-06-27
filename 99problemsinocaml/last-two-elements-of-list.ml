let rec last_two = function
  | [] -> None
  | [ x ] -> None
  | [ (x, y) ] -> Some (x, y)
  | _ :: t -> last_two t

(* # last_two ["a"; "b"; "c"; "d"];; *)
(* - : (string * string) option = Some ("c", "d") *)
(* # last_two ["a"];; *)
(* - : (string * string) option = None *)
