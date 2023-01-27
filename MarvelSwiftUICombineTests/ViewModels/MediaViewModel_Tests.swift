//
//  MediaViewModel_Tests.swift
//  MarvelSwiftUICombineTests
//
//  Created by Roberto Rojo Sahuquillo on 27/1/23.
//

import XCTest
import Combine
@testable import MarvelSwiftUICombine

// Naming Structure: test_UnitofWork_StateUnderTest_ExpectBehavior

final class MediaViewModel_Tests: XCTestCase {

    var sut: MediaViewModel?
    
    override func setUpWithError() throws {
        sut = MediaViewModel(heroId: 1017857, heroName: "Peggy Carter (Captain Carter)")
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_MediaViewModel_getHeroComics_shouldBeSuccess() {
        //Given
        
        //When
        var suscriptor = Set<AnyCancellable>()
        
        let expectation = self.expectation(description: "Downloading ...")

        sut?.comics.publisher
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
        
        sut?.getHeroComics()
        
        
        self.waitForExpectations(timeout: 10)
    }
    
    func test_MediaViewModel_getHeroSeries_shouldBeSuccess() {
        //Given
        
        //When
        var suscriptor = Set<AnyCancellable>()
        
        let expectation = self.expectation(description: "Downloading ...")

        sut?.series.publisher
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
        
        sut?.getHeroSeries()
        
        
        self.waitForExpectations(timeout: 10)
    }
}
