type 'a tree_node = {
  value : 'a;
  mutable left : 'a tree_node option;
  mutable right : 'a tree_node option;
}

let invertTree root =
  let rec flipit node =
    (* Swap the left and right children *)
    let temp = node.right in
    node.right <- node.left;
    node.left <- temp;

    (* Recursively invert the left and right subtrees *)
    (match node.left with Some left_node -> flipit left_node | None -> ());
    match node.right with Some right_node -> flipit right_node | None -> ()
  in

  flipit root

let invertTree root =
  let rec flipit node =
    (* Swap the left and right children *)
    let left =
      match node.left with Some left_node -> flipit left_node | None -> None
    in
    let right =
      match node.right with
      | Some right_node -> flipit right_node
      | None -> None
    in
    Some { value = node.value; left; right }
  in

  flipit root

let invertTree root =
  let rec flipit node =
    let left =
      match node.left with Some left_node -> flipit left_node | None -> None
    in
    let right =
      match node.right with
      | Some right_node -> flipit right_node
      | None -> None
    in
    Some { value = node.value; left = right; right = left }
  in
  match root with Some node -> flipit node | None -> None
;;

let root = { value = 1; left = None; right = None } in
invertTree (Some root)
