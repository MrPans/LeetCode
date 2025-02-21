//
//  LeetCodeTests.swift
//  LeetCodeTests
//
//  Created by Pan on 2025-02-21.
//  Copyright 2025 SP. All rights reserved.
//

import Testing
import Foundation
@testable import LeetCode

struct LeetCodeTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
    
    @Test func testInit() throws {
//        LeetCode.Node(2)
//        let node = LeetCode.Node(1)
//        #expect(node.value as? Int == 1)
//        #expect(node.next == nil)
//        #expect(node.previous == nil)
    }

}

//final class NodeTests {
//    
//    // Test initialization

//    
//    // Test append
//    @Test func testAppend() throws {
//        let node1 = Node(1)
//        let node2 = Node(2)
//        
//        node1.append(node2)
//        #expect(node1.next?.value as? Int == 2)
//        #expect(node2.previous?.value as? Int == 1)
//    }
//    
//    // Test cycle prevention
//    @Test func testAppendCyclePrevention() throws {
//        let node1 = Node(1)
//        let node2 = Node(2)
//        
//        node1.append(node2)
//        node2.append(node1) // This should be prevented
//        
//        // Verify no cycle was created
//        var current = node1
//        var visited = Set<ObjectIdentifier>()
//        
//        while let next = current.next {
//            let id = ObjectIdentifier(next)
//            #expect(!visited.contains(id))
//            visited.insert(id)
//            current = next
//        }
//    }
//    
//    // Test removeFirst
//    @Test func testRemoveFirst() throws {
//        let node1 = Node(1)
//        let node2 = Node(2)
//        let node3 = Node(3)
//        
//        node1.append(node2)
//        node1.append(node3)
//        
//        node1.removeFirst()
//        #expect(node1.value as? Int == 2)
//        #expect(node1.next?.value as? Int == 3)
//        #expect(node1.next?.previous?.value as? Int == 2)
//    }
//    
//    // Test removeLast
//    @Test func testRemoveLast() throws {
//        let node1 = Node(1)
//        let node2 = Node(2)
//        let node3 = Node(3)
//        
//        node1.append(node2)
//        node1.append(node3)
//        
//        node1.removeLast()
//        #expect(node1.next?.value as? Int == 2)
//        #expect(node1.next?.next == nil)
//    }
//    
//    // Test removeLast with single node
//    @Test func testRemoveLastSingleNode() throws {
//        let node = Node(1)
//        node.removeLast()
//        #expect(node.value as? Int == 1)
//        #expect(node.next == nil)
//        #expect(node.previous == nil)
//    }
//    
//    // Test insert
//    @Test func testInsert() throws {
//        let node1 = Node(1)
//        let node2 = Node(2)
//        let node3 = Node(3)
//        let nodeToInsert = Node(4)
//        
//        node1.append(node2)
//        node1.append(node3)
//        
//        node1.insert(nodeToInsert, at: 1)
//        #expect(node1.next?.value as? Int == 4)
//        #expect(node1.next?.next?.value as? Int == 2)
//        #expect(nodeToInsert.previous?.value as? Int == 1)
//        #expect(nodeToInsert.next?.value as? Int == 2)
//    }
//    
//    // Test insert with invalid index
//    @Test func testInsertInvalidIndex() throws {
//        let node1 = Node(1)
//        let nodeToInsert = Node(2)
//        
//        node1.insert(nodeToInsert, at: -1)
//        #expect(node1.next == nil)
//        #expect(node1.previous == nil)
//    }
//    
//    // Test remove at index
//    @Test func testRemoveAtIndex() throws {
//        let node1 = Node(1)
//        let node2 = Node(2)
//        let node3 = Node(3)
//        
//        node1.append(node2)
//        node1.append(node3)
//        
//        node1.remove(at: 1)
//        #expect(node1.next?.value as? Int == 3)
//        #expect(node1.next?.previous?.value as? Int == 1)
//    }
//    
//    // Test remove with invalid index
//    @Test func testRemoveInvalidIndex() throws {
//        let node1 = Node(1)
//        let node2 = Node(2)
//        
//        node1.append(node2)
//        
//        node1.remove(at: -1)
//        #expect(node1.next?.value as? Int == 2)
//        
//        node1.remove(at: 5)
//        #expect(node1.next?.value as? Int == 2)
//    }
//    
//    // Test description
//    @Test func testDescription() throws {
//        let node1 = Node(1)
//        let node2 = Node(2)
//        let node3 = Node(3)
//        
//        node1.append(node2)
//        node1.append(node3)
//        
//        #expect(node1.description == "1 -> 2 -> 3")
//    }
//}
//
//// End of file. No additional code.
