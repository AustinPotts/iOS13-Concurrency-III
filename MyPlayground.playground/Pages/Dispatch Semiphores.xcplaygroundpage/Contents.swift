//: [Previous](@previous)

import Foundation



func download(url: URL) -> Data? {
    var data: Data?
    
    let semiphore = DispatchSemaphore(value: 0)
    URLSession.shared.dataTask(with: url) { (possibleData, _, _) in
        data = possibleData
        print("Got some data.. about to signal ")
        semiphore.signal() // Grab this data then signal when we do. Wait until we have this
    }.resume()
    
    print("Going to wait ")
    semiphore.wait() // Dont do anything until we have the signal
    print("We have waited ")
    return data // Will not call until we have our Signal
}

print("about to wait for a person to download ")

let url = URL(string: "")!
if let myData = download(url: url) {
    print("Download: \(myData)")
} else {
    print("Error no data")
}

print("Person has finished")




// Example Final

let semaphore = DispatchSemaphore(value: 5) // Value is saying you can do whatever you have to do 5 times, anything after that you have to wait, I only have a finite number of resources = 5

print("Waiting 1:")
semaphore.wait()

print("Waiting 2:")
semaphore.wait()

print("Waiting 3:")
semaphore.wait()

print("Waiting 4:")
semaphore.wait()

print("Waiting 5:")
semaphore.wait()

print("Waiting 6:")
semaphore.wait() // Will not keep going until a signal() is given


print("Finished")
//: [Next](@next)
