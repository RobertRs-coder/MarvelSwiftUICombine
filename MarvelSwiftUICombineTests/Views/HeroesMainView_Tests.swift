//
//  ErrorViewHeroes_Tests.swift
//  MarvelSwiftUICombineTests
//
//  Created by Roberto Rojo Sahuquillo on 29/1/23.
//

import SwiftUI
import ViewInspector
import XCTest
@testable import MarvelSwiftUICombine

// Naming Structure: test_UnitofWork_StateUnderTest_ExpectBehavior
// Naming Structure: test_[class or struct]_[variable or function]_[expected value]
// Testing Structure: Given, When, Then

final class HeroesMainView_Tests: XCTestCase {

    func test_HeroesMainView_ShouldHaveView() throws {
        //Given
        let viewModel = HeroesViewModel()
        let view = HeroesMainView().environmentObject(viewModel)
        
        //When
        let numItems = try view.inspect().count
        
        //Then
        XCTAssertEqual(numItems, 1)
    }
    
    func test_HeroesMainView_Status_ShouldBeLoading() throws {
        //Given
        let viewModel = HeroesViewModel()
        let view = HeroesMainView().environmentObject(viewModel)
        
        //When
        viewModel.status = .loading
        let loadedView = try view.inspect().find(viewWithId: "LoadingView")
        //Then
        XCTAssertNotNil(loadedView)
    }
    
    func test_HeroesMainView_Status_ShouldBeLoaded() throws {
        //Given
        let viewModel = HeroesViewModel()
        let view = HeroesMainView().environmentObject(viewModel)
        
        //When
        viewModel.status = .loaded
        let loadedView = try view.inspect().find(viewWithId: "HeroesView")
        
        //Then
        XCTAssertNotNil(loadedView)
    }
    
    func test_test_HeroesMainView_Status_ShouldBeError() throws {
        //Given
        let viewModel = HeroesViewModel()
        let view = HeroesMainView().environmentObject(viewModel)
        
        //When
        viewModel.status = .error(error: "Error")
        let loadedView = try view.inspect().find(viewWithId: "ErrorHeroesView")
        
        //Then
        XCTAssertNotNil(loadedView)
    }
}
