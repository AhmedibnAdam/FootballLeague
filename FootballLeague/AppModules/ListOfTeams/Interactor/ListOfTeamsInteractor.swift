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
    var realmWorker: IRealmListOfTeamsWorker?
    var parameters: [String: Any]?
    
    init(presenter: IListOfTeamsPresenter, worker: IListOfTeamsWorker,realmWorker:IRealmListOfTeamsWorker ) {
        self.presenter = presenter
        self.worker = worker
        self.realmWorker = realmWorker
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
                    self.getTeamsFromRealm()
                }
            })
        }else{
            getTeamsFromRealm()
        }
    }
    
    func getTeamsFromRealm(){
        realmWorker?.getTeams(complition: { (error, success, data) in
                if success {
                    guard let teamsData = data else {
                        return
                    }
                    self.presenter?.showTeams(teams: teamsData)
                }
        })
    }
    

    
    func addListOfTeamsToCash(teams: ListOfTeamsModel.Response) {
        realmWorker?.cashTeamsList(teams)
    }
 
    
    func removeTeamsFromCash(teams: RealmListOfTeams ){
        realmWorker?.removeTeamsListFromCash(teams)
    }
}
