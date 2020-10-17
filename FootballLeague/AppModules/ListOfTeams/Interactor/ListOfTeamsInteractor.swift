//
//  ListOfTeamsInteractor.swift
//  FootballLeague
//
//  Created by Adam on 10/16/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol IListOfTeamsInteractor: class {
	var parameters: [String: Any]? { get set }
    func getTeams()
    func addListOfTeamsToCash(teams: ListOfTeamsModel.Response)
}

class ListOfTeamsInteractor: IListOfTeamsInteractor {
    var presenter: IListOfTeamsPresenter?
    var worker: IListOfTeamsWorker?
    var parameters: [String: Any]?

    init(presenter: IListOfTeamsPresenter, worker: IListOfTeamsWorker) {
    	self.presenter = presenter
    	self.worker = worker
    }
    func getTeams(){
        
        if Reachability.isConnectedToNetwork(){
            worker?.getTeams(complition: { (error, success, teams) in
                if success {
                    guard let teamsData = teams else {
                        return
                    }
                    self.presenter?.showTeams(teams: teamsData)
                }
                else {
                    self.presenter?.showTeams()
                }
            })

        }else{
            self.presenter?.showTeams()
        }
    }
    func addListOfTeamsToCash(teams: ListOfTeamsModel.Response) {
        
        let realmObject = RealmListOfTeams()
      
        realmObject.count = teams.count ?? 0

        for team in teams.teams! {
            let realmTeam = Team()
            realmTeam.id = team.id!
            realmTeam.address =  team.address!
            realmTeam.clubColors = team.clubColors!
//            realmTeam.crestURL = team.email!
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
    func removeTeamsFromCash(teams: RealmListOfTeams ){
        
        RealmManager.shared.removeObject(realmObject: teams , andCompletion : {
            (result) in
            print(result)
        } )
    }
}
