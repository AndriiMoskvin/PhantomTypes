//: [Previous](@previous)
/*:
 ## Demonstrates invalid Title parsing error
 */
import Foundation

guard let jsonUrl = Bundle.main.url(forResource: "error2", withExtension: "json") else { fatalError("Missing `error2.json`") }
do {
    let data = try Data(contentsOf: jsonUrl)
    try JSONDecoder().decode(Response.self, from: data)
} catch let error {
    print("`error2.json` has",error)
}
