//
//  LeetCode_242.swift
//  LeetCode
//
//  Created by Pan on 2025-02-22.
//  Copyright © 2025 SP. All rights reserved.
//


import Foundation

class LeetCode_242 {
    
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var dict = [Character: Int]()
        s.forEach { char in
            let times = dict[char] ?? 0
            dict[char] = times + 1
        }
        
        for (_, element) in t.enumerated() {
            guard var count = dict[element], count > 0 else {
                return false
            }
            
            count -= 1
            if count == 0 {
                dict[element] = nil
            } else {
                dict[element] = count
            }
        }
        
        return dict.isEmpty
    }
}

extension LeetCode_242: LeetCodeBase {
    
    func url() -> String {
        return "https://leetcode.com/problems/valid-anagram/"
    }
    
    func main() {
        var s = "cat"
        var t = "car"
        var result = isAnagram(s, t)
        print(result)
    }
}
