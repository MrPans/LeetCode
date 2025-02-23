//
//  LeetCode_49.swift
//  LeetCode
//
//  Created by Pan on 2025-02-22.
//  Copyright © 2025 SP. All rights reserved.
//

import Foundation

class LeetCode_49: LeetCodeSolution {
    
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        typealias Key = [Character : Int]
        let result = strs.reduce(into: [Key: [String]]()) { partialResult, str in
            let encoded = encoding(str)
            if partialResult[encoded] == nil {
                partialResult[encoded] = [str]
            } else {
                partialResult[encoded]?.append(str)
            }
        }
        
        return Array(result.values)
    }
    
    private func encoding(_ str: String) -> [Character: Int] {
        var dict = [Character: Int]()
        str.forEach { char in
            dict[char] = (dict[char] ?? 0) + 1
        }
        return dict
    }
    
    override func url() -> String {
        return "https://leetcode.com/problems/group-anagrams"
    }
    
    override func main() {
        var strs = ["eat","tea","tan","ate","nat","bat"]
        var result = groupAnagrams(strs)
        print(result)
    }
}
