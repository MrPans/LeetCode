import Foundation
import ObjectiveC

class SolutionManager {
    static let shared = SolutionManager()
    
    private var solutions: [(solution: any LeetCodeBase, modificationDate: Date)] = []
    
    private init() {
        let solutionTypes = Runtime.subclasses(of: LeetCodeSolution.self)
        
        // 实例化所有解决方案并获取对应文件的修改时间
        solutions = solutionTypes.compactMap { type in
            // 获取类名
            let className = String(describing: type)
            
            // 使用 NSClassFromString 获取类，然后实例化
            guard let solutionClass = NSClassFromString("LeetCode.\(className)") as? NSObject.Type,
                  let solution = solutionClass.init() as? (any LeetCodeBase) else {
                print("Failed to instantiate: \(className)")
                return nil
            }
            
            // 获取项目目录
            let fileManager = FileManager.default
            let currentPath = fileManager.currentDirectoryPath
            let projectPath = (currentPath as NSString).appendingPathComponent("LeetCode")
            let filePath = (projectPath as NSString).appendingPathComponent("\(className).swift")
            
            // 获取文件的修改时间
            guard let attributes = try? fileManager.attributesOfItem(atPath: filePath),
                  let modificationDate = attributes[.modificationDate] as? Date else {
                // 如果找不到文件，使用当前时间
                return (solution: solution, modificationDate: Date())
            }
            
            print("Found solution: \(className)")
            return (solution: solution, modificationDate: modificationDate)
        }
        
        // 按照文件修改时间排序，最新的在最后
        solutions.sort { $0.modificationDate < $1.modificationDate }
    }
    
    func runAll() {
        for solution in solutions {
            print("\n=== Running solution for: ===")
            solution.solution.run()
        }
    }
    
    func runLatest() {
        guard let latest = solutions.last else {
            print("No solutions found")
            return
        }
        print("\n=== Running latest solution (modified at \(latest.modificationDate)): ===")
        latest.solution.run()
    }
}

// 辅助类，用于运行时反射
private class Runtime {
    static func subclasses(of baseClass: AnyClass) -> [AnyClass] {
        let count = objc_getClassList(nil, 0)
        let allClasses = UnsafeMutablePointer<AnyClass>.allocate(capacity: Int(count))
        let autoreleasingAllClasses = AutoreleasingUnsafeMutablePointer<AnyClass>(allClasses)
        let actualCount = objc_getClassList(autoreleasingAllClasses, count)
        
        var result: [AnyClass] = []
        for i in 0..<actualCount {
            let currentClass: AnyClass = allClasses[Int(i)]
            var superClass: AnyClass? = class_getSuperclass(currentClass)
            
            // 检查整个继承链，看是否继承自目标基类
            while let sc = superClass {
                if sc === baseClass {
                    result.append(currentClass)
                    break
                }
                superClass = class_getSuperclass(sc)
            }
        }
        
        allClasses.deallocate()
        return result
    }
} 
