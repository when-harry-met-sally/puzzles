mergeSort :: (Ord a) => [a] -> [a]
mergeSort arr = go arr
  where
    go :: (Ord a) => [a] -> [a]
    go [] = []
    go [x] = [x]
    go arr = mergeTwoSortedArrays (mergeSort left) (mergeSort right)
      where
        mid = (length arr) `div` 2
        (left, right) = splitAt mid arr

main :: IO ()
main = print $ mergeSort [1, 9, 3, 2, 5, 4]

-- The premise of merge sort is that merging two sorted lists has a time complexity of O(n).
--
-- given two sorted lists [1, 2, 3] [3, 4, 5]
-- what is least is plucked from its array and prepended to the current list. that's it.

-- mergeTwoSortedArrays :: (Ord a) => [a] -> [a] -> [a] -> [a]
-- mergeTwoSortedArrays a [] arr2 = reverse a
-- mergeTwoSortedArrays a arr1 [] = reverse a
-- mergeTwoSortedArrays a (x : xs) (y : ys)
--   | x <= y = mergeTwoSortedArrays (x : a) xs (y : ys)
--   | otherwise = mergeTwoSortedArrays (y : a) (x : xs) (ys)

mergeTwoSortedArrays :: (Ord a) => [a] -> [a] -> [a]
mergeTwoSortedArrays [] ys = ys
mergeTwoSortedArrays xs [] = xs
mergeTwoSortedArrays (x : xs) (y : ys)
  | x <= y = x : mergeTwoSortedArrays xs (y : ys)
  | otherwise = y : mergeTwoSortedArrays (x : xs) ys

-- I struggled with this. I continue to overcomplicate these algorithms. For example, I made the subproblem of merging two sorted lists take 3 arguments. But that's not necessary.
