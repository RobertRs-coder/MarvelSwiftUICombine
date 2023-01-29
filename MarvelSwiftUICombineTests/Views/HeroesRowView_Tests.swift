//
//  HeroesRowView_Tests.swift
//  MarvelSwiftUICombineTests
//
//  Created by Roberto Rojo Sahuquillo on 29/1/23.
//

import XCTest
import ViewInspector

// Naming Structure: test_UnitofWork_StateUnderTest_ExpectBehavior
// Naming Structure: test_[class or struct]_[variable or function]_[expected value]
// Testing Structure: Given, When, Then


final class HeroesRowView_Tests: XCTestCase {

    var view: HeroesRowView?
    

    override func setUpWithError() throws {
        view = HeroesRowView(hero: Hero(id: 1, name: "Hit-Monkey", description: "Something", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4ce69c2246c21", thumbnailExtension: .jpg), resourceURI: ""))
    }

    override func tearDownWithError() throws {
        view = nil
    }

    
    func test_HeroesRowView_Image_ShouldBeExists() throws {
        
        //Given
        
        //Then
        let image = try view.inspect().find(viewWithId: "Image")
        
        //When
        XCTAssertNotNil(image)
    }
    
    func test_HeroesRowView_Text_ShouldBeCorrect() throws {
        //Given
        
        //When
        let label = try view.inspect().find(viewWithId: "Text")
        let textLabel = try label.text().string()
        
        //Then
        XCTAssertNotNil(label)
        XCTAssertEqual(textLabel, "Hit-Monkey")
    }

}
