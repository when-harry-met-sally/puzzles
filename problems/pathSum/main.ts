/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     val: number
 *     left: TreeNode | null
 *     right: TreeNode | null
 *     constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.left = (left===undefined ? null : left)
 *         this.right = (right===undefined ? null : right)
 *     }
 * }
 */

function hasPathSum(root: TreeNode | null, targetSum: number): boolean {
  if (!root) {
    return false
  }
  return traverse(root, targetSum, 0) || false
};

const traverse = (root: TreeNode | null, targetSum: number, sum: number) => {
  if (root !== null) {
    const s = sum + root.val
    if (s === targetSum) {
      if (!root.left && !root.right) {
        return true
      }
    }
    const lr = traverse(root.left, targetSum, s)
    const rr = traverse(root.right, targetSum, s);
    return lr || rr
  }
}
