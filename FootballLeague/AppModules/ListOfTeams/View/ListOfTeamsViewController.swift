//
//  ListOfTeamsViewController.swift
//  FootballLeague
//
//  Created by Adam on 10/16/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol IListOfTeamsViewController: class {
	var router: IListOfTeamsRouter? { get set }
}

class ListOfTeamsViewController: UIViewController {
	var interactor: IListOfTeamsInteractor?
	var router: IListOfTeamsRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension ListOfTeamsViewController: IListOfTeamsViewController {
	// do someting...
}

extension ListOfTeamsViewController {
	// do someting...
}

extension ListOfTeamsViewController {
	// do someting...
}
