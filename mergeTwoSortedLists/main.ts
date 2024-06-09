class ListNode {
  val: number
  next: ListNode | null
  constructor(val?: number, next?: ListNode | null) {
    this.val = (val === undefined ? 0 : val)
    this.next = (next === undefined ? null : next)
  }
}

function mergeTwoLists(list1: ListNode | null, list2: ListNode | null): ListNode | null {
  let head = list1;
  let prev2 = null;
  while (list1) {
    if (list1.val <= list2.val) {
      const next = list1.next;
      list1.next = list2
      if (prev2) {
        prev2.next = list1
      }
      list1 = next;
    } else {
      if (list2.next && list1.val > list2.next.val) {
        list2 = list2.next
      } else {
        // list1 > list2 but less than list2.next
        if (prev2) {
          prev2.next = list1
        }
        const next1 = list1.next;
        list1.next = list2.next
        list2.next = list1
        list1 = next1;
      }
    }
  }
  return head;
}

const a = [1, 3, 5]
const b = [2, 4, 6, 7, 8]

// 1 v 3
// a.next = b

// const a = [6, 7]
// const b = [1, 3, 5, 8] // a = a.next

// 6 v 1
// 6 > 1.next

// ...

// 6 v 5
// 6 > 5, > 8
// b.next = a.
// a.next = b.next
// a = a.next



const arrToLinkedList = (arr: number[]) => {
  let prev = null;
  const reverse = arr.reverse();
  for (const r of reverse) {
    const l = new ListNode(r, prev)
    prev = l
  }
  return prev;
}


const logList = (a: ListNode) => {
  const arr: any[] = []
  while (a) {
    arr.push(a.val)
    a = a.next;
  }
  console.log(arr)
}

const al = arrToLinkedList(a)
const bl = arrToLinkedList(b)
const cl = mergeTwoLists(al, bl)

// logList(al)
// logList(bl)
logList(cl)

// const a = [1, 4, 7]
// const b = [3, 5, 6]

// 1 vs 3
// 1.next = 3

// [4, 7]
// [1, 3, 5 6]
// 4 vs 3
// 3.next = 4, 4.ext = 3.next
// 7
// 1, 3, 4, 5, 6


function mergeTwoLists(list1: ListNode | null, list2: ListNode | null): ListNode | null {
  if (!list1) return list2;
  if (!list2) return list1;

  // Ensure that list1 starts with the smaller element
  if (list1.val > list2.val) [list1, list2] = [list2, list1];

  // Save the head of the new list
  let head = list1;

  while (list1 !== null && list2 !== null) {
    // Temp pointer for manipulation
    let tmp = null;
    while (list1 !== null && list1.val <= list2.val) {
      tmp = list1;  // Last node of list1 before a node of list2 needs to be inserted
      list1 = list1.next;
    }
    // Link the last smaller node of list1 to current node of list2
    tmp.next = list2;

    // Swap list1 and list2
    [list1, list2] = [list2, list1];
  }

  return head;
}
