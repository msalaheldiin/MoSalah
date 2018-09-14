//
//  Prizes.swift
//  Mo Salah
//
//  Created by Mahmoud on 8/4/18.
//  Copyright © 2018 Mahmoud. All rights reserved.
//

import Foundation
import SwiftyJSON
class Prizes :NSObject {
    var id : Int
    var name : String
    var photo : String
    var desc : String
    
    init?(dict: [String:JSON])
    {
        guard let id = dict["id"]?.int , let name = dict["name"]?.string , let photo = dict ["photo"]?.string , let decc = dict["desc"]?.string else {
            return nil
        }
        self.id = id
        self.name = name
        self.photo = photo
        self.desc = decc
        
    }
    
}
