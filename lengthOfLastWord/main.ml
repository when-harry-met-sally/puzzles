let alphabet = "abcdefg..." in
let lengthOfLastWord (word: string) =
  let rec _lengthOfLastWord i lastAlphanumericalIndex = 
    if i = 0 then
      lastAlphanumericalIndex + 1
    else
      let c = String.get word i in
      let isAlphabetical = match (String.index_opt alphabet c)  with
      | Some _ -> true
      | None -> false in
      if isAlphabetical = true then 
        if lastAlphanumericalIndex = -1 then
          _lengthOfLastWord (i -1) i
        else 
          _lengthOfLastWord (i -1) lastAlphanumericalIndex
      else 
        if lastAlphanumericalIndex = -1 then
          _lengthOfLastWord (i -1) lastAlphanumericalIndex
        else 
          lastAlphanumericalIndex - i


let alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

let lengthOfLastWord word =
  let rec _lengthOfLastWord i lastAlphanumericalIndex =
    if i < 0 then  (* Adjust to handle when i is below 0 *)
      if lastAlphanumericalIndex = -1 then 0
      else String.length word - lastAlphanumericalIndex - 1
    else
      let c = String.get word i in
      let isAlphabetical = match String.index_opt alphabet c with
      | Some _ -> true
      | None -> false in
      if isAlphabetical then
        _lengthOfLastWord (i - 1) lastAlphanumericalIndex
      else
        if lastAlphanumericalIndex = -1 then
          _lengthOfLastWord (i - 1) lastAlphanumericalIndex
        else
          lastAlphanumericalIndex - i - 1  (* Correct the length calculation *)

  _lengthOfLastWord (String.length word - 1) (-1)

(* Example usage *)
let () =
  let result = lengthOfLastWord "Hello world  " in
  Printf.printf "Length of last word: %d\n" result
