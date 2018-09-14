//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON

class RootClass{

	var etag : String!
	var items : [Item]!
	var kind : String!
	var nextPageToken : String!
	var pageInfo : PageInfo!
	var regionCode : String!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		etag = json["etag"].stringValue
		items = [Item]()
		let itemsArray = json["items"].arrayValue
		for itemsJson in itemsArray{
			let value = Item(fromJson: itemsJson)
			items.append(value)
		}
		kind = json["kind"].stringValue
		nextPageToken = json["nextPageToken"].stringValue
		let pageInfoJson = json["pageInfo"]
		if !pageInfoJson.isEmpty{
			pageInfo = PageInfo(fromJson: pageInfoJson)
		}
		regionCode = json["regionCode"].stringValue
	}

}