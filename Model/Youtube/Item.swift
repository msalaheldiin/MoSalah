//
//	Item.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON

class Item{

	var etag : String!
	var id : Id!
	var kind : String!
	var snippet : Snippet!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		etag = json["etag"].stringValue
		let idJson = json["id"]
		if !idJson.isEmpty{
			id = Id(fromJson: idJson)
		}
		kind = json["kind"].stringValue
		let snippetJson = json["snippet"]
		if !snippetJson.isEmpty{
			snippet = Snippet(fromJson: snippetJson)
		}
	}

}