//
//  LinkList.swift
//  LeetCode
//
//  Created by Pan on 16/7/19.
//  Copyright © 2016年 shengpan. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


func reverseList(head: ListNode?) -> ListNode? {
    
    if head == nil || head!.next == nil {
        return head
    }
    
    var pre = head
    var head = head!.next
    pre!.next = nil
    
    while head != nil {
        let temp = head
        head = head!.next
        temp!.next = pre
        pre = temp
    }
    return pre
}

func isCircle(head: ListNode?) -> Bool {
    var fastNode = head
    var slowNode = head
    
    while fastNode != nil {
        fastNode = fastNode?.next?.next
        slowNode = slowNode?.next
        if fastNode === slowNode {
            return true
        }
    }
    return false
}

/**
 ## 203. Remove Linked List Element
 https://leetcode.com/problems/remove-linked-list-elements/
 */
func removeElements(head: ListNode?, _ val: Int) -> ListNode? {
    let fake = ListNode(0)
    fake.next = head
    
    var pre = fake
    var cur = head
    
    while cur != nil {
        if cur!.val == val {
            cur = cur!.next
        } else {
            pre.next = cur
            pre = cur!
            cur = cur!.next
        }
    }
    pre.next = nil
    
    return fake.next
}