//: [Previous](@previous)

import Foundation



// Atomic vs Non-Atomic
// Atomic whatever value will be returned doesnt mean it will be correct. One thread can access at a time
// Non-Atomic not guranteed a return of a valid value. It could be 2 threads changing the value at the same time



class Atomic<Value> {
    
    private var value: Value
    private let q = DispatchQueue(label: "Atomic <\(Value.self)>")
    
    init(value: Value) {
        self.value = value
    }
    
    func modify(modifier: (Value) -> Value) {
        q.sync {
            value = modifier(value)
        }
        
        
    }
    
    // NOTE: Never call sync in an async block! Make sure to check if you're coming from an async block 
    
    func get() -> Value {
        q.sync {
             value
        }
        
    }
    
}

let sharedValue = Atomic(value: 40)

// Modify on background queue
DispatchQueue.concurrentPerform(iterations: 100) { (threadNumber) in
    sharedValue.modify(modifier: { $0 + 1 })
}


print("Final Value: \(sharedValue.get())")

//: [Next](@next)
