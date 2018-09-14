//
//  WallParerDetail.swift
//  Mo Salah
//
//  Created by Mahmoud on 8/14/18.
//  Copyright © 2018 Mahmoud. All rights reserved.
//

import UIKit
import Kingfisher

class WallParerDetailVC: UIViewController {

    var getImage = ""
    @IBOutlet weak var imageview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: getImage)
        imageview.kf.setImage(with: url )
       
    }
 
    @IBAction func share(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [ imageview.image as Any], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
}
