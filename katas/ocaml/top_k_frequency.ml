let count (arr : int list) =
  let m = Hashtbl.create (List.length arr) in
  List.iter
    (fun v ->
      let entry = Hashtbl.find_opt m v in
      match entry with
      | Some e -> Hashtbl.replace m v (e + 1)
      | None -> Hashtbl.add m v 1)
    arr;
  m

(* Pay special attention to take the style of it, the fact that we compare iterarors, rather than comparison. tail recursive. *)
let take (arr : 'a list) (k : int) =
  let rec aux i acc = function
    | [] -> List.rev acc
    | _ when i = k -> List.rev acc
    | hd :: tl -> aux (i + 1) (hd :: acc) tl
  in
  aux 0 [] arr

(* THIS IS HOW IVE BEEN DOING IT *)
(* let take arr k = *)
(*   let rec aux i acc list = *)
(*     match list with *)
(*     | [] -> List.rev acc *)
(*     | _ when i = k -> List.rev acc *)
(*     | hd :: tl -> aux (i + 1) (hd :: acc) tl *)
(*   in *)
(*   aux 0 [] arr *)

let get_buckets (arr : int list) (k : int) =
  let m = count arr in
  let buckets = Array.make (List.length arr + 1) [] in
  Hashtbl.iter
    (fun k v ->
      (* string_of_int k |> print_endline; *)
      let ov = buckets.(v) in
      let nv = k :: ov in
      buckets.(v) <- nv)
    m;
  let x = Array.to_list buckets |> List.flatten |> List.rev in
  take x k

let () =
  let x = get_buckets [ 1; 3; 3; 3; 2; 3 ] 1 in
  List.iter (fun c -> c |> string_of_int |> print_endline) x

(* := is for refs *)
(* <- is for assignment and record fields *)

(* We could track max occurance for the sake of saving sapce on teh array, but its not worth*)
