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
}

class TeamDetailsInteractor: ITeamDetailsInteractor {
    var presenter: ITeamDetailsPresenter?
    var worker: ITeamDetailsWorker?
    var parameters: [String: Any]?

    init(presenter: ITeamDetailsPresenter, worker: ITeamDetailsWorker) {
    	self.presenter = presenter
    	self.worker = worker
    }
}
