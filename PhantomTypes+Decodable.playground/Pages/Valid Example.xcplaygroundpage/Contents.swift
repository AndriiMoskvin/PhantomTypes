/*:
 ## Demonstrates valid example parsing
 */
import Foundation

guard let jsonUrl = Bundle.main.url(forResource: "success", withExtension: "json") else { fatalError("Missing `success.json`") }
do {
    let data = try Data(contentsOf: jsonUrl)
    try JSONDecoder().decode(Response.self, from: data)
} catch let error {
    print(error)
}
//: [Next](@next)
