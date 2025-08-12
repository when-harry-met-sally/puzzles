-- We are trying to simply merge two sorted lists, since it is the subproblem required for merge sort. We will implement it recursively, one tail recursive, the other, not tail recursive.

-- Non tail recursive method
-- mergeTwoSortedList :: (Ord a) => [a] -> [a] -> [a]
-- mergeTwoSortedList [] b = b
-- mergeTwoSortedList a [] = a
-- mergeTwoSortedList (x : xs) (y : ys)
--   | x <= y = x : mergeTwoSortedList xs (y : ys)
--   | otherwise = y : mergeTwoSortedList (x : xs) ys

mergeTwoSortedList :: (Ord a) => [a] -> [a] -> [a]
mergeTwoSortedList xs ys = go xs ys []
  where
    go [] ys acc = reverse acc ++ ys
    go xs [] acc = reverse acc ++ xs
    go (x : xs) (y : ys) acc
      | x <= y = go xs (y : ys) (x : acc)
      | otherwise = go (x : xs) ys (y : acc)

main :: IO ()
main = print $ mergeTwoSortedList [1, 3, 4, 8, 9] [1, 10, 14]

-- Analysis
-- Non-Tail-Recursive Version
-- Pros:
--
-- Simplicity: The code is straightforward and easy to understand.
-- No Reversal Needed: Since it builds the result list in the correct order from the start, no additional list reversal is required.
-- Cons:
--
-- Stack Space: Not tail-recursive, which means each recursive call adds a new frame to the call stack. This can lead to stack overflow for very large lists.
-- Potential for Deep Recursion: While Haskell optimizes for lazy evaluation, deep recursion might still cause issues for very large datasets.
-- Tail-Recursive Version
-- Pros:
--
-- Constant Stack Space: Tail-recursive, meaning it can be optimized by the compiler to reuse the same stack frame, preventing stack overflow.
-- Performance: Generally, tail-recursive functions can be more performant in languages that optimize for tail recursion.
-- Cons:
--
-- Reversal Overhead: Requires reversing the accumulated list at the end, which adds O(n) time complexity for the reversal operation.
-- Complexity: Slightly more complex due to the use of an accumulator and reversing the result list.
-- Which Solution is Better?
-- Non-Tail-Recursive Version:
--
-- Use When: The lists are not excessively large, and simplicity and readability are more important. This version is easy to understand and maintain, making it a good choice for most practical applications where the input size is manageable.
-- Tail-Recursive Version:
--
-- Use When: You expect to handle very large lists where deep recursion might be an issue. Tail recursion can prevent stack overflow by reusing the stack frame. However, keep in mind the overhead of reversing the list at the end.
-- Overall Recommendation
-- For most practical purposes, the non-tail-recursive version is sufficient and simpler to work with. However, if you are dealing with very large lists and are concerned about stack overflow, the tail-recursive version would be more appropriate despite the additional complexity of reversing the list.
--
-- References
-- Haskell Tail Recursion: Tail Recursion in Haskell
-- Recursive vs Tail-Recursive: Comparison of Recursion Techniques
