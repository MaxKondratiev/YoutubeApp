//
//  DetailViewController.swift
//  YoutubeApp
//
//  Created by максим  кондратьев  on 02.09.2021.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textField: UITextView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        titleLabel.text = ""
        dateLabel.text = ""
        textField.text = ""
        
        
        //check if there is video:
        guard  video != nil else {
            return
        }
        
        let embedUrlString = Constants.YOUTUBE_URL + video!.videoId
        
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        titleLabel.text = video?.title
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        self.dateLabel.text = dateFormatter.string(from:video!.published)
        
        textField.text = video?.description
        
        
        
        
        
    }

  
  

}
