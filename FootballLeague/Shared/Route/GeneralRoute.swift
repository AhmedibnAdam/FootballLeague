//
//  GeneralRoute.swift
//  FootballLeague
//
//  Created by Adam on 10/16/20.
//  Copyright (c) 2020 TaskApp. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam/

import Foundation
import UIKit

enum GeneralRoute: IRouter {
    case ListOfTeams
    case teamDetails(parameters: [String: Any])
    
}

extension GeneralRoute {
    var module: UIViewController? {
        switch self {
        case .ListOfTeams:
            return ListOfTeamsConfiguration.setup()
        case .teamDetails(let parameters):
            return TeamDetailsConfiguration.setup(parameters: parameters)
        }
    }
}
