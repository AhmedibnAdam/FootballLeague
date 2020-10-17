//
//  TeamDetailsPresenter.swift
//  FootballLeague
//
//  Created by Adam on 10/16/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol ITeamDetailsPresenter: class {
    func showTeamDetails(team: TeamDetailsModel.Response)
}

class TeamDetailsPresenter: ITeamDetailsPresenter {	
	weak var view: ITeamDetailsViewController?
	
	init(view: ITeamDetailsViewController?) {
		self.view = view
	}
    func showTeamDetails(team: TeamDetailsModel.Response){
        view?.showTeamDetails(team: team)
    }
}
