(* Import the Hashtbl module *)
open Hashtbl
open Printf

(* Create a hash table with an initial size (capacity) of 10 *)
let romans = Hashtbl.create 7

let detractors = Hashtbl.create 3

(* Add the key "V" with the value 4 *)
let () = Hashtbl.add romans 'I' 1
let () = Hashtbl.add romans 'V' 5
let () = Hashtbl.add romans 'X' 10
let () = Hashtbl.add romans 'L' 50
let () = Hashtbl.add romans 'C' 100
let () = Hashtbl.add romans 'D' 500
let () = Hashtbl.add romans 'M' 1000

let () = Hashtbl.add detractors 'I' ['X'; 'V']
let () = Hashtbl.add detractors 'X' ['L'; 'C']
let () = Hashtbl.add detractors 'V' ['D'; 'M']

(* Retrieve and print the value associated with key "V" *)
let roman_to_int str = 
  let rec rome s score =
    for i = 0 to String.length s - 1 do
      let c = s.[i] in
      let temp = match Hashtbl.find_opt romans c with
      | Some x -> x
      | _ -> 0 in
      if i = (String.length str - 1) then 
       score + temp
      else 
        let d = s.[i + 1] in
        score
    done
  in
  rome str 0


let roman_to_int str = 
  let rec rome i score =
      if i >= (String.length str) then 
        score
      else 
      let c = str.[i] in
      let d = str.[i + 1] in
      let value = Hashtbl.find romans c in
      match Hashtbl.find_opt detractors c with
      | Some x -> 
        let contains_x = List.exists (fun y -> y = d) x in
          if contains_x = true then
          rome (i + 2) score + Hashtbl.find romans d - value
          else
          rome (i + 1) score + value
      | _ -> rome (i + 1) score + value
  in
  rome 0 0

let () =
  let res = roman_to_int "X" in
  Printf.printf "Result: %d\n" res
