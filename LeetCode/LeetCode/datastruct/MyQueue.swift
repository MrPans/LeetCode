//
//  LeetCode_232.swift
//  LeetCode
//
//  Created by Pan on 2025-02-22.
//  Copyright © 2025 SP. All rights reserved.
//

import Foundation
// @see https://leetcode.com/problems/implement-queue-using-stacks/

class MyQueue {

    var pushStack = Stack()
    var popStack = Stack()
    
    
    init() {
        
    }
    
    func push(_ x: Int) {
        for _ in 0 ..< popStack.size() {
            pushStack.push(popStack.pop())
        }
        pushStack.push(x)
    }
    
    func pop() -> Int {
        for _ in 0 ..< pushStack.size() {
            popStack.push(pushStack.pop())
        }
        return popStack.pop()
    }
    
    func peek() -> Int {
        for _ in 0 ..< pushStack.size() {
            popStack.push(pushStack.pop())
        }
        return popStack.peek()
    }
    
    func empty() -> Bool {
        return pushStack.empty() && popStack.empty()
    }
}

class Stack {
    
    private var underlying: [Int] = []
    
    func push(_ x: Int) {
        self.underlying.append(x)
    }
    
    func pop() -> Int {
        return self.underlying.popLast() ?? -1
    }
    
    func peek() -> Int {
        self.underlying.last ?? -1
    }
    
    func empty() -> Bool {
        return underlying.isEmpty
    }
    
    func size() -> Int {
        return underlying.count
    }
}
