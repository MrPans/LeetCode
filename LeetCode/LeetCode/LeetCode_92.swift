//
//  LeetCode_92.swift
//  LeetCode
//
//  Created by Pan on 2025-02-22.
//  Copyright © 2025 SP. All rights reserved.
//

import Foundation

class LeetCode_92: LeetCodeSolution {
    
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        
        
        return nil
    }
 
    override func url() -> String {
        return "https://leetcode.com/problems/reverse-linked-list-ii/"
    }
    
    override func main() {
        // TODO: 添加测试用例
        let head = ListNode([1,2,3,4,5])
        let result = reverseBetween(head, 2, 4)
        print(result)
    }
}
