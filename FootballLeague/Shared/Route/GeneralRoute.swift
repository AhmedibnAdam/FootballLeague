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

     case teamDetails
     case ListOfTeams
     
  
}

extension GeneralRoute {
    var module: UIViewController? {
         switch self {
         case .teamDetails:
            return TeamDetailsConfiguration.setup()
        case .ListOfTeams:
            return ListOfTeamsConfiguration.setup()
         }
    }
}
