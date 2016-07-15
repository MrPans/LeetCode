//
//  String.swift
//  LeetCode
//
//  Created by Pan on 16/7/14.
//  Copyright © 2016年 shengpan. All rights reserved.
//

import Foundation

/**
 ## 38. Count and Say
 
 - see https://leetcode.com/problems/count-and-say/
 */
func countAndSay(n: Int) -> String {
    if n == 0 {
        return ""
    }
    if n == 1 {
        return "1"
    }
    
    let predecessor = countAndSay(n - 1)
    
    var preChars = [Character](predecessor.characters)
    
    var count = 1
    var result = ""
    
    for index in  0 ..< preChars.count {
        if index == preChars.count - 1 {
            result.appendContentsOf("\(count)\(preChars[index])")
            continue
        }
        
        if preChars[index] == preChars[index + 1] {
            count += 1
        } else {
            result.appendContentsOf("\(count)\(preChars[index])")
            count = 1
        }
    }
    
    return result
}


/**
 ## 28. Implement strStr()
 https://leetcode.com/problems/implement-strstr/
 
 Primary idea: Use Range 
 Time Complexity: O(n), Space Complexity: O(n)
 */
func strStr(haystack: String, _ needle: String) -> Int {
    if needle == "" {
        return 0;
    }
    
    if !haystack.containsString(needle) {
        return -1
    }
    
    let needleCount = needle.characters.count
    var endIndex = haystack.endIndex
    for _ in 0 ..< needleCount {
        endIndex = endIndex.predecessor()
    }
    for index in haystack.startIndex ... endIndex {
        var ei = index
        for _ in 0 ..< needleCount {
            ei = ei.successor()
        }
        let range = index ..< ei
        let subString = haystack.substringWithRange(range)
        
        if subString == needle {
            return haystack.startIndex.distanceTo(index)
        }
    }
    
    return -1
}
