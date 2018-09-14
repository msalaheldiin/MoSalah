//
//	Snippet.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON

class Snippet{

	var channelId : String!
	var channelTitle : String!
	var descriptionField : String!
	var liveBroadcastContent : String!
	var publishedAt : String!
	var thumbnails : Thumbnail!
	var title : String!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		channelId = json["channelId"].stringValue
		channelTitle = json["channelTitle"].stringValue
		descriptionField = json["description"].stringValue
		liveBroadcastContent = json["liveBroadcastContent"].stringValue
		publishedAt = json["publishedAt"].stringValue
		let thumbnailsJson = json["thumbnails"]
		if !thumbnailsJson.isEmpty{
			thumbnails = Thumbnail(fromJson: thumbnailsJson)
		}
		title = json["title"].stringValue
	}

}