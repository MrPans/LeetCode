//
//  Summary Ranges.swift
//  LeetCode
//
//  Created by Pan on 16/7/12.
//  Copyright © 2016年 shengpan. All rights reserved.
//

import Foundation

/**
 ## 228. Summary Ranges
 
 Given a sorted integer array without duplicates, return the summary of its ranges.
 
 For example, given `[0,1,2,4,5,7]`, return `["0->2","4->5","7"]`.
 
 */

// TODO:
func summaryRanges(nums: [Int]) -> [String] {
    return []
}

/**
 ## 349. Intersection of Two Arrays
 Given two arrays, write a function to compute their intersection.
 
 Example:
  - Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2].
 
 Note:
  - Each element in the result must be unique.
  - The result can be in any order.
 */

func intersection(nums1: [Int], nums2: [Int]) -> [Int] {
    let set1 = Set(nums1)
    let set2 = Set(nums2)
    return Array(set1.intersect(set2))
}


/**
 ## 350. Intersection of Two Arrays II
 Given two arrays, write a function to compute their intersection.
 
 Example:
 Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2, 2].
 
 Note:
 Each element in the result should appear as many times as it shows in both arrays.
 The result can be in any order.
 */
func intersect(nums1: [Int], nums2: [Int]) -> [Int] {
    if nums1.count == 0 || nums2.count == 0 {
        return []
    }
    
    let sortedNums1 = nums1.sort(<)
    let sortedNums2 = nums2.sort(<)
    
    var point1 = 0
    var point2 = 0
    
    var result = [Int]()
    while (point1 < sortedNums1.count && point2 < sortedNums2.count) {
        if sortedNums1[point1] < sortedNums2[point2] {
            point1 += 1
        } else if sortedNums1[point1] > sortedNums2[point2] {
            point2 += 1
        } else {
            result.append(sortedNums1[point1])
            point1 += 1
            point2 += 1
        }
    }
    return result
}

/**
 ## 217. Contains Duplicate
 
    Given an array of integers, find if the array contains any duplicates. Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.
 */
func containsDuplicate(nums: [Int]) -> Bool {
    return nums.count > Set(nums).count
}

/**
 ## 283. Move Zeroes
 
    Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
 
    For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].
 
 - Note:
    You must do this **in-place** without making a copy of the array.
    Minimize the total number of operations.
 */
func moveZeroes(inout nums: [Int]) {
    var zeroCount:Int = 0
    
    for index in 0..<nums.count {
        if nums[index] == 0 {
            zeroCount += 1
            continue
        }
        swap(&nums, index, index - zeroCount)
    }
}

func swap(inout nums: [Int], _ p:Int , _ q:Int) {
    if p <= (nums.count - 1) && q <= (nums.count - 1) {
        let num:Int = nums[q]
        nums[q] = nums[p]
        nums[p] = num
    }

}

/**
 ## 189. Rotate Array
 Rotate an array of n elements to the right by k steps.
 
 For example, with n = 7 and k = 3, the array [1,2,3,4,5,6,7] is rotated to [5,6,7,1,2,3,4].
 
 Note:
 Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.
 */
func rotate(inout nums: [Int], _ k: Int) {
    let moveRange = 0 ..< nums.count - (k % nums.count)
    let waitingInsertNums = nums[moveRange]
    nums.removeRange(moveRange)
    nums.appendContentsOf(waitingInsertNums)
}

/**
 54. Spiral Matrix 
 https://leetcode.com/problems/spiral-matrix/
 */
func spiralOrder(matrix: [[Int]]) -> [Int] {
    var res = [Int]()
    
    guard matrix.count != 0 else {
        return res
    }
    
    var startX = 0
    var endX = matrix.count - 1
    var startY = 0
    var endY = matrix[0].count - 1
    
    while true {
        // top
        for i in startY ... endY {
            res.append(matrix[startX][i])
        }
        startX += 1
        if startX > endX {
            break
        }
        
        // right
        for i in startX ... endX {
            res.append(matrix[i][endY])
        }
        endY -= 1
        if startY > endY {
            break
        }
        
        // bottom
        for i in endY.stride(through: startY, by: -1) {
            res.append(matrix[endX][i])
        }
        endX -= 1
        if startX > endX {
            break
        }
        
        // left
        for i in endX.stride(through: startX, by: -1) {
            res.append(matrix[i][startY])
        }
        startY += 1
        if startY > endY {
            break
        }
    }
    return res
}