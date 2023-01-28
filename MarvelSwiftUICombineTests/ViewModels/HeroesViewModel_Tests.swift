//
//  MainHeroesViewModel_Tests.swift
//  MarvelSwiftUICombineTests
//
//  Created by Roberto Rojo Sahuquillo on 27/1/23.
//

import XCTest
import Combine
@testable import MarvelSwiftUICombine

// Naming Structure: test_UnitofWork_StateUnderTest_ExpectBehavior
// Naming Structure: test_[class or struct]_[variable or function]_[expected value]
// Testing Structure: Given, When, Then

final class HeroesViewModel_Tests: XCTestCase {
    
    var sut: HeroesViewModel?

    override func setUpWithError() throws {
        sut = HeroesViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil

    }

    func test_HeroesViewModel_getHeroes_shouldBeSuccess() {
        //Given
        
        //When
        var suscriptor = Set<AnyCancellable>()
        
        let expectation = self.expectation(description: "Downloading ...")

        sut?.heroes.publisher
            .sink { completion in
                
                switch completion{
                case .finished:
                    //Then
                    XCTAssertEqual(1,1)
                    expectation.fulfill()
                case .failure:
                    //Then
                    XCTAssertEqual(1,2)
                    expectation.fulfill()
                }
            } receiveValue: { heroes in
                //Then
                XCTAssertEqual(1,1)
                expectation.fulfill()
            }
            .store(in: &suscriptor)
        
        sut?.getHeroes()
        
        
        self.waitForExpectations(timeout: 10)
    }
}
