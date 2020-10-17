//
//  RealmTeamDetailsModel.swift
//  FootballLeague
//
//  Created by Adam on 10/17/20.
//

import Foundation
import RealmSwift

 class TeamInfo: Object {
    
    @objc dynamic var id: Int = 0
    var activeCompetitions = List<ActiveCompetition>()
    @objc dynamic var name = ""
    @objc dynamic var shortName: String = ""
    @objc dynamic var tla: String = ""
    @objc dynamic var crestUrl: String = ""
    @objc dynamic var address: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var website: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var founded: Int = 0
    @objc dynamic var clubColors: String = ""
    @objc dynamic var venue: String = ""
    var squad = List<Squad>()
 
    
    enum CodingKeys: String, CodingKey {
        case id,activeCompetitions, name, shortName, tla
        case crestURL = "crestUrl"
        case address, phone, website, email, founded, clubColors, venue, squad
    }
}

@objcMembers public class ActiveCompetition: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name :String = ""
    @objc dynamic var code :String = ""
    @objc dynamic var plan: String = ""
}


  class Squad: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var position: String = ""
    @objc dynamic var countryOfBirth = ""
    @objc dynamic var nationality: String = ""
    @objc dynamic var role: String = ""
}

