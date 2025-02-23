//
//  LeetCode_21.swift
//  LeetCode
//
//  Created by Pan on 2025-02-22.
//  Copyright © 2025 SP. All rights reserved.
//

import Foundation

// 如果 Basic.swift 在同一个模块中，不需要额外的导入
// 如果在不同模块，需要导入对应的模块

class LeetCode_21: LeetCodeSolution {
    
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        
        var cur_l1 = list1
        var cur_l2 = list2
        // pick the smallest head
        let dummy: ListNode? = ListNode(-1)
        var cur = dummy
        while cur_l1 != nil || cur_l2 != nil {
            if let let_cur_l1 = cur_l1,
               let let_cur_l2 = cur_l2 {
                if let_cur_l1.val > let_cur_l2.val {
                    cur?.next = cur_l2
                    cur_l2 = cur_l2?.next
                } else {
                    cur?.next = cur_l1
                    cur_l1 = cur_l1?.next
                }
            } else if cur_l1 != nil {
                cur?.next = cur_l1
                cur_l1 = cur_l1?.next
            } else if cur_l2 != nil {
                cur?.next = cur_l2
                cur_l2 = cur_l2?.next
            } else {
                break
            }
            cur = cur?.next
        }
        
        return dummy?.next
    }
    
    override func url() -> String {
        return "https://leetcode.com/problems/merge-two-sorted-lists/"
    }
    
    override func main() {
        let list1 = [Int]()
        let list2 = [0]
        var result = mergeTwoLists(ListNode(list1), ListNode(list2))
        print(result)
    }
}
