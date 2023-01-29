//
//  NetworkManager_Tests.swift
//  MarvelSwiftUICombineTests
//
//  Created by Roberto Rojo Sahuquillo on 27/1/23.
//

import XCTest
@testable import MarvelSwiftUICombine

// Naming Structure: test_UnitofWork_StateUnderTest_ExpectBehavior
// Naming Structure: test_[class or struct]_[variable or function]_[expected value]
// Testing Structure: Given, When, Then

final class NetworkManager_Tests: XCTestCase {

    var sut: NetworkManager?

    override func setUpWithError() throws {
        sut = NetworkManager()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_NetworkManager_getSessionHeroes_shouldBeSuccess() throws {
        // Given
        
        // When
        let urlSession = sut?.getSessionHeroes()
        let httpMethod = urlSession?.httpMethod
        // Then
        
        XCTAssertNotNil(urlSession)
        XCTAssertEqual(HTTPMethods.get, httpMethod)
    }
    
    func test_NetworkManager_getSessionHeroComics_shouldBeSuccess() throws {
        // Given
  
        // When
        let urlSession = sut?.getSessionHeroComics(heroId: 1)
        let httpMethod = urlSession?.httpMethod
        
        // Then
        XCTAssertNotNil(urlSession)
        XCTAssertEqual(HTTPMethods.get, httpMethod)
    }
    
    func test_NetworkManager_getSessionHeroSeries_shouldBeSuccess() throws {
        // Given
  
        // When
        let urlSession = sut?.getSessionHeroSeries(heroId: 1)
        let httpMethod = urlSession?.httpMethod
        
        // Then
        XCTAssertNotNil(urlSession)
        XCTAssertEqual(HTTPMethods.get, httpMethod)
    }

}
