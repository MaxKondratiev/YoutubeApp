//
//  ViewController.swift
//  YoutubeApp
//
//  Created by максим  кондратьев  on 01.09.2021.
//

import UIKit

class ViewController: UIViewController {

    var model =  Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.getVideos()
        //print(Constants.API_URL)
      
    }


}

