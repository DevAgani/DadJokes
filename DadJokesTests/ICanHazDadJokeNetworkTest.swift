//
//  ICanHazDadJokeNetworkTest.swift
//  DadJokesTests
//
//  Created by George  on 19/02/2021.
//

import XCTest
@testable import  DadJokes
class ICanHazDadJokeNetworkTest: XCTestCase {

    override func setUpWithError() throws {
        super.setUp()
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }
    
    func test_ICanHazDadJokeNetwork_succeed() {
        let apiService = ICanHazDadJokeNetworkApi()
        let exp = expectation(description: "ICanHazDadJokeNetwork API Requests")
        
        apiService.fetchRandomDadJoke { (result) in
            switch result {
            case .success(let dadJoke):
                print(dadJoke)
                exp.fulfill()
            case .failure(let error):
                XCTFail("Unable to fetch Dad Joke. Reason \(error.localizedDescription)")
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
}
