//
//  BinaryTree.swift
//  LeetCode
//
//  Created by Pan on 16/7/20.
//  Copyright © 2016年 shengpan. All rights reserved.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

/**
 144. Binary Tree Preorder Traversal
 https://leetcode.com/problems/binary-tree-preorder-traversal/
 */
func preorderTraversal(root: TreeNode?) -> [Int] {
    if root == nil {
        return []
    }
    
    var result = [Int]()
    result.append(root!.val)
    result.appendContentsOf(preorderTraversal(root!.left))
    result.appendContentsOf(preorderTraversal(root!.right))
    return result
}

/**
 ## 145. Binary Tree Postorder Traversal
 https://leetcode.com/problems/binary-tree-postorder-traversal/
 */
func postorderTraversal(root: TreeNode?) -> [Int] {
    if root == nil {
        return []
    }
    
    var result = [Int]()
    result.appendContentsOf(postorderTraversal(root!.left))
    result.appendContentsOf(postorderTraversal(root!.right))
    result.append(root!.val)
    return result
}

/**
 ## 100. Same Tree
 https://leetcode.com/problems/same-tree/
 */
func isSameTree(p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil {
        return true
    } else if (p == nil && q != nil )
        || (p != nil && q == nil) {
        return false
    }
    
    let sameValue = p!.val == q!.val
    let sameLeft = isSameTree(p!.left, q!.left)
    let sameRight = isSameTree(p!.right, q!.right)
    
    return sameValue && sameLeft && sameRight
}

/**
 ## 101 Symmetric Tree
 https://leetcode.com/problems/symmetric-tree/
 */
func isSymmetric(root: TreeNode?) -> Bool {
    if root == nil {
        return true
    }
    return isSy(root!.left, right: root!.right)
}

private func isSy(left: TreeNode?, right: TreeNode?) -> Bool {
    if left == nil && right == nil {
        return true
    }
    if left == nil || right == nil || left!.val != right!.val {
        return false
    }
    
    return isSy(left!.left, right: right!.right) && isSy(left!.right, right: right!.left)
}

/**
 ## 226. Invert Binary Tree
 https://leetcode.com/problems/invert-binary-tree/
 */
func invertTree(root: TreeNode?) -> TreeNode? {
    if root?.left == nil && root?.right == nil {
        return root
    }
    let invertedLeft = invertTree(root?.left)
    let invertedRight = invertTree(root?.right)
    root?.left = invertedRight
    root?.right = invertedLeft
    return root
}


/**
 ## 111. Minimum Depth of Binary Tree
  https://leetcode.com/problems/minimum-depth-of-binary-tree/
 */
func minDepth(root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    return minDep(root)
}

private func minDep(root: TreeNode?) -> Int {
    guard let root = root else { return Int.max }
    if root.left == nil && root.right == nil {
        return 1
    }
    return min(minDep(root.left), minDep(root.right)) + 1
}

/**
 104. Maximum Depth of Binary Tree
 https://leetcode.com/problems/maximum-depth-of-binary-tree/
 */
func maxDepth(root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    return maxDep(root)
}

private func maxDep(root: TreeNode?) -> Int {
    guard let root = root else { return Int.min }
    if root.left == nil && root.right == nil {
        return 1
    }
    return max(maxDep(root.left), maxDep(root.right)) + 1
}


func isBalanced(root: TreeNode?) -> Bool {
    
}


