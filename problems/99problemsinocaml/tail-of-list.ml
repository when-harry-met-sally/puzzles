let last arr = List.nth_opt arr (List.length arr - 1);;

last [ "a"; "b"; "c"; "d" ]

let rec last = function [] -> None | [ x ] -> Some x | _ :: t -> last t
