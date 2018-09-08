//: # Single Responsibility Principle

import Foundation

class Journal: CustomStringConvertible {
    
    var entries = [String]()
    var count = 0
    
    func addEntry(_ text: String) -> Int {
        count += 1
        entries.append("\(count): \(text)")
        return count - 1
    }
    
    func removeEntry(_ index: Int) {
        entries.remove(at: index)
    }
    
    var description: String {
        return entries.joined(separator: "\n")
    }
    
}
/*:
 
 ## Adding these to the Journal class would break the Single Responsibility Principle
 ````
 func save(_ filename: String, _ overwrite: Bool = false) {
    // Save to file
 }
 
 func load(_ filename: String) {
    // Load from file
 }
 ````
 */

//: ## Instead, have this functionality in its own class:

class Persistence {
    
    func save(_ journal: Journal, _ filename: String, _ overwrite: Bool = false) {
        // Save to file
    }
    
}

func main() {
    let j = Journal()
    let _ = j.addEntry("I learned Swift today.")
    let bug = j.addEntry("My new program had a bug in it.")
    print(j)
    
    j.removeEntry(bug)
    print("===")
    print(j)
}


//: [Next](@next)
