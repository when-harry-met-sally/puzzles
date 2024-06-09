class ListNode {
  val: number
  next: ListNode | null
  constructor(val?: number, next?: ListNode | null) {
    this.val = (val === undefined ? 0 : val)
    this.next = (next === undefined ? null : next)
  }
}

// Initial thought is we are going to need to go through the entire list, you'll need to store values in memory
function isPalindrome(head: ListNode | null): boolean {
  const vals = [];
  while (head) {
    vals.push(head.val)
    head = head.next;
  }
  for (let i = 0; i < Math.floor(vals.length / 2); i++) {
    if (vals[i] !== vals[vals.length - 1 - i]) {
      return false;
    }
  }
  return true;
};

const arrToLinkedList = (arr: number[]) => {
  let prev = null;
  const reverse = arr.reverse();
  for (const r of reverse) {
    const l = new ListNode(r, prev)
    prev = l
  }
  return prev;
}

const l = arrToLinkedList([2, 1, 2, 1, 2])
console.log(isPalindrome(l))
