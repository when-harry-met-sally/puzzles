let get_count (s : string) : int =
  String.fold_left
    (fun acc c ->
      match c with
      | 'a' -> acc + 1
      | 'e' -> acc + 1
      | 'i' -> acc + 1
      | 'u' -> acc + 1
      | 'o' -> acc + 1
      | _ -> acc)
    0 s
