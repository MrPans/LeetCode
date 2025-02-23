//
//  TwoPointer.swift
//  LeetCode
//
//  Created by Pan on 2024/10/18.
//  Copyright © 2024 SP. All rights reserved.
//

import Foundation


class LeetCode_11: LeetCodeSolution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var maxWater = 0

        while left < right {
            let width = right - left
            let currentHeight = min(height[left], height[right])
            let water = width * currentHeight
            maxWater = max(maxWater, water)

            if height[left] < height[right] {
                left = left + 1
            } else {
                right = right - 1
            }
        }

        return maxWater
    }
    
    override func url() -> String {
        return "https://leetcode.com/problems/container-with-most-water/"
    }
    
    override func main() {
    
        let testCase = [1,8,6,2,5,4,8,3,7]
        let testCase2 = [1,1]
        
        print(maxArea(testCase))
        print(maxArea(testCase2))
    }
}
