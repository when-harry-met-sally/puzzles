class ListNode {
  val: number
  next: ListNode | null
  constructor(val?: number, next?: ListNode | null) {
    this.val = (val === undefined ? 0 : val)
    this.next = (next === undefined ? null : next)
  }
}

const logList = (a: ListNode) => {
  const arr: any[] = []
  while (a) {
    arr.push(a.val)
    a = a.next;
  }
  console.log(arr)
}

const arrToLinkedList = (arr: number[]) => {
  let prev = null;
  const reverse = arr.reverse();
  for (const r of reverse) {
    const l = new ListNode(r, prev)
    prev = l
  }
  return prev;
}
function reverseList(head: ListNode | null): ListNode | null {
  let prev = null;
  while (head) {
    const next = head.next;
    head.next = prev;
    prev = head;
    head = next
  }
  return prev;
};

const l = arrToLinkedList([1, 2, 3, 4])

logList(reverseList(l))
