//
//  CacheManager.swift
//  YoutubeApp
//
//  Created by максим  кондратьев  on 01.09.2021.
//

import Foundation

class CacheManager {
    
    static var cacheDictionary = [String:Data]()
    
    static func setVideoCache(_ url: String,_ data: Data?) {
        
        //we use url as key
        cacheDictionary[url] = data
    
    }
    static func getVideoCache(_ url:String)-> Data? {
        //try to get data for specified url
        print(cacheDictionary)
        return cacheDictionary[url]
    }
}
