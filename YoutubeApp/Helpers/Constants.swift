//
//  Constants.swift
//  YoutubeApp
//
//  Created by максим  кондратьев  on 01.09.2021.
//

import Foundation

struct Constants {
    static var API_KEY = "AIzaSyCXsNil_YyhsI7ZgaI5dhPFGUUOymNS9cE"
    static var PLAYLIST_ID = "UUXlCPCsB09ftBA5bQfiSWoQ"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(PLAYLIST_ID)&key=\(API_KEY)"
   static var  YOUTUBE_URL = "https://www.youtube.com/embed/"
    
}
