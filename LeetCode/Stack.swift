//
//  Stack.swift
//  LeetCode
//
//  Created by Pan on 16/7/20.
//  Copyright © 2016年 shengpan. All rights reserved.
//

import Foundation

struct Stack<Element> {
    
    private var container = [Element]()
    
    var topElement: Element? {
        get {
            return container.last
        }
    }
    
    mutating func push(element: Element) {
        container.append(element)
    }
    
    mutating func pop() -> Element? {
        guard container.count != 0 else { return nil }
        return container.removeLast()
    }
    
    func isEmpty() -> Bool {
        return container.count == 0
    }
}



/**
 ## 20. Valid Parentheses
 https://leetcode.com/problems/valid-parentheses/
 */
func isValid(s: String) -> Bool {
    
    enum Brace: Character {
        case LP = "("
        case RP = ")"
        case LB = "["
        case RB = "]"
        case LBR = "{"
        case RBR = "}"
    }
    
    
    var stack = Stack<Brace>()
    for char in s.characters {
        let brace = Brace(rawValue: char)
        guard let br = brace else { return false }
        
        switch br {
        case .LP,.LB,.LBR:
            stack.push(br)
        case .RP,.RB,.RBR:
            guard let top = stack.topElement else  { return false }
            if (br == .RP && top == .LP)
                || (br == .RB && top == .LB)
                || (br == .RBR && top == .LBR) {
                stack.pop()
            } else {
                return false
            }
        }
    }
    return stack.isEmpty()
}

/**
 ## 150. Evaluate Reverse Polish Notation
 https://leetcode.com/problems/evaluate-reverse-polish-notation/
 */
func evalRPN(tokens: [String]) -> Int {
    enum Operator: String {
        case Add = "+"
        case Subtract = "-"
        case Multiply = "*"
        case Divide = "/"
    }
    
    var stack = Stack<Int>()
    
    for element in tokens {
        // if it's an operator
        if let op = Operator(rawValue: element) {
            let rightNumber = stack.pop()
            if rightNumber == nil {
                continue
            }
            
            let leftNumber = stack.pop()
            if leftNumber == nil {
                stack.push(rightNumber!)
                continue
            }
            
            var result = 0
            switch op {
            case .Add:
                result = leftNumber! + rightNumber!
            case .Subtract:
                result = leftNumber! - rightNumber!
            case .Divide:
                result = leftNumber! / rightNumber!
            case .Multiply:
                result = leftNumber! * rightNumber!
            }
            stack.push(result)

        } else {
            if let number = Int(element) {
                stack.push(number)
            } else {
                // input type error
                return 0;
            }
        }
    }
    
    return stack.topElement ?? 0
    
}




