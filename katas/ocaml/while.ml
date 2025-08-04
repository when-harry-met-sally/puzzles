let i = ref 0 in
while !i < 5 do
  print_endline ("i = " ^ string_of_int !i);
  i := !i + 1
done
