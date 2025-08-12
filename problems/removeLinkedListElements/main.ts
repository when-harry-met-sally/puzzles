class ListNode {
  val: number
  next: ListNode | null
  constructor(val?: number, next?: ListNode | null) {
    this.val = (val === undefined ? 0 : val)
    this.next = (next === undefined ? null : next)
  }
}


function removeElements(head: ListNode | null, val: number): ListNode | null {
  let first = null;
  let prev = null;
  while (head) {
    if (head.val === val) {
      if (prev) {
        prev.next = head.next;
      }
    } else {
      if (!first) {
        first = head;
      }
      prev = head
    }
    head = head.next;
  }
  return first;
};
