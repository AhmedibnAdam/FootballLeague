//
//  ListOfTeamsModel.swift
//  FootballLeague
//
//  Created by Adam on 10/16/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

struct ListOfTeamsModel {	
	struct Request {
		// do someting...

		func parameters() -> [String: Any]? {
			// do someting...
			return nil
		}
	}

   
    // MARK: - Response
    struct Response: Codable {
        let count: Int?

        let teams: [Team]?
    }

 

    // MARK: - Area
    struct Area: Codable {
        let id: Int?
        let name: Name?
    }

    enum Name: String, Codable {
        case england = "England"
    }



    // MARK: - Team
    struct Team: Codable {
        let id: Int?
        let area: Area?
        let name, shortName, tla: String?
        let crestURL: String?
        let address: String?
        let phone: String?
        let website: String?
        let email: String?
        let clubColors, venue: String?
    

        enum CodingKeys: String, CodingKey {
            case id, area, name, shortName, tla
            case crestURL = "crestUrl"
            case address, phone, website, email, clubColors, venue
        }
    }


}
