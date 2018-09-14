//
//  ViewController.swift
//  Mo Salah
//
//  Created by Mahmoud on 6/29/18.
//  Copyright © 2018 Mahmoud. All rights reserved.
//

import UIKit
import Kingfisher
import NVActivityIndicatorView

class PrizesVC: UITableViewController  {
    
    var activityIndicatorView = NVActivityIndicatorView(frame: .zero)
    @IBOutlet var tableview: UITableView!
    var prizes = [Prizes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initActivityIndicator(activity:activityIndicatorView, color: .red)
        let nib = UINib.init(nibName: "TableViewCell", bundle: nil)
        self.tableview.register(nib, forCellReuseIdentifier: "cell")
        loadData()
    }
    func loadData()  {
        API.getPrizes { (error:Error?, prizes:[Prizes]?) in
            if let prizes = prizes {
                self.prizes = prizes
                self.tableView.reloadData()
                self.activityIndicatorView.stopAnimating()
            }
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prizes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let data = prizes[indexPath.row].photo
        let url = URL(string: data)
        cell.imageview.kf.setImage(with: url )
        cell.namelbl.text = prizes[indexPath.row].name
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = sb.instantiateViewController(withIdentifier: "prizeDetailsVC") as! PrizeDetailsVC
        self.navigationController?.pushViewController(controller, animated: true)
        controller.getName = prizes[indexPath.row].name
        controller.getImage = prizes[indexPath.row].photo
        controller.getDesc = prizes[indexPath.row].desc
    }
}

