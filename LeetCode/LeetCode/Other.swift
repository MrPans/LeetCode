//
//  Other.swift
//  LeetCode
//
//  Created by Pan on 2024/10/25.
//  Copyright © 2024 SP. All rights reserved.
//

import Foundation

class LeetCode_7_ReverseInteger {
    func reverse(_ x: Int) -> Int {
        var isNegative = x < 0
        var temp = isNegative ? -x : x
        var tail: Int = 0
        var result = 0
        while temp / 10 != 0 {
            tail = temp % 10
            temp = temp / 10
            result = result * 10 + tail
        }
        
        if result > Int((Int32.max - Int32(tail)) / 10) {
            return 0
        }
        result = result * 10 + temp
        return isNegative ? -result : result
    }
}

extension LeetCode_7_ReverseInteger: LeetCodeBase {
    
    func url() -> String {
        return "https://leetcode.com/problems/reverse-integer/"
    }
    
    func main() {
    
        let testCase = 123
        let testCase2 = -123
        let testCase3 = 120
        
        print(reverse(testCase))
        print(reverse(testCase2))
        print(reverse(testCase3))
    }
}
