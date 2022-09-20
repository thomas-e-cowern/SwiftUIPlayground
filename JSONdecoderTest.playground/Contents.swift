import SwiftUI
import Foundation

let json = """
{
    "type: "featuredImage",
    "rating": 4,
    "isVisible": true
}
"""

struct JSON: Decodable {
    
    private struct CodingKeys: CodingKey {
        var stringValue: String
        
        init?(stringValue: String) {
            <#code#>
        }
        
        var intValue: Int?
        
        init?(intValue: Int) {
            <#code#>
        }
        
        
    }
    
    init(from decoder: Decoder) throws {
        
    }
}
