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

let top_k (arr : int list) k =
  let frq = count arr in
  (* find max frequency for correct array size *)
  let max_freq = Hashtbl.fold (fun _ v acc -> max v acc) frq 0 in
  let buckets = Array.make (max_freq + 1) [] in
  (* bucket elements by frequency *)
  Hashtbl.iter (fun key freq -> buckets.(freq) <- key :: buckets.(freq)) frq;
  (* flatten from highest frequency down, then take top k *)
  Array.to_list buckets |> List.rev |> List.flatten |> fun lst ->
  let rec take n acc = function
    | [] -> List.rev acc
    | _ when n = 0 -> List.rev acc
    | x :: xs -> take (n - 1) (x :: acc) xs
  in
  take k [] lst

let res = top_k [ 1; 1; 1; 2; 2; 3; 3 ] 2
let () = List.iter (fun a -> a |> string_of_int |> print_endline) res
