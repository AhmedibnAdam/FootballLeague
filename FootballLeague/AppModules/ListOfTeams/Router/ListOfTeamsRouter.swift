//
//  ListOfTeamsRouter.swift
//  FootballLeague
//
//  Created by Adam on 10/16/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol IListOfTeamsRouter: class {
	// do someting...
}

class ListOfTeamsRouter: IListOfTeamsRouter {	
	weak var view: ListOfTeamsViewController?
	
	init(view: ListOfTeamsViewController?) {
		self.view = view
	}
}
