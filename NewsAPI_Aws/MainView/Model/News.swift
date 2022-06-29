

import Foundation


struct NewsList: Codable {
    var articles: [Article]
}

struct Article: Codable {
    
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: URL?
    let urlToImage: URL?
    let publishedAt: String?
    
    
}

struct Source: Codable {
    let id: String?
    let name: String?
}
