import Foundation

public struct Response: Decodable {
    let production: Configuration
    let stage: Configuration
    
    struct Configuration: Decodable {
        struct Playlist: Decodable {
            let title: Title
            let id: GUID
        }
        let playlists: [Playlist]
        
        struct Video: Decodable {
            let title: Title
            let ids: [GUID]
        }
        let videos: [Video]
    }
}

struct GUID: Decodable {
    let value: String
    init(value: String) throws {
        guard
            let range = value.range(of: "[0123456789abcdef]{24}", options: .regularExpression),
            value[range].characters.count == value.characters.count
            else {
                struct InvalidGUID: Error { let value: String }
                throw InvalidGUID(value: value)
        }
        self.value = value
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.singleValueContainer()
        try self.init(value: values.decode(String.self))
    }
}

struct Title: Decodable {
    let value: String
    init(value: String) throws {
        guard let range = value.range(of: "[ +A-Za-z0-9]+", options: .regularExpression),
            value[range].characters.count == value.characters.count else {
                struct InvalidTitle: Error { let value: String }
                throw InvalidTitle(value: value)
        }
        self.value = value
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.singleValueContainer()
        try self.init(value: values.decode(String.self))
    }
}
