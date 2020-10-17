//
//  FootballLeagueTests.swift
//  FootballLeagueTests
//
//  Created by Adam on 10/16/20.
//

import XCTest
@testable import FootballLeague
import OHHTTPStubs

class FootballLeagueTests: XCTestCase {
    

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        //MARK: - Given
        stub(condition: { (requestURl) -> Bool in
            return requestURl.url?.absoluteString.contains("name")  ?? false
        }) { (response) -> HTTPStubsResponse in
            
            let jsonObject:ListOfTeamsModel.Response =  ListOfTeamsModel.Response(count: 20, teams: [ListOfTeamsModel.Team(id: 20, area: ListOfTeamsModel.Area(id: 1, name: ListOfTeamsModel.Name(rawValue: "")), name: "Arsenal FC", shortName: "", tla: "", crestURL: "", address: "", phone: "", website: "", email: "", clubColors: "", venue: "")])
            
            return HTTPStubsResponse(jsonObject: jsonObject, statusCode: 200, headers: nil)
        }
        var expectedResponse: ListOfTeamsModel.Response?  = nil
        let exception = self.expectation(description: "calling Api failed !")
        
        //MARK: - When
        let worker: IListOfTeamsWorker? = ListOfTeamsWorker()
        worker?.getTeams( complition: { (error, status, response) in
            expectedResponse = response
            exception.fulfill()
        })
        
        //MARK: - Then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssertTrue(expectedResponse?.count == 20)
        XCTAssertEqual(expectedResponse?.teams?.count , 20)
        XCTAssertEqual(expectedResponse?.teams?[0].name , "Arsenal FC")
    }
    
}
