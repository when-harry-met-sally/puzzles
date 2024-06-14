(* Define the hash table module *)
module IntHashtbl = Hashtbl.Make(struct
  type t = int
  let equal = (=)
  let hash = Hashtbl.hash
end)

(* Two Sum function *)
let two_sum nums target =
  let table = IntHashtbl.create (Array.length nums) in
  let rec find_pair i =
    if i >= Array.length nums then
      None
    else
      let complement = target - nums.(i) in
      match IntHashtbl.find_opt table complement with
      | Some index -> Some (index, i)
      | None ->
          IntHashtbl.add table nums.(i) i;
          find_pair (i + 1)
  in
  find_pair 0

(* Example usage *)
let () =
  let nums = [|2; 7; 11; 15|] in
  let target = 9 in
  match two_sum nums target with
  | Some (i, j) -> Printf.printf "Indices: %d, %d\n" i j
  | None -> Printf.printf "No two sum solution found\n"
