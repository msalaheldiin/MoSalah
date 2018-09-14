//
//  API.swift
//  Mo Salah
//
//  Created by Mahmoud on 8/4/18.
//  Copyright © 2018 Mahmoud. All rights reserved.
//

import Foundation
import  Alamofire
import SwiftyJSON

class API : NSObject {
    
    class func getPrizes (completion:@escaping (_ error:Error?,_ Prizes:[Prizes]?)->Void) {
        
        let url = urls.prizesUrl
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<300)
            .responseJSON { (response) in
                switch response.result{
                case .failure  (let error):
                    completion(error,nil)
                    print(error)
                case .success (let value ) :
                    let json = JSON(value)
                    guard let dataarray = json["prizes"].array else {
                        completion(nil,nil)
                        return
                    }
                    
                    var prizes = [Prizes]()
                    for data in dataarray{
                        
                        if let data = data.dictionary ,let prize = Prizes.init(dict: data) {
                            prizes.append(prize)
                            //                            print(prize.id)
                            //                            print(prize.name)
                            //                            print(prize.photo)
                            //                            print(prize.desc)
                            
                        }
                    }
                    completion (nil , prizes)
                    
                }
                
                
        }
        
    }
    
    class func getVideos (completion:@escaping (_ error:Error?,_ Videos:[Item]?)->Void) {
        
        let url = urls.VidosUrl
        let apiKey = "AIzaSyB9kpyv1YZ_UNEdc0YRNKgyRTyQTgLoaqA"
        let searchString = "mo+salah+highlights"
        let parameters = ["part":"snippet" , "q": searchString , "key":apiKey ,"maxResults":15] as [String : Any]
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<300)
            .responseJSON { (response) in
                switch response.result{
                case .failure  (let error):
                    completion(error,nil)
                    print(error)
                case .success (let value ) :
                    let json = JSON(value)
                    //                        guard let dataarray = json["items"].array else {
                    //
                    //                            completion(nil,nil)
                    //                            return
                    //                        }
                    //
                    //
                    var videos = [Item]()
                    guard let itemsArr = json["items"].array else { return }
                    
                    for item in itemsArr {
                        print("jsonarray543: \(item)")
                        let data = Item(fromJson: item)
                        videos.append(data)
                    }
                    //                        for data in dataarray{
                    //
                    //                            guard let ids = data["id"].dictionary else {return}
                    //                            guard let videpId = ids["videoId"]?.string else {return}
                    //                            print("dataarr55: \(videpId)")
                    //                        if let data = data.dictionary ,let video = Videos.init(dict: data){
                    //                                videos.append(video)
                    //                             print(video.desc)
                    //                                print(video.id)
                    //                                print(video.thumbNailUrl)
                    //                                print(video.title)
                    //
                    //                            }
                    //                        }
                    completion (nil , videos)
                    
                }
        }
    }
    
    
    
    //class func getvideoooos() {
    //    let url = urls.VidosUrl
    //    let apiKey = "AIzaSyB9kpyv1YZ_UNEdc0YRNKgyRTyQTgLoaqA"
    //    let searchString = "mo+salah+highlights"
    //    let parameters = ["part":"snippet" , "q": searchString , "key":apiKey]
    //
    //    Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil)
    //        .validate(statusCode: 200..<300)
    //        .responseJSON { (response) in
    //
    //            if let json = response.result.value {
    //
    //                print (json)
    //            }
    //
    //            //                if let JSON = response.result.value {
    //            //
    //            //                for video in  JSON["items"] as? [[String: AnyObject]]
    //            //                    {
    //            //
    //            //                        //print(video)
    //            //                        let videoObj = Videos()
    //            //                        videoObj.id =  video.v
    //            //
    //            //                    }
    //            //                }
    //
    //
    //
    //
    //
    //    }
    //
    //}
}





