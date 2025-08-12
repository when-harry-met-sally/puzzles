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

function isBalanced(root: TreeNode | null): boolean {
  if (!root) {
    return true
  } else {

  }
  return traverse(root) === -1 ? false : true
};

function traverse(node: TreeNode | null, h = 1) {
  if (node !== null) {
    const hl = traverse(node.left, h + 1)
    const hr = traverse(node.right, h + 1)
    if (hl === -1 || hr === -1 || Math.abs(hl - hr) > 1) {
      return -1;
    }
    return hl > hr ? hl : hr;
  } else {
    return h - 1
  }
};
