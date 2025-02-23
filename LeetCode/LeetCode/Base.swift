//
//  Base.swift
//  LeetCode
//
//  Created by Pan on 2024/10/18.
//  Copyright © 2024 SP. All rights reserved.
//

import Foundation

@objc protocol Solution: NSObjectProtocol {
    func run()
    func main()
    func sayHello()
}

@objc protocol LeetCodeDescription: NSObjectProtocol {
    func url() -> String
}

typealias LeetCodeBase = Solution & LeetCodeDescription
