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
}

class ListOfTeamsInteractor: IListOfTeamsInteractor {
    var presenter: IListOfTeamsPresenter?
    var worker: IListOfTeamsWorker?
    var parameters: [String: Any]?

    init(presenter: IListOfTeamsPresenter, worker: IListOfTeamsWorker) {
    	self.presenter = presenter
    	self.worker = worker
    }
}
