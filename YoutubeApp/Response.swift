//
//  Response.swift
//  YoutubeApp
//
//  Created by максим  кондратьев  on 01.09.2021.
//

import Foundation

struct Response: Decodable {
    
    var itemsArray : [Video]?
    
    enum CodingKeys: String,CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.itemsArray = try container.decode([Video].self, forKey: .items)
        
    }


}

