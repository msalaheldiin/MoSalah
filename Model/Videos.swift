//
//  Videos.swift
//  Mo Salah
//
//  Created by Mahmoud on 8/12/18.
//  Copyright © 2018 Mahmoud. All rights reserved.
//

import Foundation
import SwiftyJSON
class Videos :NSObject {
    var id : String = ""
    var title : String = ""
    var desc : String	 = ""
    var thumbNailUrl = ""
  
 
 
    
init?(dict: [String:JSON])
{
    guard let videoid = dict["videoId"]?.string , let title = dict["title"]?.string , let description = dict ["description"]?.string , let thumbNailUrl = dict["url"]?.string else {
        return nil
    }
    self.id = videoid
    self.title  = title
    self.thumbNailUrl = thumbNailUrl
    self.desc = description
}
}
