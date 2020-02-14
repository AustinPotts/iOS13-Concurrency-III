//: [Previous](@previous)

import Foundation

// concurrent guranteed the order to start in but not finish
// Example 1
let queue = DispatchQueue.global()

print("I'm on the main queue")
queue.async {
    usleep(100)
    print("1. Doing stuff on the background ")
}

queue.async {
    usleep(100)
    print("2. Doing stuff on the background ")
}

print("Ive asked for things to happen on the background queue")


//Example 2
//This is a serial queue but you can add concurrent attributes
//Serial queue will always happen in the order you want
// Serial queues can only have one thing happen at a time
// sync means dont do anything until I finish 
let serialQueue = DispatchQueue(label: "MySerialQueue")

print("Start serial queue")

serialQueue.async {
    print("1. Do this first")
}

serialQueue.async {
    print("2. Do this second")
}

print("Waiting for sync")
serialQueue.sync {
    print("3. DO this third")
}

print("Finished sync")
print("4. Done")


//: [Next](@next)
