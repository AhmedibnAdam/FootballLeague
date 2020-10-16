//
//  ListOfTeamsConfiguration.swift
//  FootballLeague
//
//  Created by Adam on 10/16/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import Foundation
import UIKit

class ListOfTeamsConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = ListOfTeamsViewController()
        let router = ListOfTeamsRouter(view: controller)
        let presenter = ListOfTeamsPresenter(view: controller)
        let worker = ListOfTeamsWorker()
        let interactor = ListOfTeamsInteractor(presenter: presenter, worker: worker)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
