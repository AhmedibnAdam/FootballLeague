//
//  RealmListOfTeamsWorkder.swift
//  FootballLeague
//
//  Created by Adam on 10/18/20.
//

import Foundation

protocol IRealmListOfTeamsWorker: class {
    func getTeams(complition :  @escaping (_ error:Error? ,_ success: Bool,_ data: RealmListOfTeams?)->Void)
    func cashTeamsList(_ teams: ListOfTeamsModel.Response)
    func removeTeamsListFromCash(_ teams: RealmListOfTeams)
}

class RealmListOfTeamsWorker: IRealmListOfTeamsWorker {
    func getTeams(complition :  @escaping (_ error:Error? ,_ success: Bool,_ data: RealmListOfTeams?)->Void){
        guard let retrivedData = RealmManager.shared.getObjectOf(type: RealmListOfTeams.self).last else {return}
        print(retrivedData)
        complition(nil, true, retrivedData)
    }
    func cashTeamsList(_ teams: ListOfTeamsModel.Response) {
       let realmObject = RealmListOfTeams()
       realmObject.count = teams.count ?? 0
       for team in teams.teams! {
           let realmTeam = Team()
           realmTeam.id = team.id!
           realmTeam.address =  team.address!
           realmTeam.clubColors = team.clubColors!
           realmTeam.email = team.name!
           realmTeam.phone = team.shortName!
           realmTeam.tla = team.tla!
           realmTeam.venue = team.venue!
           realmTeam.website = team.website!
           realmObject.teams.append(realmTeam)
       }
       
       RealmManager.shared.addObject(realmObject: realmObject , andCompletion : {
           (addResult) in
           print(addResult)
       } )
   }
    func removeTeamsListFromCash(_ teams: RealmListOfTeams) {
       RealmManager.shared.removeObject(realmObject: teams , andCompletion : {
           (result) in
           print(result)
       } )
   }
}
