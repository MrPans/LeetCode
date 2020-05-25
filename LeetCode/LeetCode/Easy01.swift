//
//  Easy01.swift
//  LeetCode
//
//  Created by yuyuan on 2020/5/24.
//  Copyright © 2020 SP. All rights reserved.
//

import Foundation

class Easy01 {
    /// https://leetcode-cn.com/problems/two-sum/
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        typealias Number = Int
        typealias Index = Int
        var map = [Number: Index]()
        for (index, element) in nums.enumerated() {
            let complement = target - element
            if let compIndex = map[complement] {
                return [compIndex, index]
            } else {
                map[element] = index
            }
        }
        return [Int]()
    }
    
    /// https://leetcode-cn.com/problems/two-sum-ii-input-array-is-sorted/
    func twoSum2(_ numbers: [Int], _ target: Int) -> [Int] {
        var leading = 0
        var trailing = numbers.count - 1
        while leading < trailing {
            if numbers[leading] + numbers[trailing] > target {
                trailing -= 1
            } else if numbers[leading] + numbers[trailing] < target {
                leading += 1
            } else {
                return [leading + 1, trailing + 1]
            }
        }
        return [Int]()
    }
    
    /// https://leetcode-cn.com/problems/que-shi-de-shu-zi-lcof/
    func missingNumber(_ nums: [Int]) -> Int {
        var leading = 0
        var traling = nums.count - 1
        
        while leading <= traling {
            let m = (traling + leading) / 2
            if nums[m] == m {
                leading = m + 1
            } else {
                traling = m - 1
            }
        }
        return leading
    }
}
