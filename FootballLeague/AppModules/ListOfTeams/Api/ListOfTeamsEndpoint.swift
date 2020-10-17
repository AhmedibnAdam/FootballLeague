//
//  ListOfTeamsEndpoint.swift
//  FootballLeague
//
//  Created by Adam on 10/16/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import Foundation
import Alamofire

enum ListOfTeamsEndpoint {

    case getTeams
}

extension ListOfTeamsEndpoint: IEndpoint {
   
    
    var method: HTTPMethod {

        switch self {
        case .getTeams:
            return .get
        }
      
  
    }
    
    var path: String {
 
        switch self {
        case .getTeams:
            return Constant.base + Constant.version + "competitions/2021/teams"
        }
     
    }
    
    var image: UIImage? {
        return nil
    }
    
    var parameter: Parameters? {
      
        return nil
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .getTeams:
            return ["X-Auth-Token": Constant.token]
        }
    }
   
    
    var encoding: ParameterEncoding {        
 
        switch self {
        case .getTeams:
            return JSONEncoding.default
        }

    }
}
