/**
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */

function mergeKLists(lists: Array<ListNode | null>): ListNode | null {
  const dummy = new ListNode();
  let head = new ListNode();
  dummy.next = head;
  while (true) {
    let minIndex: number;
    for (let i = 0; i < lists.length; i++) {
      if (!lists[i]) {
        continue
      }
      if (minIndex === undefined || lists[i].val < lists[minIndex].val) {
        minIndex = i
      }
    }
    if (minIndex === undefined) {
      break
    }
    head.next = lists[minIndex];
    head = head.next;
    lists[minIndex] = lists[minIndex].next
  }
  return dummy?.next?.next || null
};
