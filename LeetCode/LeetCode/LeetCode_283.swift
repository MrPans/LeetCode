//
//  LeetCode.283.swift
//  LeetCode
//
//  Created by Pan on 2025-02-22.
//  Copyright © 2025 SP. All rights reserved.
//

import Foundation

class LeetCode_283: LeetCodeSolution {
    
    func moveZeroes(_ nums: inout [Int]) {
        
        let index = removeAll(0, in: &nums)
        
        for i in index ..< nums.count {
            nums[i] = 0
        }
    }
    
    
    func removeAll(_ value: Int, in nums: inout [Int]) -> Int {
        var slow = 0
        var fast = 0
        
        while fast < nums.count {
            if (nums[fast] != value) {
                nums[slow] = nums[fast]
                slow += 1
            }
            fast += 1
        }
        return slow
    }
    
    override func url() -> String {
        return "https://leetcode.com/problems/move-zeroes"
    }
    
    override func main() {
        var testCase3 = [0,1,0,3,12]
        moveZeroes(&testCase3)
        print(testCase3)
    }
}
