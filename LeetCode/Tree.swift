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