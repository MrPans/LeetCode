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

/**
 ### 205. Isomorphic Strings  
 
 Given two strings s and t, determine if they are isomorphic.
 
 Two strings are isomorphic if the characters in s can be replaced to get t.
 
 All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character but a character may map to itself.
 
 For example,
 Given "egg", "add", return true.
 
 Given "foo", "bar", return false.
 
 Given "paper", "title", return true.
 
 Note:
 You may assume both s and t have the same length.
 */
func isIsomorphic(s: String, _ t: String) -> Bool {
    if s.characters.count != t.characters.count {
        return false
    }
    
    let sCharacters = [Character](s.characters)
    let tCharacters = [Character](t.characters)
    
    var s2tMap = [Character: Character]()
    var t2sMap = [Character: Character]()
    
    for index in 0 ..< sCharacters.count {
        let characterInS = sCharacters[index]
        let characterInT = tCharacters[index]
        
        if s2tMap[characterInS] == nil && t2sMap[characterInT] == nil {
            s2tMap[characterInS] = characterInT
            t2sMap[characterInT] = characterInS
        } else if s2tMap[characterInS] != characterInT || t2sMap[characterInT] != characterInS {
            return false
        }
    }
    
    return true
}

/**
 # 344 Reverse String 
 https://leetcode.com/problems/reverse-string/
 */
func reverseString(s: String) -> String {
    if s.characters.count <= 1 {
        return s
    }
    
    let middleIndex = s.startIndex.advancedBy(s.characters.count / 2)
    let leftHalf = s.substringToIndex(middleIndex)
    let rightHalf = s.substringFromIndex(middleIndex)
    
    return reverseString(rightHalf) + reverseString(leftHalf)
    
//    return String(s.characters.reverse())
}

/**
 ## 345 Reverse Vowels of a String
 https://leetcode.com/problems/reverse-vowels-of-a-string/
 */
func reverseVowels(s: String) -> String {

    struct Stack<Element> {
        
        var container = [Element]()
        
        mutating func push(element: Element) {
            container.append(element)
        }
        
        mutating func pop() -> Element? {
            guard container.count != 0 else { return nil }
            return container.removeLast()
        }
    }
    var result = s
    let vowels = Set<Character>(["A","E","I","O","U","a","e","i","o","u"])
    var stack = Stack<Character>()
    var vowelIndexs: [String.CharacterView.Index] = []
    for index in s.startIndex ..< s.endIndex {
        let char = s.characters[index]
        if vowels.contains(char) {
            vowelIndexs.append(index)
            stack.push(char)
        }
    }
    
    for index in vowelIndexs {
        guard let char = stack.pop() else { break }
        result.replaceRange(index ..< index.successor(), with: String(char))
    }
    return result
    
}


/**
 ## 58. Length of Last Word
 https://leetcode.com/problems/length-of-last-word/
 */
func lengthOfLastWord(s: String) -> Int {
    if s == "" {
        return 0
    }
    
    let strings = s.componentsSeparatedByString(" ")
    
    for i in 0 ..< strings.count {
        let index = strings.count - 1 - i
        if strings[index] != "" {
            return strings[index].characters.count
        }
    }
    
    return 0
}

/**
 ## 242. Valid Anagram
 https://leetcode.com/problems/valid-anagram/
 */
func isAnagram(s: String, _ t: String) -> Bool {
    guard s.characters.count == t.characters.count else { return false }
    
    return s.characters.sort(<) == t.characters.sort(<)
}

/**
 14. Longest Common Prefix
 https://leetcode.com/problems/longest-common-prefix/
 just need compare the longest String and the shortest Sting.
 */
func longestCommonPrefix(strs: [String]) -> String {
    if (strs.count == 0) {
        return ""
    }
    
    let sortedStrings = strs.sort(<)
    let shortest = sortedStrings.first!.characters
    let longest = sortedStrings.last!.characters
    var i = 0
    while (i <  shortest.count && shortest[shortest.startIndex.advancedBy(i)] == longest[longest.startIndex.advancedBy(i)]) {
        i += 1
    };
    let startIndex = sortedStrings.first!.startIndex
    return sortedStrings.first![ startIndex ..< startIndex.advancedBy(i)];
}

/**
 ## 290. Word Pattern
 https://leetcode.com/problems/word-pattern/
 */
func wordPattern(pattern: String, _ str: String) -> Bool {
    if str == "" || pattern == "" {
        return false
    }
    
    let letters = [Character](pattern.characters)
    let words = str.componentsSeparatedByString(" ")
    
    if letters.count != words.count {
        return false
    }
    
    var letterMapWord = [Character : String]()
    var wordMapLetter = [String : Character]()
    
    for index in 0 ..< letters.count {
        let letter = letters[index]
        let word = words[index]
        
        let cachedWord = letterMapWord[letter]
        let cachedLetter = wordMapLetter[word]
        if cachedWord == nil && cachedLetter == nil {
            letterMapWord[letter] = word
            wordMapLetter[word] = letter
        } else if letter != cachedLetter || word != cachedWord {
            return false
        }
    }
    
    return true

}
