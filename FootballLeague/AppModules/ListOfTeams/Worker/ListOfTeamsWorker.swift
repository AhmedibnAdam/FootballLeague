//
//  ListOfTeamsWorker.swift
//  FootballLeague
//
//  Created by Adam on 10/16/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import Foundation

protocol IListOfTeamsWorker: class {
    func getTeams(complition :  @escaping (_ error:Error? ,_ success: Bool,_ data: ListOfTeamsModel.Response?)->Void)
}

class ListOfTeamsWorker: IListOfTeamsWorker {
    func getTeams(complition :  @escaping (_ error:Error? ,_ success: Bool,_ data: ListOfTeamsModel.Response?)->Void){
        NetworkService.share.request(endpoint: ListOfTeamsEndpoint.getTeams, success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let data = try decoder.decode(ListOfTeamsModel.Response.self, from: response)
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


