//
//  TeamDetailsViewController.swift
//  FootballLeague
//
//  Created by Adam on 10/16/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol ITeamDetailsViewController: class {
	var router: ITeamDetailsRouter? { get set }
}

class TeamDetailsViewController: UIViewController {
	var interactor: ITeamDetailsInteractor?
	var router: ITeamDetailsRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension TeamDetailsViewController: ITeamDetailsViewController {
	// do someting...
}

extension TeamDetailsViewController {
	// do someting...
}

extension TeamDetailsViewController {
	// do someting...
}
