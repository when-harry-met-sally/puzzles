(* https://neetcode.io/problems/minimum-stack?list=neetcode150 *)
(**)
(* let data_stack = ref [] *)
(* let min_stack = ref [] *)
(* let init x = [] *)
(**)
(* let push x = *)
(*   let m = match !min_stack with [] -> x | hd :: rest -> min x hd in *)
(*   data_stack := x :: !data_stack; *)
(*   min_stack := m :: !min_stack *)
(**)
(* (* Remove last *) *)
(* let pop = *)
(*   match (!data_stack, !min_stack) with *)
(*   | hd :: rest, hd2 :: rest2 -> *)
(*       data_stack := rest; *)
(*       min_stack := rest2; *)
(*       Some hd *)
(*   | _, _ -> None *)
(**)
(* (* Reads first *) *)
(* let get_top = match !data_stack with hd :: rest -> Some hd | _ -> None *)
(**)
(* (* Gets first *) *)
(* let get_min = match !min_stack with hd :: rest -> Some hd | _ -> None *)

module type MinStackSig = sig
  type t

  val create : unit -> t
  val push : int -> t -> unit
  val pop : t -> int option
  val get_top : t -> int option
  val get_min : t -> int option
end

module MinStack : MinStackSig = struct
  type t = { mutable data_stack : int list; mutable min_stack : int list }

  let create () = { data_stack = []; min_stack = [] }

  let push x s =
    let m = match s.min_stack with [] -> x | hd :: _ -> min x hd in
    s.data_stack <- x :: s.data_stack;
    s.min_stack <- m :: s.min_stack

  let pop s =
    match (s.data_stack, s.min_stack) with
    | hd :: rest, _ :: rest2 ->
        s.data_stack <- rest;
        s.min_stack <- rest2;
        Some hd
    | _ -> None

  let get_top s = match s.data_stack with hd :: _ -> Some hd | [] -> None
  let get_min s = match s.min_stack with hd :: _ -> Some hd | [] -> None
end
