type 'a heap = {
  mutable data : 'a array;
  mutable size : int;
  cmp : 'a -> 'a -> int; (* comparison function *)
}

let swap arr i j =
  let tmp = arr.(i) in
  arr.(i) <- arr.(j);
  arr.(j) <- tmp

let ensure_capacity h =
  if h.size = Array.length h.data then (
    let new_data = Array.make (2 * h.size) h.data.(0) in
    Array.blit h.data 0 new_data 0 h.size;
    h.data <- new_data)

let rec bubble_up h idx =
  if idx > 0 then
    let parent = (idx - 1) / 2 in
    if h.cmp h.data.(idx) h.data.(parent) < 0 then (
      swap h.data idx parent;
      bubble_up h parent)

let rec bubble_down h idx =
  let left = (2 * idx) + 1 and right = (2 * idx) + 2 in
  let smallest = ref idx in
  if left < h.size && h.cmp h.data.(left) h.data.(!smallest) < 0 then
    smallest := left;
  if right < h.size && h.cmp h.data.(right) h.data.(!smallest) < 0 then
    smallest := right;
  if !smallest <> idx then (
    swap h.data idx !smallest;
    bubble_down h !smallest)

let pop h =
  if h.size = 0 then None
  else
    let root = h.data.(0) in
    h.size <- h.size - 1;
    h.data.(0) <- h.data.(h.size);
    bubble_down h 0;
    Some root

let push h x =
  ensure_capacity h;
  h.data.(h.size) <- x;
  bubble_up h h.size;
  h.size <- h.size + 1
