//
//  _0220803_DanielSpady_XKCD_ComicTests.swift
//  20220803-DanielSpady-XKCD-ComicTests
//
//  Created by Daniel Spady on 2022-08-03.
//

import XCTest
@testable import _0220803_DanielSpady_XKCD_Comic

class _0220803_DanielSpady_XKCD_ComicTests: XCTestCase {
    
    func testCurrentComicResultModel() {
        // Given
        var currentComicResult = CurrentComicResult()
        
        // When
        currentComicResult.alt = "Description Of Comic"
        
        // Then
        XCTAssertNotNil(currentComicResult.alt, "This value is not nil because it has been assigned")
        XCTAssertNil(currentComicResult.title, "This value is nil because it has not been assigned yet")
        XCTAssertNil(currentComicResult.img, "This value is nil because it has not been assigned yet")
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
