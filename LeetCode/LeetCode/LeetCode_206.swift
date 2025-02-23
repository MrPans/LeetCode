//
//  LeetCode_206.swift
//  LeetCode
//
//  Created by Pan on 2025-02-22.
//  Copyright © 2025 SP. All rights reserved.
//

import Foundation

class LeetCode_206: LeetCodeSolution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let last = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return last
    }
//    func reverseList(_ head: ListNode?) -> ListNode? {
//        var array = [Int]()
//        var cur = head
//        while cur != nil {
//            array.insert(cur!.val, at: 0)
//            cur = cur?.next
//        }
//        return createListNodeFromArray(array)
//    }
//    
//    private func createListNodeFromArray(_ array: [Int]) -> ListNode? {
//        guard !array.isEmpty else {
//            return nil
//        }
//        let head = ListNode(array[0])
//        var cur = head
//        for index in 1 ..< array.count {
//            let newNode = ListNode(array[index])
//            cur.next = newNode
//            cur = newNode
//        }
//        return head
//    }

    override func url() -> String {
        return "https://leetcode.com/problems/reverse-linked-list/"
    }
    
    override func main() {
        var result = reverseList(ListNode([1,2,3,4,5]))
        print(result)
    }
}
