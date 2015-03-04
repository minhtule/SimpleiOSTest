//
//  SimpleTestTests.swift
//  SimpleTestTests
//
//  Created by Minh Tu Le on 3/4/15.
//  Copyright (c) 2015 NUS. All rights reserved.
//

import UIKit
import XCTest

class SimpleTestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSuccess() {
        
        let expectation = expectationWithDescription("success event")
        
        request(.GET, "http://localhost:8000/success")
            .responseJSON { (request, response, data, error) -> Void in
                expectation.fulfill()
                
                XCTAssertEqual(response!.statusCode, 200, "Status code should be 200");
            }
        
        waitForExpectationsWithTimeout(2) { (error) in
            XCTAssertNil(error, "\(error)")
        }
    }
    
    func testError() {
        
        let expectation = expectationWithDescription("error event")
        
        request(.GET, "http://localhost:8000/error")
            .responseJSON { (request, response, data, error) -> Void in
                expectation.fulfill()
                
                XCTAssertEqual(response!.statusCode, 404, "Status code should be 404");
        }
        
        waitForExpectationsWithTimeout(2) { (error) in
            XCTAssertNil(error, "\(error)")
        }
    }
}
