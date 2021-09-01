//
//  Video.swift
//  YoutubeApp
//
//  Created by максим  кондратьев  on 01.09.2021.
//

import Foundation


struct Video: Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        case videoId
        case published = "publishedAt"
        case description
        case title
        case thumbnail = "url"
        
        //  nested objects
        case snippet
        case thumbnails
        case high
        case resourceId
        
        }
    
    init(from decoder: Decoder) throws {
       let container = try decoder.container(keyedBy: CodingKeys.self)
        let snippetContainer = try  container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        self.published = try snippetContainer.decode(Date.self,forKey: .published)
        
        //Parse nested thumbnail
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        //Parse nested in ...
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        // One more nested obj to get "videoId"
        let resourceContainer = try highContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        self.videoId = try resourceContainer.decode(String.self, forKey: .videoId)
         
    }
}
