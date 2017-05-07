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
        
        guard let _ = bundle.loadNibNamed("CustomView", owner: CustomView().self)?.first as? UIView else {
            return XCTFail("CustomView nib did not contain a UIView")
        }
    }
    
    func testInitializingWithFrame() {
        let frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        XCTAssertFalse(CustomView(frame: frame).subviews.isEmpty,
                       "CustomView should add subviews from nib when instantiated in code")
    }
    
    func testInitializingWithFrameSetsLabel() {
        let frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        guard let _ = CustomView(frame: frame).label else {
            return XCTFail("CustomView should have a label when instantiated from code")
        }
    }
    
    //    func testLabelIsNotSettable() {
    //        let frame = CGRect(x: 0, y: 0, width: 10, height: 10)
    //        let customView = CustomView(frame: frame)
    //        guard let label = customView.label else {
    //            return XCTFail("CustomView should have a label when instantiated from code")
    //        }
    //        label.text = "testing"
    //        XCTAssertEqual(customView.label.text, "testing", "Label on CustomView should be settable")
    //    }
    
    // test label text is settable
        
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
    
    func testInitializingWithCoderSetsLabel() {
        let customView = CustomView()
        
        guard let label = customView.label else {
            return XCTFail("CustomView should load from storyboard with label")
        }
        
        XCTAssertEqual(label.text, "Loaded From Nib",
                       "Label on CustomView should load with text set from the storyboard")
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
