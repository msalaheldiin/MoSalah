//
//	Id.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON

class Id{

	var kind : String!
	var videoId : String!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		kind = json["kind"].stringValue
		videoId = json["videoId"].stringValue
	}

}