
import { TreeNodeWithParent } from '@shared/trees';


// Implementation without array.
export class Heap {
  root: TreeNodeWithParent;
  last: TreeNodeWithParent;

  constructor() {
    this.root = null;
    this.last = null;
  }

  peek = () => {
    return this.root;
  }

  insert = (val: number) => {
    let cur = new TreeNodeWithParent(val, null, null, null)
    if (!this.root) {
      this.root = cur;
      this.last = cur;
      return;
    }
    let parent = this.last;
    cur.parent = parent;
    if (!parent.left) {
      parent.left = cur;
    } else {
      parent.right = cur
    }
    this.last = cur;
    this.heapifyUp(this.last)
  }

  heapifyUp = (cur: TreeNodeWithParent) => {
    let parent = cur.parent;
    while (parent && cur.val < parent.val) {
      const temp = parent.val;
      parent.val = cur.val;
      cur.val = temp;

      cur = parent
    }
  }

  // orphan = (node: TreeNodeWithParent) => {
  //
  // }

  heapifyDown = (cur: TreeNodeWithParent) => {
    let smallest = cur;

    if (cur.left && cur.left.val < smallest.val) {
      smallest = cur.left;
    }
    if (cur.right && cur.right.val < smallest.val) {
      smallest = cur.right;
    }

    if (smallest !== cur) {
      const temp = cur.val;
      cur.val = smallest.val;
      smallest.val = temp;
      this.heapifyDown(smallest)
    }
  }

  delete = (node: TreeNodeWithParent) => {
    if (this.last === node) {
      this.last = node.parent;
      if (node.parent.right === node) {
        node.parent.right = null;
      } else {
        node.parent.left = null;
      }
      return
    } else {
      node.val = this.last.val;
      this.delete(this.last)
    }

  }
}

// Fetching last node.
// An array representation, the last node is the last entry in teh array. For a tree, we need to breadth first traverse 

// Insert
// 
// if lastNode.let === null
// last.left = new;
// else, last.right = new;
// while new < new.parent, 
// parent.val = new, 

// HeapifyUp
// HeapifyDown
