//
//  RealmListOfTeams.swift
//  FootballLeague
//
//  Created by Adam on 10/17/20.
//

import Foundation
import RealmSwift



// MARK: - Response
class ListOfTeams: Codable {
    let count: Int?
    let teams: [OTeam]?

    init(count: Int?, teams: [OTeam]?) {
        self.count = count
        self.teams = teams
    }
}


// MARK: - Team
class OTeam: Codable {
    let id: Int?
    let name, shortName, tla: String?
    let crestURL: String?
    let address: String?
    let phone: String?
    let website: String?
    let email: String?
    let founded: Int?
    let clubColors, venue: String?

    enum CodingKeys: String, CodingKey {
        case id, name, shortName, tla
        case crestURL
        case address, phone, website, email, founded, clubColors, venue
    }

    init(id: Int?, name: String?, shortName: String?, tla: String?, crestURL: String?, address: String?, phone: String?, website: String?, email: String?, founded: Int?, clubColors: String?, venue: String?) {
        
        self.id = id
        self.name = name
        self.shortName = shortName
        self.tla = tla
        self.crestURL = crestURL
        self.address = address
        self.phone = phone
        self.website = website
        self.email = email
        self.founded = founded
        self.clubColors = clubColors
        self.venue = venue
 
    }
}
    
    
class RealmListOfTeams: Object {
    @objc dynamic var  count: Int = 0
    var teams =  List<Team>()
}
// MARK: - Team
class Team: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var shortName: String = ""
    @objc dynamic var tla: String = ""
    @objc dynamic var crestURL: String = ""
    @objc dynamic var address: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var website: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var founded: Int = 0
    @objc dynamic var clubColors: String = ""
    @objc dynamic var venue: String = ""
}


