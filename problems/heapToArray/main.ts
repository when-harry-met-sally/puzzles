
import { TreeNode, buildTreeFromArray } from '@shared/trees';

function heapToArray(root: TreeNode | null): (number | null)[] {
  if (!root) return [];  // Handle an empty heap.

  const array: (number | null)[] = [];
  const queue: (TreeNode | null)[] = [root];  // Initialize the queue with the root node.

  while (queue.length > 0) {
    const currentNode = queue.shift();  // Dequeue the front node.
    if (currentNode === null) continue;  // Skip null nodes.

    array.push(currentNode.val);  // Record the node's value.

    // Enqueue child nodes (including nulls to maintain structure if needed).
    queue.push(currentNode.left);
    queue.push(currentNode.right);
  }

  // Remove trailing nulls that don't represent children.
  while (array[array.length - 1] === null) {
    array.pop();
  }

  return array;
}

const tree = [2, 3, null]
const res = heapToArray(buildTreeFromArray(tree))
console.log(res)


// I thought originally that we needed to handle the case in which left or right was absent, we would add null to the que (which is already handled).
