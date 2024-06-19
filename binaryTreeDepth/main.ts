class TreeNode {
  val: number
  left: TreeNode | null
  right: TreeNode | null
  constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
    this.val = (val === undefined ? 0 : val)
    this.left = (left === undefined ? null : left)
    this.right = (right === undefined ? null : right)
  }
}


function buildTreeFromArray(arr: (number | null)[]): TreeNode | null {
  if (arr.length === 0 || arr[0] === null) {
    return null;
  }

  let root = new TreeNode(arr[0]!);
  let queue: (TreeNode | null)[] = [root];
  let i = 1;

  while (i < arr.length) {
    let current = queue.shift();

    if (current !== null) {
      if (arr[i] !== null) {
        current.left = new TreeNode(arr[i]!);
        queue.push(current.left);
      }
      i++;

      if (i < arr.length && arr[i] !== null) {
        current.right = new TreeNode(arr[i]!);
        queue.push(current.right);
      }
      i++;
    }
  }

  return root;
}

// Example usage
const arr = [1, 2, 3, 4, 5]


  ;
const tree = buildTreeFromArray(arr);


console.log(tree);

function inorderTraversal(node: TreeNode | null, depth = 1) {
  if (node === null) {
    return depth - 1
  } else {
    const l = inorderTraversal(node.left, depth + 1);
    const r = inorderTraversal(node.right, depth + 1);
    return l > r ? l : r;
  }
}


function maxDepth(root: TreeNode | null): number {
  return inorderTraversal(tree) || 0;
};

console.log(maxDepth(buildTreeFromArray[0]))
