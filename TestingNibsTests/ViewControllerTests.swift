//
//  ViewControllerTests.swift
//  TestingNibs
//
//  Created by Joe Susnick on 5/4/17.
//  Copyright © 2017 Joe Susnick. All rights reserved.
//

import XCTest
@testable import TestingNibs

class ViewControllerTests: XCTestCase {
    func testViewControllerHasCustomView() {
        guard let vc = UIStoryboard(name: "Main", bundle: nil)
            .instantiateInitialViewController() as? ViewController
            else {
                XCTFail("Could not instantiate vc from Main storyboard")
                return
        }
        vc.loadViewIfNeeded()
        
        guard let customView = vc.customView else {
            XCTFail("ViewController should have outlet set for customView")
            return
        }
        let size = CGSize(width: 200, height: 200)
        XCTAssertEqual(customView.frame.size, size,
                       "customView on ViewController should be correct size")
    }
    
}
