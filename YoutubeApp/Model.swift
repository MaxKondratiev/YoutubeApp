//
//  Model.swift
//  YoutubeApp
//
//  Created by максим  кондратьев  on 01.09.2021.
//

import Foundation

// MARK:  1-Creating protocol

protocol ModelDelegateProtocol {
    func videoFetch(_ videos: [Video])
}
class Model {
    
    // MARK:  2-Instance of protocol
    var delegate: ModelDelegateProtocol? 
    
    func getVideos() {
        //create URL object
        guard let url = URL(string: Constants.API_URL) else {
            print("Error1")
            return }
        
        //Get a dataTask from URLSession
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            guard let  data = data   else {
                print("ERROR2")
                return
            }
            //print("\(String(describing: String(data: data, encoding: .utf8)))")
            print("FULL URL is \(Constants.API_URL)")
            
            //Parse data into video obj
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data)
                if response.itemsArray != nil {
                // MARK:  5-Call the "videoFetched" method of delegate
                    DispatchQueue.main.async {
                        self.delegate?.videoFetch(response.itemsArray!)
                    }
                   
                }
            }
            catch {
                
            }
            
            
        }
        task.resume()
        
    }
}
