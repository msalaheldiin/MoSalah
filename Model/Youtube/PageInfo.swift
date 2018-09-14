//
//	PageInfo.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON

class PageInfo{

	var resultsPerPage : Int!
	var totalResults : Int!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		resultsPerPage = json["resultsPerPage"].intValue
		totalResults = json["totalResults"].intValue
	}

}