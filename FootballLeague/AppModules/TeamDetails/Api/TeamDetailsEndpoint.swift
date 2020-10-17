//
//  TeamDetailsEndpoint.swift
//  FootballLeague
//
//  Created by Adam on 10/16/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import Foundation
import Alamofire

enum TeamDetailsEndpoint {
   case teamDetails(parameters: [String: Any])
}

extension TeamDetailsEndpoint: IEndpoint {
    
    
    var method: HTTPMethod {

        switch self {
        case .teamDetails:
            return .get
        }
    }
    
    var path: String {
 
        switch self {
        case .teamDetails(let parameters):
            guard let id = parameters["team_id"] else {
                return ""
            }
            return Constant.base + Constant.version + "teams/" + "\(id)"
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
        case .teamDetails:
            return ["X-Auth-Token": Constant.token]
        }
    }
   
    
    var encoding: ParameterEncoding {
 
        switch self {
        case .teamDetails:
            return JSONEncoding.default
        }

    }
}
