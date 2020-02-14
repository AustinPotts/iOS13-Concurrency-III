//: [Previous](@previous)

import Foundation



let urls = [
    URL(string: "https://swapi.co/api/people/1/")!,
    URL(string: "https://swapi.co/api/people/2/")!,
    URL(string: "https://swapi.co/api/people/3/")!,
    URL(string: "https://swapi.co/api/people/4/")!
]

let peopleGroupe = DispatchGroup()
let networkGroup = DispatchGroup()


for personURL in urls {
    peopleGroupe.enter()
    networkGroup.enter()
    
    let task = URLSession.shared.dataTask(with: personURL) { (data, _, _) in
        print("Got data for \(personURL): \(String(describing: data))")
        peopleGroupe.leave()
        networkGroup.leave()
    }
    task.resume()
}


peopleGroupe.notify(queue: .main) {
    print("All people are done ")
}

networkGroup.notify(queue: .main) {
    print("Everything complete")
}


//: [Next](@next)
