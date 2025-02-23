//
//  LeetCode.9.swift
//  LeetCode
//
//  Created by Pan on 2024/10/25.
//  Copyright © 2024 SP. All rights reserved.
//

import Foundation

class LeetCode_13: LeetCodeSolution {
    func romanToInt(_ s: String) -> Int {
        
        let dict: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]
        
        var result = 0
        var preNumber = -1
        
        for char in s {
            let curNumber = dict[char]!
            if preNumber != -1 && curNumber > preNumber {
                result = result + curNumber - preNumber - preNumber
            } else {
                result = result + curNumber
            }
            preNumber = curNumber
        }
        
        return result
    }
    
    override func url() -> String {
        return "https://leetcode.com/problems/roman-to-integer/"
    }
    
    override func main() {
    
        let testCase = "III"
        let testCase2 = "LVIII"
        let testCase3 = "MCMXCIV"

        print(romanToInt(testCase))
        print(romanToInt(testCase2))
        print(romanToInt(testCase3))
    }
}
