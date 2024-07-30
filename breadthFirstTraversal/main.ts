import { TreeNode, buildTreeFromArray } from '@shared/trees';

const breadth = (head: TreeNode) => {
  const vals: number[] = [];
  const queue = [head];

  while (queue.length) {
    const h = queue.shift() // I originally had a pop, but that would be a stack, this is a queue.
    vals.push(h.val)
    if (h.left) {
      queue.push(h.left)
    }
    if (h.right) {
      queue.push(h.right)
    }
  }
  return vals;
}

const tree = [2, 4, 8, 9, 10]
const res = breadth(buildTreeFromArray(tree))
console.log(res)

