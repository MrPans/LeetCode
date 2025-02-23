//
//  Basic.swift
//  LeetCode
//
//  Created by Pan on 2025-02-22.
//  Copyright © 2025 SP. All rights reserved.
//

import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    public init?(_ array: [Int]) {
        guard !array.isEmpty else {
            return nil
        }
        val = array[0]
        var cur = self
        for index in 1 ..< array.count {
            let newNode = ListNode(array[index])
            cur.next = newNode
            cur = newNode
        }
    }
}

extension ListNode: CustomStringConvertible {
    
    public var description: String {
        var text = "\(val)"
        var current = next
        
        while current != nil {
            text += " -> \(current!.val)"
            current = current?.next
        }
        
        return text
    }
}

