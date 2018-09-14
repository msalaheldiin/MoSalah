//
//	Thumbnail.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON

class Thumbnail{

	var defaultField : Default!
	var high : Default!
	var medium : Default!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		let defaultFieldJson = json["default"]
		if !defaultFieldJson.isEmpty{
			defaultField = Default(fromJson: defaultFieldJson)
		}
		let highJson = json["high"]
		if !highJson.isEmpty{
			high = Default(fromJson: highJson)
		}
		let mediumJson = json["medium"]
		if !mediumJson.isEmpty{
			medium = Default(fromJson: mediumJson)
		}
	}

}