//
//  ViewController.swift
//  YoutubeApp
//
//  Created by максим  кондратьев  on 01.09.2021.
//

import UIKit

class ViewController: UIViewController {

    var model =  Model()
    var videosArray: [Video] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        model.delegate = self // 4 - Subscribe on protocol
        model.getVideos()
      
      
    }
}
// MARK:  3-Our delegate Pattern

extension ViewController: ModelDelegateProtocol {
    
    func videoFetch(_ videos: [Video]) {
        //Set  the returned video to our video property
        self.videosArray = videos
        print(videosArray.count)
        //Refresh tableView
        self.tableView.reloadData()
    }
    
    
}
// MARK:  TABLE VIEW methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return videosArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath)
       
        cell.textLabel?.text = self.videosArray[indexPath.row].title

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

