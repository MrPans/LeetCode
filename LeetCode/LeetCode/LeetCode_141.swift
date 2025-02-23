//
//  LeetCode_141.swift
//  LeetCode
//
//  Created by pan on 2025-02-23
//  Copyright © 2025 SP. All rights reserved.
//

import Foundation

class LeetCode_141: LeetCodeSolution {
    func hasCycle(_ head: ListNode?) -> Bool  {
        var slow = head
        var fast = head
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
            if slow === fast {
                return true
            }
        }
        
        return false
    }
    
    override func url() -> String {
        return "https://leetcode.com/problems/linked-list-cycle/"
    }
    
    override func main() {
        // Test cases from LeetCode:
        let testCase0 = ListNode([3,2,0,-4])
        let result0 = hasCycle(testCase0)
        print(result0)
        
        let testCase1 = ListNode([1])
        let result1 = hasCycle(testCase1)
        print(result1)
        
        
    }
}
