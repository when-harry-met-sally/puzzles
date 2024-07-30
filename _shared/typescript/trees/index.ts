export class TreeNode {
  val: number
  left: TreeNode | null
  right: TreeNode | null
  constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
    this.val = (val === undefined ? 0 : val)
    this.left = (left === undefined ? null : left)
    this.right = (right === undefined ? null : right)
  }
}


export class TreeNodeWithParent {
  val: number
  left: TreeNodeWithParent | null
  right: TreeNodeWithParent | null
  parent: TreeNodeWithParent | null
  constructor(val?: number, left?: TreeNodeWithParent | null, right?: TreeNodeWithParent, parent?: TreeNodeWithParent | null) {
    this.val = (val === undefined ? 0 : val)
    this.left = (left === undefined ? null : left)
    this.right = (right === undefined ? null : right)
    this.parent = (parent === undefined ? null : parent)
  }
}

export function buildTreeFromArray(arr: (number | null)[]): TreeNode | null {
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
