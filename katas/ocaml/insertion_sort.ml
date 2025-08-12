let insertion_sort (arr : 'a array) =
  for i = 1 to Array.length arr - 1 do
    print_endline "hi"
  done

let _ = insertion_sort [| 1 |]

(* Insertion sort on a list of (key, value) pairs *)
let insertion_sort (pairs : (int * string) array) : (int * string) array array =
  let snapshots = ref [] in
  let record () = snapshots := Array.copy pairs :: !snapshots in

  for i = 1 to Array.length pairs - 1 do
    let current = pairs.(i) in
    let key = fst current in
    let j = ref i in

    (* Shift elements right until correct position found *)
    while !j > 0 && fst pairs.(!j - 1) > key do
      pairs.(!j) <- pairs.(!j - 1);
      decr j
    done;

    (* Insert element at correct spot *)
    pairs.(!j) <- current;

    (* Record snapshot after each insertion *)
    record ()
  done;

  Array.of_list (List.rev !snapshots)
