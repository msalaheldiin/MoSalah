//
//  wallpapers.swift
//  Mo Salah
//
//  Created by Mahmoud on 8/14/18.
//  Copyright © 2018 Mahmoud. All rights reserved.
//

import UIKit
import Kingfisher
import NVActivityIndicatorView


class wallpapersVC: UIViewController ,UICollectionViewDelegate , UICollectionViewDataSource {
    var prizes = [Prizes]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        loadData()
    }
    
    func loadData()  {
        API.getPrizes { (error:Error?, prizes:[Prizes]?) in
            
            if let prizes = prizes {
                self.prizes = prizes
                self.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return prizes.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! collectionViewCell
        
        let data = prizes[indexPath.row].photo
        
        let url = URL(string: data)
        
        cell.imageView.kf.setImage(with: url )
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = sb.instantiateViewController(withIdentifier: "wallPaperDetailVc") as! WallParerDetailVC
        self.navigationController?.pushViewController(controller, animated: true)
        controller.getImage = prizes[indexPath.row].photo
        
        
    }    
}



