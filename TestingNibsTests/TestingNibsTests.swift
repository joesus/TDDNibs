//
//  TestingNibsTests.swift
//  TestingNibsTests
//
//  Created by Joe Susnick on 5/4/17.
//  Copyright © 2017 Joe Susnick. All rights reserved.
//

import XCTest
@testable import TestingNibs

class TestingNibsTests: XCTestCase {
    func testCustomViewContainsAView() {
        let bundle = Bundle(for: CustomView.self)
        
        guard let _ = bundle.loadNibNamed("CustomView", owner: nil)?.first as? UIView else {
            return XCTFail("CustomView nib did not contain a UIView")
        }
    }
    
    func testInitializingWithFrame() {
        let frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        XCTAssertFalse(CustomView(frame: frame).subviews.isEmpty,
                       "CustomView should add subviews from nib when instantiated in code")
    }
    
    func testInitializingWithCoder() {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? ViewController else {
            return XCTFail("Could not instantiate ViewController from Main storyboard")
        }
        
        vc.loadViewIfNeeded()
        
        guard let customView = vc.customView.subviews.first else {
            return XCTFail("ViewController should have outlet set for customView")
        }
        
        XCTAssertEqual(customView.backgroundColor, .red,
                       "CustomView should load from the storyboard with the correct attributes")
    }
    
    func testNibIsIBDesignable() {
        let customView = CustomView()
        
        customView.subviews.forEach { $0.removeFromSuperview() }
        
        XCTAssertEqual(customView.subviews, [],
                       "CustomView should have all subviews removed")
        
        customView.prepareForInterfaceBuilder()
        
        XCTAssertFalse(customView.subviews.isEmpty,
                       "CustomView should add subviews from nib when prepared for interface builder")
    }
}
