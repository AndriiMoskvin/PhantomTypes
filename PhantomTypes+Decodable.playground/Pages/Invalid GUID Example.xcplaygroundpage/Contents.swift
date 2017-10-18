//: [Previous](@previous)
/*:
 ## Demonstrates invalid GUID parsing error
 */
import Foundation

guard let jsonUrl = Bundle.main.url(forResource: "error1", withExtension: "json") else { fatalError("Missing `error1.json`") }
do {
    let data = try Data(contentsOf: jsonUrl)
    try JSONDecoder().decode(Response.self, from: data)
} catch let error {
    print("`error1.json` has",error)
}
//: [Next](@next)
