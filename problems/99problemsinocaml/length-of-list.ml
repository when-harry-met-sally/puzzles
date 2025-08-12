let length arr =
  let rec _length n = function [] -> n | h :: t -> _length (n + 1) arr in
  _length 0 arr
