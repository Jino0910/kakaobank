//
//  KakaobankTestTests.swift
//  KakaobankTestTests
//
//  Created by rowkaxl on 04/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import XCTest
@testable import KakaobankTest

class KakaobankTestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testReviewCount() {
        
        XCTAssertTrue(10.toHangulValue() == "10")
        XCTAssertTrue(100.toHangulValue() == "100")
        XCTAssertTrue(1500.toHangulValue() == "1.5천")
        XCTAssertTrue(2650.toHangulValue() == "2.65천")
        XCTAssertTrue(15000.toHangulValue() == "1.5만")
        XCTAssertTrue(56500.toHangulValue() == "5.65만")
        XCTAssertTrue(155500.toHangulValue() == "15.6만")
        XCTAssertTrue(655500.toHangulValue() == "65.6만")
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
