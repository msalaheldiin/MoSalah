//
//  PrizeDetails.swift
//  Mo Salah
//
//  Created by Mahmoud on 8/5/18.
//  Copyright © 2018 Mahmoud. All rights reserved.
//

import UIKit
import Kingfisher
class PrizeDetailsVC: UIViewController {
    var getName = ""
    var getImage = ""
    var getDesc  = ""
    
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        namelbl.text = getName
        desc.text = getDesc
        let url = URL(string: getImage)
        imageview.kf.setImage(with: url )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
}
