//
//  main.swift
//  LeetCode
//
//  Created by yuyuan on 2020/5/23.
//  Copyright © 2020 SP. All rights reserved.
//

import Foundation

//print(Easy01().missingNumber([0]))
//LeetCode_14().run()
/*
 ["MyLinkedList","addAtHead","addAtHead","addAtHead","addAtIndex","deleteAtIndex","addAtHead","addAtTail","get","addAtHead","addAtIndex","addAtHead"]
 [[],[7],[2],[1],[3,0],[2],[6],[4],[4],[4],[5,0],[6]]
 */
var node = MyLinkedList()
node.addAtHead(7)
node.addAtHead(2)
node.addAtHead(1)
node.addAtIndex(3, 0)
node.deleteAtIndex(2)
node.addAtHead(6)
node.addAtTail(4)
node.get(4)
node.addAtHead(4)
node.addAtIndex(5, 0)
node.addAtHead(6)
