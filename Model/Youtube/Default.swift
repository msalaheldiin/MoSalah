//
//	Default.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON

class Default{

	var height : Int!
	var url : String!
	var width : Int!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		height = json["height"].intValue
		url = json["url"].stringValue
		width = json["width"].intValue
	}

}