I have never balanced a binary tree, or really created one. I've only traversed them.

The issue I think the typical traversal route will have is that you will continously go left or right, unless you keep track of your node/depth somehow.

I am going to ask chatGPT, because I'm at at a loss.

```javascript
function sortedArrayToBST(nums) {
    if (!nums.length) return null;

    function buildBST(left, right) {
        if (left > right) return null; // Base case: no elements to form a subtree

        // Select middle element to minimize the max depth of the tree
        let mid = Math.floor((left + right) / 2);
        let node = new TreeNode(nums[mid]);

        // Recursively build the left and right subtrees
        node.left = buildBST(left, mid - 1);
        node.right = buildBST(mid + 1, right);

        return node;
    }

    return buildBST(0, nums.length - 1);
}```

This is essentially binary search, but with a twist.
