//
//  File.swift
//  LeetCode
//
//  Created by yuyuan on 2020/5/24.
//  Copyright © 2020 SP. All rights reserved.
//

import Foundation

//struct Stack<Element> {
//    
//    private var store = [Element]()
//    
//    mutating func push(_ element: Element) {
//        store.append(element)
//    }
//    
//    mutating func pop() -> Element? {
//        return store.popLast()
//    }
//    
//    var isEmpty: Bool {
//        return store.isEmpty
//    }
//}
//
//
//class Solution {
//        
//    func calculate(_ s: String) -> Int {
//        let opts = s.reduce([MathOperation]()) { (result, char) -> [MathOperation] in
//            if let op = MathOperation(char) {
//                var temp = result
//                switch op {
//                case .number(let n):
//                    if let last = temp.popLast() {
//                        switch last {
//                        case .number(let m):
//                            let newNumber = 10 * m + n
//                            temp.append(MathOperation.number(newNumber))
//                        default:
//                            temp.append(last)
//                            temp.append(op)
//                        }
//                    } else {
//                        temp.append(op)
//                    }
//                default: temp.append(op)
//                }
//                return temp
//            } else {
//                return result
//            }
//        }
//        let result = calculate(ops: opts, index: 0)
//        return result.1
//    }
//    
//    typealias Index = Int
//    typealias Sum = Int
//    private func calculate(ops: [MathOperation], index: Int) -> (Index, Sum) {
//        guard index < ops.count else { return (0, 0) }
//        
//        var currentIndex = index
//        var currentOpt: MathOperation? = nil
//        var currentSum = 0
//        while currentIndex < ops.count {
//            let op = ops[currentIndex]
//            switch op {
//            case .openParen:
//                let result = calculate(ops: ops, index: currentIndex+1)
//                if result.0 != 0 || result.1 != 0 {
//                    currentIndex = result.0
//                    if let opt = currentOpt {
//                        switch opt {
//                        case .plus:
//                            currentSum += result.1
//                            currentOpt = nil
//                        case .subtract:
//                            currentSum -= result.1
//                            currentOpt = nil
//                        default: currentSum = result.1
//                        }
//                    } else {
//                        currentSum = result.1
//                    }
//                } else {
//                    // 越界了， break
//                    currentIndex = Int.max
//                }
//            case .closeParen:
//                return (currentIndex + 1, currentSum)
//            case .plus:
//                currentOpt = op
//                currentIndex += 1
//            case .subtract:
//                currentOpt = op
//                currentIndex += 1
//            case .number(let n):
//                if let opt = currentOpt {
//                    switch opt {
//                    case .plus:
//                        currentSum += n
//                        currentOpt = nil
//                    case .subtract:
//                        currentSum -= n
//                        currentOpt = nil
//                    default: currentSum = n
//                    }
//                } else {
//                    currentSum = n
//                }
//                currentIndex += 1
//            }
//        }
//        return (currentIndex, currentSum)
//    }
//    
//}
