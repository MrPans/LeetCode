//
//  LeetCode_20.swift
//  LeetCode
//
//  Created by Pan on 2025-02-22.
//  Copyright © 2025 SP. All rights reserved.
//

import Foundation

class LeetCode_20: LeetCodeSolution {
    
    func isValid(_ s: String) -> Bool {
        guard !s.isEmpty else { return false }
        
        var stack = [Character]()
        var isInvaild = false
        
        
        s.forEach { char in
            if char == "{"
                || char == "("
                || char == "[" {
                stack.append(char)
            } else if (char == "}" && stack.last == "{"
                       || char == ")" && stack.last == "("
                       || char == "]" && stack.last == "[") {
                _   = stack.popLast()
            } else {
                // other case is invaild
                isInvaild = true
            }
        }
        return stack.isEmpty && !isInvaild
    }
    
    override func url() -> String {
        return "https://leetcode.com/problems/valid-parentheses/"
    }
    
    override func main() {
        var testCase = "()((()))"
        var result = isValid(testCase)
        print(result)
    }
}
