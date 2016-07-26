//
//  DP.swift
//  LeetCode
//
//  Created by Pan on 16/7/24.
//  Copyright © 2016年 shengpan. All rights reserved.
//

import Foundation

/**
 70. Climbing Stairs
 https://leetcode.com/problems/climbing-stairs/
 */
func climbStairs(n: Int) -> Int {
    var a = 1
    var b = 1
    for _ in 0..<n {
        (a, b) = (b, a + b)
    }
    return a
}