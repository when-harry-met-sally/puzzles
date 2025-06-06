class MinHeap {
  private heap: number[] = [];

  private swap(i: number, j: number) {
    [this.heap[i], this.heap[j]] = [this.heap[j], this.heap[i]];
  }

  private parent(i: number) { return Math.floor((i - 1) / 2); }
  private left(i: number) { return 2 * i + 1; }
  private right(i: number) { return 2 * i + 2; }

  insert(val: number) {
    this.heap.push(val);
    this.bubbleUp();
  }

  private bubbleUp() {
    let i = this.heap.length - 1;
    while (i > 0 && this.heap[i] < this.heap[this.parent(i)]) {
      this.swap(i, this.parent(i));
      i = this.parent(i);
    }
  }

  extractMin(): number | undefined {
    if (this.heap.length === 0) return undefined;
    if (this.heap.length === 1) return this.heap.pop();

    const min = this.heap[0];
    this.heap[0] = this.heap.pop()!;
    this.bubbleDown(0);
    return min;
  }

  private bubbleDown(i: number) {
    const left = this.left(i);
    const right = this.right(i);
    let smallest = i;

    if (left < this.heap.length && this.heap[left] < this.heap[smallest]) {
      smallest = left;
    }
    if (right < this.heap.length && this.heap[right] < this.heap[smallest]) {
      smallest = right;
    }

    if (smallest !== i) {
      this.swap(i, smallest);
      this.bubbleDown(smallest);
    }
  }

  peek(): number | undefined {
    return this.heap[0];
  }

  size(): number {
    return this.heap.length;
  }
}
function minOperations(nums: number[], k: number, r = 0) {
  const heap = new MinHeap();
  for (const num of nums) {
    heap.insert(num)
  }


  while (true) {
    console.log(heap);
    const minA = heap.extractMin();
    const minB = heap.extractMin();
    console.log(minA, minB)
    if (minA >= k) {
      return r;
    }
    r++
    const n = minA * 2 + minB
    console.log('n', n)
    heap.insert(n)
  }
};


// Input: nums = [2,11,10,1,3], k = 10
// [1,1,2,4,9], k = 20
// Output: 2
const res = minOperations([1, 1, 2, 4, 9], 20);
console.log('----------');
console.log(res)
