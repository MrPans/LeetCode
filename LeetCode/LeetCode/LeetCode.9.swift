//
//  LeetCode.9.swift
//  LeetCode
//
//  Created by Pan on 2024/10/25.
//  Copyright © 2024 SP. All rights reserved.
//

import Foundation

class LeetCode_9_PalindromeNumber {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        
        let original = x
        var x = x
        var reverse: Int = 0
        
        while x / 10 > 0 {
            let remainder = x % 10
            reverse = reverse * 10 + remainder
            x = x / 10
        }
        reverse = reverse * 10 + x
        
        return reverse == original
        
    }
}

extension LeetCode_9_PalindromeNumber: LeetCodeBase {
    
    func url() -> String {
        return "https://leetcode.com/problems/palindrome-number/"
    }
    
    func main() {
    
        let testCase = 121
        let testCase2 = -121
        let testCase3 = 10

        print(isPalindrome(testCase))
        print(isPalindrome(testCase2))
        print(isPalindrome(testCase3))
    }
}
