//
//  VideoCell.swift
//  YoutubeApp
//
//  Created by максим  кондратьев  on 01.09.2021.
//

import UIKit

class VideoCell: UITableViewCell {

    
    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video : Video?
    
    func setCell(_ videoObj: Video) {
        
        self.video = videoObj
        self.titleLabel.text = videoObj.title
        
        //dateFormatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        self.dateLabel.text = dateFormatter.string(from: videoObj.published)
        
        //Set image of Video
        guard self.video?.thumbnail != "" else { return }
        
        //check CACHE before download data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            self.videoImageView.image = UIImage(data: cachedData)
            print("oooo")

        } else {
            print("No cache")
        }
        
        
        guard let url = URL(string: self.video!.thumbnail) else {
            print("NO PICTURE")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if  data != nil && error == nil  {
           
                 //We have to check  that downloaded url mathes the video thumbnail url of the current cell
            if url.absoluteString != self.video?.thumbnail {
                //Here video cell has been recycled for another video  and no longer matches with thumbnail which was downloaded
             return
            }
                CacheManager.setVideoCache(url.absoluteString, data)
                // MARK:  Save data to CACHE:
            
                let image  = UIImage(data: data!)
            DispatchQueue.main.async {
                self.videoImageView.image = image
            }
            }
        }
        task.resume()
       
        
        
    }
    
}
