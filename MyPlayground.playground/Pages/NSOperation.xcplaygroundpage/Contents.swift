//: [Previous](@previous)

import Foundation




let queue = OperationQueue()

queue.name = "MyOperationQueue"


let downloadJSON = BlockOperation {
    sleep(1)
    print("1. Download JSON")
}

let processJSON = BlockOperation {
    sleep(1)
    print("2. Process JSON ")
}

let downloadImageJSON = BlockOperation {
    sleep(1)
    print("3. Download Image ")
}

let getWeather = BlockOperation {
    sleep(1)
    print("4. Get Weather ")
}


class MyHeartRateOperation: Operation {
    
    private var deviceName: String
    init(deviceName: String) {
        self.deviceName = deviceName
    }
    
    override func main() {
        sleep(1)
        print("5. Get heart rate data from bluetooth \(deviceName)")
    }
}

let heartRate = MyHeartRateOperation(deviceName: "Polar H11")

processJSON.addDependency(downloadJSON)
downloadImageJSON.addDependency(processJSON)

print("Start operation")

queue.addOperations([downloadJSON, processJSON, downloadImageJSON, getWeather], waitUntilFinished: true)
//True = if true the current thread is blocked until operations have finsihed

// It will never have more than 2 operations running at once
//queue.maxConcurrentOperationCount = 2 // You can make this 1 which will be a Serial Queue

print("Finished playground")

//: [Next](@next)
