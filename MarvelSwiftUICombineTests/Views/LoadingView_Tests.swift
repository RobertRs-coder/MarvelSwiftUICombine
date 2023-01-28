//
//  LoadingView_Tests.swift
//  MarvelSwiftUICombineTests
//
//  Created by Roberto Rojo Sahuquillo on 28/1/23.
//

import SwiftUI
import Combine
import ViewInspector
import XCTest
@testable import MarvelSwiftUICombine


// Naming Structure: test_UnitofWork_StateUnderTest_ExpectBehavior
// Naming Structure: test_[class or struct]_[variable or function]_[expected value]
// Testing Structure: Given, When, Then


final class LoadingView_Tests: XCTestCase {

    func test_LoadingView_Circle_ShouldExists() throws {
        //Given
        let view = LoadingView()
        
        //Then
        let circle = try view.inspect().find(viewWithId: "Circle")
        
        //When
        XCTAssertNotNil(circle)
    }
    
    func test_LoadingView_Text_ShouldBeCorrect() throws {
        // Given
        let view = LoadingView()
        
        // When
        let label = try view.inspect().find(viewWithId: "Text")
        let textLabel = try label.text().string()
        
        // Then
        XCTAssertNotNil(label)
        XCTAssertEqual(textLabel, "Loading")
    }
}
