let x = ref 0 := !x + 1 (* mutate: increment by 1 *) Printf.printf "%d\n" !x


(* Mutable array *)
let arr = [| 1; 2; 3 |]   (* array literal *)
arr.(1) <- 99             (* mutate index 1 *)
Printf.printf "%d\n" arr.(1)

(* Loop *)
for i = 0 to 5 do
  Printf.printf "i = %d\n" i
done

for i = 5 downto 0 do
  Printf.printf "i = %d\n" i
done


(* While *)


let i = ref 0 in
while !i <= 5 do
  Printf.printf "i = %d\n" !i;
  incr i     (* shorthand for i := !i + 1 *)
done
