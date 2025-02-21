//
//  Node.swift
//  LeetCode
//
//  Created by Pan on 2025-02-21.
//  Copyright 2025 SP. All rights reserved.
//

import Foundation


public class Node<T> {
    
    public var val: T
    public var prev: Node?
    public var next: Node?

    
    public init(_ value: T) {
        self.val = value
    }
    
    public init?(array: [T]) {
        guard !array.isEmpty else {
            return nil
        }
        val = array[0]
        var cur = self
        for index in 1 ..< array.count {
            let newNode = Node(array[index])
            cur.next = newNode
            newNode.prev = cur
            cur = newNode
        }
    }
    
    public func get(_ index: Int) -> Node<T>? {
        guard index >= 0 else { return nil }
        var curIndex = 0
        var result: Node = self
        while curIndex < index && result.next != nil {
            result = result.next!
        }
        
        if curIndex != index {
            return nil
        } else {
            return result
        }
    }
    
    public func insertHead(_ node: Node<T>) {
        var head = Node(self.val)
        self.val = node.val
        head.prev = self
        head.next = self.next
        self.next = head
    }
    
    public func append(_ node: Node<T>) {
        // Fix memory leak - check for cycle
        var current = self
        while current.next != nil {
            current = current.next!
            if current === node {
                return // Prevent cycle
            }
        }
        current.next = node
        node.prev = current
    }
   
    public func removeFirst() {
        guard let next = self.next else {
            return
        }
        
        self.val = next.val
        self.next = next.next
        self.next?.prev = self // Fix missing previous pointer update
    }
    
    public func removeLast() {
        // Handle edge case when there's only one node
        guard self.next != nil else {
            return
        }
        
        var lastNode = self
        while lastNode.next != nil {
            lastNode = lastNode.next!
        }
        
        let previous = lastNode.prev
        previous?.next = nil
        lastNode.prev = nil
    }
    
    public func insert(_ node: Node<T>, at index: Int) {
        // Validate index
        guard index >= 0 else {
            return
        }
        
        if index == 0 {
            insertHead(node)
            return
        }
        
        var destinationNode = self
        var currentIndex = 0
        
        while currentIndex < index && destinationNode.next != nil {
            destinationNode = destinationNode.next!
            currentIndex += 1
        }
        
        let previous = destinationNode.prev
        previous?.next = node
        node.prev = previous
        
        node.next = destinationNode
        destinationNode.prev = node
    }
    
    public func remove(at index: Int) {
        // Validate index
        guard index >= 0 else {
            return
        }
        
        // Can't remove head node this way
        guard index != 0 else {
            removeFirst()
            return
        }
        
        var destinationNode = self
        var currentIndex = 0
        
        while currentIndex < index && destinationNode.next != nil {
            destinationNode = destinationNode.next!
            currentIndex += 1
        }
        
        // Check if we actually reached the requested index
        guard currentIndex == index else {
            return
        }
        
        let previous = destinationNode.prev
        let next = destinationNode.next
        
        previous?.next = next
        next?.prev = previous
    }
    
}

extension Node: CustomStringConvertible {
    
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




class MyLinkedList {
    
    public var val: Int
    public var prev: MyLinkedList?
    public var next: MyLinkedList?

    init() {
        val = NSNotFound
    }
    
    func get(_ index: Int) -> Int {
       guard index >= 0 else { return -1 }
        var curIndex = 0
        var result: MyLinkedList = self
        while curIndex < index && result.next != nil {
            result = result.next!
            curIndex += 1
        }
        
        if curIndex != index {
            print(-1)
            return -1
        } else {
            print(result.val)
            return result.val
        }
    }
    
    func addAtHead(_ val: Int) {
        
        guard self.val != NSNotFound
        else {
            self.val = val
            return
        }
        
        var head = MyLinkedList()
        head.val = self.val
        self.val = val
        head.prev = self
        head.next = self.next
        self.next = head
        print(self)
    }
    
    func addAtTail(_ val: Int) {
        var current = self
        var newNode = MyLinkedList()
        newNode.val = val
        while current.next != nil {
            current = current.next!
        }
        current.next = newNode
        newNode.prev = current
        print(self)

    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        guard index >= 0 else {
            return
        }
        
        if index == 0 {
            addAtHead(val)
            return
        }
        
        var destinationNode: MyLinkedList? = self
        for _ in 0 ..< index - 1 {
            destinationNode = destinationNode?.next
        }
        
        var node = MyLinkedList()
        node.val = val
        
        let previous = destinationNode.prev
        previous?.next = node
        node.prev = previous
        
        node.next = destinationNode
        destinationNode.prev = node
        print(self)
    }
    
    func deleteAtIndex(_ index: Int) {
         // Validate index
        guard index >= 0 else {
            return
        }
        
        // Can't remove head node this way
        guard index != 0 else {
            removeFirst()
            return
        }
        
        var destinationNode = self
        var currentIndex = 0
        
        while currentIndex < index && destinationNode.next != nil {
            destinationNode = destinationNode.next!
            currentIndex += 1
        }
        
        // Check if we actually reached the requested index
        guard currentIndex == index else {
            return
        }
        
        let previous = destinationNode.prev
        let next = destinationNode.next
        
        previous?.next = next
        next?.prev = previous
        print(self)
    }

    func removeFirst() {
         guard let next = self.next else {
            return
        }
        
        self.val = next.val
        self.next = next.next
        self.next?.prev = self
        print(self)
    }
}

extension MyLinkedList: CustomStringConvertible {
    
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


/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */
