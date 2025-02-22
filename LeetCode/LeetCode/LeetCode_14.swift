//
//  LeetCode.14.swift
//  LeetCode
//
//  Created by Pan on 2024/10/25.
//  Copyright © 2024 SP. All rights reserved.
//

import Foundation

class LeetCode_14: LeetCodeSolution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var result: String? = nil
        
        for element in strs {
            guard var longestCommonPrefix = result else {
                result = element
                continue
            }
            
            if longestCommonPrefix.isEmpty {
                break
            } else {
                let maxLength = min(longestCommonPrefix.count, element.count)
                var index = 0
                while index < maxLength
                        && longestCommonPrefix[longestCommonPrefix.index(longestCommonPrefix.startIndex, offsetBy: index)] == element[element.index(element.startIndex, offsetBy: index)] {
                    index = index + 1
                }
                result = String(longestCommonPrefix[longestCommonPrefix.startIndex ..< longestCommonPrefix.index(longestCommonPrefix.startIndex, offsetBy: index)])
            }
        }
        
        return result ?? ""
    }

    override func url() -> String {
        return "https://leetcode.com/problems/longest-common-prefix/"
    }
    
    override func main() {
        let testCase3 = ["","b"]
        print(longestCommonPrefix(testCase3))
    }
}
