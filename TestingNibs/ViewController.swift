//
//  ViewController.swift
//  TestingNibs
//
//  Created by Joe Susnick on 5/4/17.
//  Copyright © 2017 Joe Susnick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var customView: CustomView! {
        didSet {
            customView.label.text = "Bananas"
        }
    }
}

