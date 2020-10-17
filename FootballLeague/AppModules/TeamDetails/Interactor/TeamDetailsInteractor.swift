//
//  TeamDetailsInteractor.swift
//  FootballLeague
//
//  Created by Adam on 10/16/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol ITeamDetailsInteractor: class {
	var parameters: [String: Any]? { get set }
    func getTeamDetails()
}

class TeamDetailsInteractor: ITeamDetailsInteractor {
    var presenter: ITeamDetailsPresenter?
    var worker: ITeamDetailsWorker?
    var parameters: [String: Any]?

    init(presenter: ITeamDetailsPresenter, worker: ITeamDetailsWorker) {
    	self.presenter = presenter
    	self.worker = worker
    }
    func getTeamDetails(){
        guard let params = parameters else {
            return
        }
        worker?.getTeamDetails(parameters: params, complition: { (error, success, teams) in
            if success {
                guard let teamsData = teams else {
                    return
                }
                self.presenter?.showTeamDetails(team: teamsData)
            }
            else {
                
            }
        })
    }
}
