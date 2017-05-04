//
//  CustomView.swift
//  TestingNibs
//
//  Created by Joe Susnick on 5/4/17.
//  Copyright © 2017 Joe Susnick. All rights reserved.
//

import UIKit

@IBDesignable
class CustomView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        loadNib()
    }
    
    private func loadNib() {
        let bundle = Bundle(for: CustomView.self)
        if let view = bundle.loadNibNamed("CustomView", owner: nil)?.first as? UIView {
            view.frame = bounds
            addSubview(view)
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        loadNib()
    }
}
