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
 ["MyLinkedList","addAtHead","addAtTail","addAtIndex","get","deleteAtIndex","get","get","deleteAtIndex","deleteAtIndex","get","deleteAtIndex","get"]
 [[],[1],[3],[1,2],[1],[1],[1],[3],[3],[0],[0],[0],[0]]

 */
var node = MyLinkedList()
node.addAtHead(1)
node.addAtTail(3)
node.addAtIndex(1, 2)
node.get(1)
node.deleteAtIndex(1)
node.get(1)
node.get(3)
node.deleteAtIndex(3)
node.deleteAtIndex(0)
node.get(0)
node.deleteAtIndex(0)
node.get(0)

