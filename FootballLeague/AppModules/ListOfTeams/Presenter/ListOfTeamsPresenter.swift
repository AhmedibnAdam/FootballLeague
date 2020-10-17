//
//  ListOfTeamsPresenter.swift
//  FootballLeague
//
//  Created by Adam on 10/16/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol IListOfTeamsPresenter: class {
    func showTeams(teams: ListOfTeamsModel.Response)
    func showTeams(teams: RealmListOfTeams)
}

class ListOfTeamsPresenter: IListOfTeamsPresenter {

	weak var view: IListOfTeamsViewController?
	
	init(view: IListOfTeamsViewController?) {
		self.view = view
	}
    func showTeams(teams: ListOfTeamsModel.Response){
        view?.showTeams(teams: teams)
    }
    func showTeams(teams: RealmListOfTeams) {
        view?.showTeams(teams: teams)
    }
    
    
    
}
