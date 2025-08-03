let count (arr : int list) =
  let m = Hashtbl.create (List.length arr) in
  let () =
    List.iter
      (fun c ->
        let entry = Hashtbl.find_opt m c in
        match entry with
        | Some e -> Hashtbl.replace m c (e + 1)
        | _ -> Hashtbl.add m c 1)
      arr
  in
  m

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
