//
//  TeamDetailsModel.swift
//  FootballLeague
//
//  Created by Adam on 10/16/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

struct TeamDetailsModel {	
	struct Request {
		// do someting...

		func parameters() -> [String: Any]? {
			// do someting...
			return nil
		}
	}

    // MARK: - Response
    struct Response: Codable {
        let id: Int?
        let area: Area?
        let activeCompetitions: [ActiveCompetition]?
        let name, shortName, tla: String?
        let crestURL: String?
        let address, phone: String?
        let website: String?
        let email: String?
        let founded: Int?
        let clubColors, venue: String?
        let squad: [Squad]?
  

        enum CodingKeys: String, CodingKey {
            case id, area, activeCompetitions, name, shortName, tla
            case crestURL = "crestUrl"
            case address, phone, website, email, founded, clubColors, venue, squad
        }
    }

    // MARK: - ActiveCompetition
    struct ActiveCompetition: Codable {
        let id: Int?
        let area: Area?
        let name, code, plan: String?
    }

    // MARK: - Area
    struct Area: Codable {
        let id: Int?
        let name: String?
    }

    // MARK: - Squad
    struct Squad: Codable {
        let id: Int?
        let name: String?
        let position: String?
 
        let countryOfBirth, nationality: String?
        let shirtNumber: Int?
        let role: String?
    }



}
