//
//  Base.swift
//  LeetCode
//
//  Created by Pan on 2024/10/18.
//  Copyright © 2024 SP. All rights reserved.
//

import Foundation

protocol Solution {
    func run()
    func main()
    func sayHello()
}

extension Solution where Self: LeetCodeDescription {
    
    func run() {
        sayHello()
        main()
    }
    
    func sayHello() {
        print("start run leetcode solution for:")
        print(url())
    }
}

protocol LeetCodeDescription {
    func url() -> String
}

typealias LeetCodeBase = Solution & LeetCodeDescription
