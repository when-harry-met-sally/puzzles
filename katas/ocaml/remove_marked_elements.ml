let remove (integer_list : int list) (values_list : int list) : int list =
  let m = Hashtbl.create (List.length values_list) in
  List.iter (fun i -> Hashtbl.add m i ()) values_list;

  List.filter (fun a -> not (Hashtbl.mem m a)) integer_list
