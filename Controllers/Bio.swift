//
//  Bio.swift
//  Mo Salah
//
//  Created by Mahmoud on 6/29/18.
//  Copyright © 2018 Mahmoud. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
class Bio: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string:urls.wikiUrl)!
        webView.loadRequest(URLRequest(url:url))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
