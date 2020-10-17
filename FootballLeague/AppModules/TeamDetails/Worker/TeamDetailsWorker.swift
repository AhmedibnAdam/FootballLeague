//
//  TeamDetailsWorker.swift
//  FootballLeague
//
//  Created by Adam on 10/16/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import Foundation

protocol ITeamDetailsWorker: class {
    func getTeamDetails(parameters: [String: Any], complition :  @escaping (_ error:Error? ,_ success: Bool,_ data: TeamDetailsModel.Response?)->Void)
}

class TeamDetailsWorker: ITeamDetailsWorker {
    func getTeamDetails(parameters: [String: Any], complition :  @escaping (_ error:Error? ,_ success: Bool,_ data: TeamDetailsModel.Response?)->Void){
        NetworkService.share.request(endpoint: TeamDetailsEndpoint.teamDetails(parameters: parameters), success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let data = try decoder.decode(TeamDetailsModel.Response.self, from: response)
                print(data)
                complition(nil, true, data)
                
            } catch let error {
                print(error)
                complition(nil, true, nil)
            }
            
        }) { (error) in
            print(error as Any)
             complition(nil, true, nil)
        }
    }
}
