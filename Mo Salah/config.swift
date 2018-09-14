//
//  config.swift
//  Mo Salah
//
//  Created by Mahmoud on 8/4/18.
//  Copyright © 2018 Mahmoud. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

struct urls {
    static let prizesUrl = "http://www.json-generator.com/api/json/get/cfpeNCcCCq?indent=2"
    static let VidosUrl = "https://www.googleapis.com/youtube/v3/search"
    static let wikiUrl = "https://en.wikipedia.org/wiki/Mohamed_Salah"
}

extension UITableViewController  {
    func initActivityIndicator(activity: NVActivityIndicatorView, color: UIColor) {
        activity.frame = CGRect(x: view.frame.size.width/2 - 25, y: view.frame.size.height/2 - 25 , width: 50, height: 50)
        activity.type = NVActivityIndicatorType(rawValue: 22)!
        activity.color = color
        tableView.addSubview(activity)
        activity.startAnimating()
    }
}

