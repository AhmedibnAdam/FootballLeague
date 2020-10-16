//
//  TeamDetailsConfiguration.swift
//  FootballLeague
//
//  Created by Adam on 10/16/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import Foundation
import UIKit

class TeamDetailsConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = TeamDetailsViewController()
        let router = TeamDetailsRouter(view: controller)
        let presenter = TeamDetailsPresenter(view: controller)
        let worker = TeamDetailsWorker()
        let interactor = TeamDetailsInteractor(presenter: presenter, worker: worker)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
