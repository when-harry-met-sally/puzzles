function invertTree(root: TreeNode | null): TreeNode | null {
  flipIt(root);
  return root;
};

function flipIt(root: TreeNode | null) {
  if (root !== null) {
    flipIt(root.left)
    flipIt(root.right)
    const left = root.left;
    const temp = root.right;
    root.right = left;
    root.left = temp;
  }
}


