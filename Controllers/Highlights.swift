//
//  Vidoes.swift
//  Mo Salah
//
//  Created by Mahmoud on 8/12/18.
//  Copyright © 2018 Mahmoud. All rights reserved.
//

import UIKit
import Kingfisher
import NVActivityIndicatorView

class Highlights: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    var  videosArr = [Item]()
    var videos = [Item]()
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        let nib = UINib.init(nibName: "TableViewCell", bundle: nil)
        self.tableview.register(nib, forCellReuseIdentifier: "cell")
        loadData()  
    }
    func loadData()  {
        API.getVideos { (error, videos) in
            if let videos = videos{
                self.videos = videos
                self.tableview.reloadData()
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.namelbl.text = videos[indexPath.row].snippet.title
        let data = videos[indexPath.row].snippet.thumbnails.medium.url
        let url = URL(string: data!)
        cell.imageview.kf.setImage(with: url )
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let youtubeId = videos[indexPath.row].id.videoId{
            var url = URL(string:"youtube://\(youtubeId)")!
            if !UIApplication.shared.canOpenURL(url)  {
                url = URL(string:"http://www.youtube.com/watch?v=\(youtubeId)")!
            }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
}

