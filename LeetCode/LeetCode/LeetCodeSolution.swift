import Foundation

class LeetCodeSolution: NSObject, Solution, LeetCodeDescription {
    
    @objc func run() {
        sayHello()
        main()
    }
    
    @objc func sayHello() {
        print("start run leetcode solution for:")
        print(url())
    }
    
    @objc func url() -> String {
        fatalError("Must override url()")
    }
    
    @objc func main() {
        fatalError("Must override main()")
    }
} 
