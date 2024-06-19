type 'a tree_node = {
  value : 'a;
  mutable left : 'a tree_node option;
  mutable right : 'a tree_node option;
}

let rec balance node h =
  let lh =
    match node.left with
    | Some left_node -> balance left_node (h + 1)
    | None -> 0
  in
  let rh =
    match node.left with
    | Some right_node -> balance right_node (h + 1)
    | None -> 0
  in
  if lh = -1 || rh = -1 || abs (lh - rh) > 1 then -1
  else if lh > rh then lh
  else rh
;;

let node = { right = None; left = None; value = 5 } in
balance node 1

let rec balance node =
  let lh =
    match node.left with
    | Some left_node -> balance left_node
    | None -> 0 (* Base case, no left child *)
  in
  let rh =
    match node.right with
    | Some right_node -> balance right_node
    | None -> 0 (* Base case, no right child *)
  in
  if lh = -1 || rh = -1 || abs (lh - rh) > 1 then -1 (* Unbalanced *)
  else 1 + max lh rh (* Height of the node *)
;;

let node = { right = None; left = None; value = 5 } in
balance node 1
