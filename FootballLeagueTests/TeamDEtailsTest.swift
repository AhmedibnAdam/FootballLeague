//
//  TeamDEtailsTest.swift
//  FootballLeagueTests
//
//  Created by Adam on 10/17/20.
//

import XCTest
@testable import FootballLeague
import OHHTTPStubs

class TeamDEtailsTest: XCTestCase {
    
    
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
            
            let jsonObject:TeamDetailsModel.Response =  TeamDetailsModel.Response(id: 0, area: TeamDetailsModel.Area(id: 0, name: ""), activeCompetitions: [TeamDetailsModel.ActiveCompetition(id: 0, area: TeamDetailsModel.Area(id: 0, name: ""), name: "", code: "", plan: "")], name: "", shortName: "", tla: "", crestURL: "", address: "", phone: "", website: "", email: "", founded: 0, clubColors: "", venue: "", squad: [TeamDetailsModel.Squad(id: 0, name: "", position: "", countryOfBirth: "", nationality: "", shirtNumber: 0, role: "")])
            
            return HTTPStubsResponse(jsonObject: jsonObject, statusCode: 200, headers: nil)
        }
        var expectedResponse: TeamDetailsModel.Response?  = nil
        let exception = self.expectation(description: "calling Api failed !")
        
        //MARK: - When
        let worker: ITeamDetailsWorker? = TeamDetailsWorker()
        worker?.getTeamDetails(parameters: ["team_id" : 57], complition: { (error, status, response) in
            expectedResponse = response
            exception.fulfill()
        })
        
        //MARK: - Then
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssertTrue(expectedResponse?.id == 57)
        XCTAssertEqual(expectedResponse?.venue,  "Emirates Stadium")
        XCTAssertEqual(expectedResponse?.name , "Arsenal FC")
    }
    
}
