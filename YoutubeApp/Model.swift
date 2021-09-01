//
//  Model.swift
//  YoutubeApp
//
//  Created by максим  кондратьев  on 01.09.2021.
//

import Foundation

class Model {
    
    func getVideos() {
        //create URL object
        guard let url = URL(string: Constants.API_URL) else {
            print("Error")
            return }
        
        //Get a dataTask from URLSession
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            guard let  data = data   else {
                print("ERROR")
                 return
                
            }
            print("\(String(describing: String(data: data, encoding: .utf8)))")
            print("FULL URL is \(Constants.API_URL)")
            
            //Parse data into video obj
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
               let response = try  decoder.decode(Response.self, from: data)
                dump(response) 
            }
            catch {
                
            }
            
            
        }
        task.resume()
        
    }
}
