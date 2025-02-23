//
//  LeetCode.9.swift
//  LeetCode
//
//  Created by Pan on 2024/10/25.
//  Copyright © 2024 SP. All rights reserved.
//

import Foundation

class LeetCode_12: LeetCodeSolution {
    func intToRoman(_ num: Int) -> String {

        let dict: [Int: String] = [
            1: "I",
            2: "II",
            3: "III",
            4: "IV",
            5: "V",
            6: "VI",
            7: "VII",
            8: "VIII",
            9: "IX",
            10: "X",
            40: "XL",
            50: "L",
            90: "XC",
            100: "C",
            400: "CD",
            500: "D",
            900: "CM",
            1000: "M"
        ]
        
        var result = ""
        var curNum = num
        
        for key in dict.keys.sorted(by: >) {
            let count = curNum / key
            if count > 0 {
                let romanChar = dict[key]!
                for _ in 0..<count {
                    result.append(romanChar)
                }
                curNum = curNum % (key * count)
            }
        }
        
        return result
    }

    override func url() -> String {
        return "https://leetcode.com/problems/integer-to-roman/"
    }
    
   override func main() {
    
        let testCase = 3749
        let testCase2 = 58
        let testCase3 = 1994

        print(intToRoman(testCase))
        print(intToRoman(testCase2))
        print(intToRoman(testCase3))
    }
}
