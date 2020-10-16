//
//  TeamDetailsRouter.swift
//  FootballLeague
//
//  Created by Adam on 10/16/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol ITeamDetailsRouter: class {
	// do someting...
}

class TeamDetailsRouter: ITeamDetailsRouter {	
	weak var view: TeamDetailsViewController?
	
	init(view: TeamDetailsViewController?) {
		self.view = view
	}
}
