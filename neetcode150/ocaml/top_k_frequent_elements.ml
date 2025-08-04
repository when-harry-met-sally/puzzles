let count arr =
  let m = Hashtbl.create (List.length arr) in
  let () =
    List.iter
      (fun i ->
        let entry = Hashtbl.find_opt m i in
        match entry with
        | None -> Hashtbl.add m i 1
        | Some e -> Hashtbl.replace m i (e + 1))
      arr
  in
  m

let top_k (arr : int list) (k : int) : int list =
  let m = count arr in
  Hashtbl.to_seq m |> List.of_seq
  |> List.sort (fun (a1, b1) (a2, b2) -> b2 - b1)
  |> List.map (fun (a1, b1) -> a1)
  |> List.to_seq |> Seq.take k |> List.of_seq

let () = print_endline "a"

(* So, sortringing  n log n, heap is k log k, where k is unique elements, and then bucket sort is u log u*)
